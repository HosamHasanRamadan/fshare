import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:intranet_ip/intranet_ip.dart';
import 'package:qr/qr.dart';
import 'package:shelf_plus/shelf_plus.dart';

const blackWhite = '▄';
const blackBlack = ' ';
const whiteBlack = '▀';
const whiteWhite = '█';

late final String urlPath;
late final File targetFile;

Future<void> run({
  required String targetPath,
}) async {
  final file = File(targetPath);
  final isValid = await file.exists();
  if (isValid == false) {
    print('No file in this path');
    return;
  }

  targetFile = file;
  final randomInt = Random().nextInt;
  final privateIp = (await intranetIpv4()).address;
  final port = randomInt(9999);
  final randomNumber = randomInt(9999);
  urlPath = '$randomNumber';
  final link = 'http://$privateIp:$port/$urlPath';

  print('Scan the following Qr Code to download your file.');
  print(link);

  await shelfRun(
    init,
    defaultBindAddress: privateIp,
    defaultBindPort: port,
    defaultEnableHotReload: false,
  );

  final qrText = generateQrCode(
    link,
  );

  print(qrText);
}

String generateQrCode(
  String data, {
  int vPadding = 2,
  int hPadding = 4,
}) {
  final qr = QrCode(
    2,
    QrErrorCorrectLevel.L,
  )..addData(data);
  final qrImage = QrImage(qr);

  final qrBuffer = StringBuffer();

  for (int p = 0; p < vPadding; p++) {
    qrBuffer.writeln(whiteWhite * (qrImage.moduleCount + hPadding * 2));
  }

  for (var row = 0; row < qrImage.moduleCount; row += 2) {
    qrBuffer.write(whiteWhite * hPadding);
    for (var col = 0; col < qrImage.moduleCount; col++) {
      final top = qrImage.isDark(row, col);

      final btm =
          row + 1 == qrImage.moduleCount ? false : qrImage.isDark(row + 1, col);
      if (top && btm)
        qrBuffer.write(blackBlack);
      else if (top && !btm)
        qrBuffer.write(blackWhite);
      else if (!top && btm)
        qrBuffer.write(whiteBlack);
      else if (!top && !btm) qrBuffer.write(whiteWhite);
    }
    qrBuffer.write(whiteWhite * hPadding);

    qrBuffer.writeln();
  }
  for (int p = 0; p < vPadding; p++) {
    qrBuffer.writeln(whiteWhite * (qrImage.moduleCount + hPadding * 2));
  }

  return qrBuffer.toString();
}

Handler init() {
  final fileName = targetFile.absolute.uri.pathSegments.last;
  final router = Router().plus;
  router.get(
    '/$urlPath',
    () => targetFile,
    use: download(filename: fileName),
  );
  return router;
}
