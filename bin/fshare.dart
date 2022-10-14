import 'dart:async';
import 'dart:io';
import 'package:fshare/fshare.dart' as fshare;

void main(List<String> arguments) async {
  final path = arguments.firstOrNull;

  if (path == null) {
    stderr.writeln('Please add target path');
    return;
  }
  runZonedGuarded(
    () {
      fshare.run(
        targetPath: path,
        onStarted: (address, port) {
          stdout.writeln('Server is running....');
        },
      );
    },
    (exception, _) {
      if (exception is SocketException) {
        stderr.writeln('Error: ${exception.message}');
        stderr.writeln('Address: ${exception.address?.address}');
        stderr.writeln('Port: ${exception.port}');
        return;
      }
      stderr.writeln('Error: ${exception.toString()}');
    },
  );
}

extension IterableX<T> on Iterable<T> {
  T? get firstOrNull {
    if (length >= 1) return first;
    return null;
  }
}
