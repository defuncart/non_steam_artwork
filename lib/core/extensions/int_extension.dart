import 'dart:math';

extension IntExtension on int {
  /// Returns a human readable string of bytes length
  ///
  /// Taken from https://stackoverflow.com/a/66473018
  String get displaySize {
    const suffixes = ['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];
    final i = (log(this) / log(1024)).floor();
    return '${(this / pow(1024, i)).toStringAsFixed(1)} ${suffixes[i]}';
  }
}
