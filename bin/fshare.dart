import 'package:fshare/fshare.dart' as fshare;

void main(List<String> arguments) async {
  final path = arguments.firstOrNull;

  if (path == null) {
    print('Please add target path');
    return;
  }

  fshare.run(
    targetPath: path,
    onStarted: (address, port) {
      print('Server is running....');
    },
  );
}

extension IterableX<T> on Iterable<T> {
  T? get firstOrNull {
    if (length >= 1) return first;
    return null;
  }
}
