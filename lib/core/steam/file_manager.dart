import 'dart:io';

class FileManager {
  const FileManager();

  Future<void> deleteAll(Iterable<File> files) async {
    for (final file in files) {
      await file.delete();
    }
  }
}
