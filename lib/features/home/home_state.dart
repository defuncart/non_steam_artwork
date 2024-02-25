import 'dart:io';
import 'dart:typed_data';

import 'package:clock/clock.dart';
import 'package:collection/collection.dart';
import 'package:non_steam_artwork/core/extensions/file_extension.dart';
import 'package:non_steam_artwork/core/logging/logger.dart';
import 'package:non_steam_artwork/core/settings/sort_program_type.dart';
import 'package:non_steam_artwork/core/settings/state.dart';
import 'package:non_steam_artwork/core/steam/file_manager.dart';
import 'package:non_steam_artwork/core/steam/state.dart';
import 'package:non_steam_artwork/core/steam/steam_program.dart';
import 'package:non_steam_artwork/core/steamgriddb/state.dart';
import 'package:non_steam_artwork/features/home/steam_grid_art_type.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_state.g.dart';

@Riverpod(keepAlive: true)
FileManager _fileManager(_FileManagerRef ref) => FileManager(ref.read(loggerProvider));

@riverpod
class CacheController extends _$CacheController {
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
    // final gridPath = ref.read(steamManagerProvider).gridPath;
    // TODO: Does not works on Arch
    // launchUrl(Uri.file(gridPath));

    // TODO: Also not working
    // Process.run(
    // 'dolphin',
    // [gridPath],
    // workingDirectory: gridPath,
    // );
  }
}

@Riverpod(keepAlive: true)
class SearchController extends _$SearchController {
  @override
  String build() => '';

  void updateSearch(String searchTerm) {
    if (searchTerm != state) {
      state = searchTerm;
    }
  }
}

@riverpod
class SteamPrograms extends _$SteamPrograms {
  @override
  FutureOr<Iterable<SteamProgram>> build() async {
    final types = ref.watch(filteredProgramTypesControllerProvider);
    final validTypes = types.entries.map((kvp) => kvp.value ? kvp.key : null).whereType<SteamProgramType>();
    var filteredPrograms = await ref.read(steamManagerProvider).getPrograms(validTypes);

    final searchTerm = ref.watch(searchControllerProvider);
    if (searchTerm.isNotEmpty) {
      filteredPrograms = filteredPrograms.where((program) => program.appName.contains(searchTerm));
    }

    final sortType = ref.watch(sortProgramTypeControllerProvider);
    if (sortType == SortProgramType.alphabetic) {
      filteredPrograms = filteredPrograms.sorted((a, b) => a.appName.toLowerCase().compareTo(b.appName.toLowerCase()));
    } else if (sortType == SortProgramType.programId) {
      filteredPrograms = filteredPrograms.sorted((a, b) => a.appId.compareTo(b.appId));
    }

    ref.log(
      'steamPrograms types ${validTypes.map((t) => t.name)}, searchTerm: ${searchTerm.isEmpty ? '[EMPTY]' : searchTerm}, sortType: ${sortType.name} | ${filteredPrograms.length} found',
    );

    return filteredPrograms;
  }
}

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
Future<void> createArtworkFile(
  CreateArtworkFileRef ref, {
  required int appId,
  required File file,
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

  await file.copy(filepath);
  ref.log('artwork $filepath created');

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

@riverpod
Future<Iterable<String>> gameHeroes(
  GameHeroesRef ref, {
  required String gameId,
}) async {
  final result = await ref.read(steamGridDBClientProvider).getHeroesForGame(gameId);
  return result.map((grid) => grid.url);
}
