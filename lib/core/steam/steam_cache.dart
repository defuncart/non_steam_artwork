import 'dart:io';

import 'package:collection/collection.dart';
import 'package:path/path.dart' as p;

class SteamGridCache {
  const SteamGridCache(this.path);

  final String path;

  Future<List<CacheProgramArtwork>> getCacheArtwork() async {
    final dir = Directory(path);
    if (await dir.exists()) {
      final contents = (await dir.list().toList()).whereType<File>().where((file) => file.isImage).toList();
      contents.sort((a, b) => p.basename(a.path).compareTo(p.basename(b.path)));

      const steamAppIdLength = 10;
      // match group0 1234567890p, group1 1234567890 group2 0
      final idRegEx = RegExp(r'^(\d{10})(p||_hero||_logo||_icon)*$');

      // create a map of files whose key is appId
      final mapped = groupBy(
        contents,
        (file) => idRegEx.firstMatch(p.basenameWithoutExtension(file.path))?.group(1) ?? '',
      );
      mapped.removeWhere((key, value) => key.isEmpty);

      final programs = <CacheProgramArtwork>[];
      for (final kvp in mapped.entries) {
        final icon = kvp.value.firstWhereOrNull((file) => p.basenameWithoutExtension(file.path).contains('_icon'));
        final cover = kvp.value.firstWhereOrNull((file) => p.basenameWithoutExtension(file.path).contains('p'));
        final hero = kvp.value.firstWhereOrNull((file) => p.basenameWithoutExtension(file.path).contains('_hero'));
        final logo = kvp.value.firstWhereOrNull((file) => p.basenameWithoutExtension(file.path).contains('_logo'));
        final banner = kvp.value.firstWhereOrNull(
          (file) => p.basenameWithoutExtension(file.path).length == steamAppIdLength,
        );
        programs.add((
          id: int.parse(kvp.key),
          icon: icon,
          cover: cover,
          hero: hero,
          logo: logo,
          banner: banner,
        ));
      }
      return programs;
    }

    return [];
  }
}

typedef CacheProgramArtwork = ({int id, File? icon, File? cover, File? hero, File? logo, File? banner});

extension on File {
  bool get isImage {
    final ext = p.extension(path).toLowerCase();
    return ext == '.jpg' || ext == '.png' || ext == '.ico';
  }
}
