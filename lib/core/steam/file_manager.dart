import 'dart:io';

import 'package:io/io.dart';
import 'package:non_steam_artwork/core/logging/logger.dart';
import 'package:path/path.dart' as p;

class FileManager {
  const FileManager(this._logger);

  final Logger _logger;

  Future<void> sync(String from, String to) async {
    if (!await dirExists(from)) {
      _logger.log('$from does not exist');
      return;
    }

    if (await Directory(to).exists()) {
      _logger.log('$to already exists, deleting');
      await Directory(to).delete(recursive: true);
    }

    // copyPath(from, to);
    // https://pub.dev/documentation/io/latest/io/copyPath.html
    // await Directory(to).create(recursive: true);
    // await for (final file in Directory(from).list(recursive: true)) {
    //   final copyTo = p.join(to, p.relative(file.path, from: from));
    //   if (file is Directory) {
    //     await Directory(copyTo).create(recursive: true);
    //   } else if (file is File) {
    //     await File(file.path).copy(copyTo);
    //   } else if (file is Link) {
    //     await Link(copyTo).create(await file.target(), recursive: true);
    //   }
    // }

    return copyPath(from, to);
  }

  Future<bool> dirExists(String path) => Directory(path).exists();

  Future<void> deleteAll(Iterable<File> files) async {
    for (final file in files) {
      await file.delete();
    }
  }

  Future<bool> deleteInWithBasename({
    required String dirPath,
    required String pattern,
  }) async {
    var hasDeletedFile = false;
    if (await Directory(dirPath).exists()) {
      final results = (await Directory(dirPath).list().toList())
          .whereType<File>()
          .where((element) => p.basenameWithoutExtension(element.path) == pattern);
      for (final result in results) {
        await result.delete();
        hasDeletedFile = true;
        _logger.log('deleted ${result.path}');
      }
    }
    return hasDeletedFile;
  }
}
