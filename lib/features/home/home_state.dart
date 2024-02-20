import 'dart:developer' show log;
import 'dart:io';
import 'dart:typed_data';

import 'package:non_steam_artwork/core/extensions/file_extension.dart';
import 'package:non_steam_artwork/core/steam/file_manager.dart';
import 'package:non_steam_artwork/core/steam/state.dart';
import 'package:non_steam_artwork/core/steam/steam_program.dart';
import 'package:non_steam_artwork/features/home/steam_grid_art_type.dart';
import 'package:path/path.dart' as p;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_state.g.dart';

@Riverpod(keepAlive: true)
FileManager _fileManager(_FileManagerRef ref) => const FileManager();

@riverpod
class FreeCache extends _$FreeCache {
  Iterable<File> _data = const Iterable<File>.empty();

  Future<int> _determineBytesUnusedInCache() async {
    try {
      _data = await ref.read(steamManagerProvider).determineUnusedCache();
      return _data.totalBytes;
    } catch (e) {
      log(e.toString());
      return 0;
    }
  }

  @override
  FutureOr<int> build() => _determineBytesUnusedInCache();

  FutureOr<void> cleanUp() async {
    state = const AsyncValue.loading();
    await ref.read(_fileManagerProvider).deleteAll(_data);
    state = await AsyncValue.guard(_determineBytesUnusedInCache);
  }

  FutureOr<void> deleteAll() async {
    state = const AsyncValue.loading();
    await ref.read(steamManagerProvider).deleteCache();
    ref.invalidate(steamProgramsProvider);
    state = await AsyncValue.guard(_determineBytesUnusedInCache);
  }
}

@riverpod
Future<Iterable<SteamProgram>> steamPrograms(SteamProgramsRef ref) => ref.read(steamManagerProvider).getPrograms();

@riverpod
Future<void> deleteArtwork(
  DeleteArtworkRef ref, {
  required File file,
}) async {
  await file.delete();
  ref.invalidate(steamProgramsProvider);
}

@riverpod
Future<void> copyArtwork(
  CopyArtworkRef ref, {
  required File file,
  required SteamGridArtType artType,
}) async {
  assert(artType == SteamGridArtType.hero || artType == SteamGridArtType.background);

  final dir = p.dirname(file.path);
  final fileExt = p.extension(file.path);
  var filename = p.basenameWithoutExtension(file.path);
  if (artType == SteamGridArtType.hero) {
    filename += '_hero';
  } else {
    filename = filename.replaceAll('_hero', '');
  }
  await ref.read(_fileManagerProvider).deleteInWithBasename(dirPath: dir, pattern: filename);
  final fullpath = p.join(dir, '$filename$fileExt');

  await file.copy(fullpath);
  ref.invalidate(steamProgramsProvider);
}

@riverpod
Future<void> createArtwork(
  CreateArtworkRef ref, {
  required int appId,
  required Stream<Uint8List> bytesStream,
  required String ext,
  required SteamGridArtType artType,
}) async {
  final (dir, basename) = await ref.read(steamManagerProvider).generateArtworkPath(
        appId: appId,
        artType: artType,
      );
  await ref.read(_fileManagerProvider).deleteInWithBasename(dirPath: dir, pattern: basename);
  final filepath = p.join(dir, '$basename$ext');
  final file = File(filepath);

  final bytes = await bytesStream.toList();
  await file.writeAsBytes(bytes.first, mode: FileMode.writeOnly);

  ref.invalidate(steamProgramsProvider);
}
