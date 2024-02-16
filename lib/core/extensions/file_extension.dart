import 'dart:io';

extension FileExtension on Iterable<File> {
  int get totalBytes => fold(0, (previousValue, element) => previousValue + element.lengthSync());
}
