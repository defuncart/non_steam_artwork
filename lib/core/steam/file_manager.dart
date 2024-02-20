import 'dart:io';

import 'package:path/path.dart' as p;

class FileManager {
  const FileManager();

  Future<void> deleteAll(Iterable<File> files) async {
    for (final file in files) {
      await file.delete();
    }
  }

  Future<void> deleteInWithBasename({
    required String dirPath,
    required String pattern,
  }) async {
    if (await Directory(dirPath).exists()) {
      final results = (await Directory(dirPath).list().toList())
          .whereType<File>()
          .where((element) => p.basenameWithoutExtension(element.path) == pattern);
      for (final result in results) {
        await result.delete();
      }
    }
  }
}
