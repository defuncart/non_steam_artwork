import 'dart:io';
import 'dart:typed_data';

import 'package:clock/clock.dart';
import 'package:non_steam_artwork/core/extensions/file_extension.dart';
import 'package:non_steam_artwork/core/logging/logger.dart';
import 'package:non_steam_artwork/core/steam/file_manager.dart';
import 'package:non_steam_artwork/core/steam/state.dart';
import 'package:non_steam_artwork/core/steam/steam_program.dart';
import 'package:non_steam_artwork/features/home/steam_grid_art_type.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:url_launcher/url_launcher.dart';

part 'home_state.g.dart';

@Riverpod(keepAlive: true)
FileManager _fileManager(_FileManagerRef ref) => FileManager(ref.read(loggerProvider));

@riverpod
class FreeCache extends _$FreeCache {
  Iterable<File> _data = const Iterable<File>.empty();

  Future<int> _determineBytesUnusedInCache() async {
    try {
      _data = await ref.read(steamManagerProvider).determineUnusedCache();
      return _data.totalBytes;
    } catch (e) {
      ref.log('_determineBytesUnusedInCache exception $e');
      return 0;
    }
  }

  @override
  FutureOr<int> build() => _determineBytesUnusedInCache();

  Future<void> cleanUp() async {
    state = const AsyncValue.loading();
    await ref.read(_fileManagerProvider).deleteAll(_data);
    ref.log('cleaned up cache');
    state = await AsyncValue.guard(_determineBytesUnusedInCache);
  }

  Future<void> deleteAll() async {
    state = const AsyncValue.loading();
    await ref.read(steamManagerProvider).deleteCache();
    ref.log('deleted cache');
    ref.invalidate(steamProgramsProvider);
    state = await AsyncValue.guard(_determineBytesUnusedInCache);
  }

  Future<void> backup() async {
    state = const AsyncValue.loading();

    final gridPath = ref.read(steamManagerProvider).gridPath;
    final syncPath = p.join(
      (await getApplicationDocumentsDirectory()).path,
      'non_steam_artwork',
      'grid_backup',
      clock.now().toUtc().toString().replaceAll(':', '-'),
    );

    ref.log('grid backup from $gridPath to $syncPath');

    final a = Stopwatch()..start();
    await ref.read(_fileManagerProvider).sync(gridPath, syncPath);
    a.stop();

    ref.log('backup completed, took ${a.elapsedMilliseconds}ms');

    state = await AsyncValue.guard(_determineBytesUnusedInCache);
  }

  void open() {
    final gridPath = ref.read(steamManagerProvider).gridPath;
    // TODO: Test if works on Arch
    launchUrl(Uri.file(gridPath));

    // Process.run(
    //   'dolphin',
    //   [gridPath],
    //   workingDirectory: gridPath,
    // );
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
  ref.log('deleted artwork ${file.path}');
  ref.invalidate(steamProgramsProvider);
}

@riverpod
Future<void> copyArtwork(
  CopyArtworkRef ref, {
  required File file,
  required SteamGridArtType artType,
}) async {
  assert(artType == SteamGridArtType.hero || artType == SteamGridArtType.background);

  ref.log('start copy ${file.path} as ${artType.name}');

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
  ref.log('artwork copied to $fullpath');
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
  ref.log('start create ${artType.name} for $appId with extension $ext');
  final (dir, basename) = await ref.read(steamManagerProvider).generateArtworkPath(
        appId: appId,
        artType: artType,
      );
  await ref.read(_fileManagerProvider).deleteInWithBasename(dirPath: dir, pattern: basename);
  final filepath = p.join(dir, '$basename$ext');
  final file = File(filepath);

  final bytes = await bytesStream.toList();
  await file.writeAsBytes(bytes.first, mode: FileMode.writeOnly);
  ref.log('artwork $filepath created');

  ref.invalidate(steamProgramsProvider);
}
