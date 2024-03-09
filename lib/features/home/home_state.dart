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
import 'package:steamgriddb/steamgriddb.dart';

part 'home_state.g.dart';

@Riverpod(keepAlive: true)
FileManager _fileManager(_FileManagerRef ref) => FileManager(ref.read(loggerProvider));

@riverpod
class SteamFolderExistsController extends _$SteamFolderExistsController {
  @override
  FutureOr<bool> build() async {
    await ref.read(steamManagerProvider).getShortcuts();
    return true;
  }
}

@Riverpod(keepAlive: true)
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

@riverpod
Future<bool> cacheBackupExistsController(CacheBackupExistsControllerRef ref) async {
  final syncPath = p.join(
    (await getApplicationDocumentsDirectory()).path,
    'non_steam_artwork',
    'grid_backup',
  );
  final dir = Directory(syncPath);
  if (!await dir.exists()) {
    return false;
  }

  final contents = (await dir.list().toList()).whereType<Directory>();
  return contents.isNotEmpty;
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
      filteredPrograms = filteredPrograms.where(
        (program) => program.appName.toLowerCase().contains(searchTerm.toLowerCase()),
      );
    }

    final sortType = ref.watch(sortProgramTypeControllerProvider);
    if (sortType == SortProgramType.alphabetic) {
      filteredPrograms = filteredPrograms.sorted((a, b) => a.appName.toLowerCase().compareTo(b.appName.toLowerCase()));
    } else if (sortType == SortProgramType.programId) {
      filteredPrograms = filteredPrograms.sorted((a, b) => a.appId.compareTo(b.appId));
    }

    final isAscending = ref.watch(sortingAscendingControllerProvider);
    if (!isAscending) {
      filteredPrograms = filteredPrograms.toList().reversed;
    }

    ref.log(
      'steamPrograms types ${validTypes.map((t) => t.name)}, searchTerm: ${searchTerm.isEmpty ? '[EMPTY]' : searchTerm}, sortType: ${sortType.name}, isAscending: $isAscending | ${filteredPrograms.length} found',
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

  final fullpath = p.join(dir, '$filename$fileExt');
  final hasDeletedFile = await ref.read(_fileManagerProvider).deleteInWithBasename(dirPath: dir, pattern: filename);
  if (hasDeletedFile) {
    ref.read(_replacedFilesControllerProvider.notifier).add(fullpath);
  }

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
  final filepath = p.join(dir, '$basename$ext');
  final hasDeletedFile = await ref.read(_fileManagerProvider).deleteInWithBasename(dirPath: dir, pattern: basename);
  if (hasDeletedFile) {
    ref.read(_replacedFilesControllerProvider.notifier).add(filepath);
  }

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
  final filepath = p.join(dir, '$basename$ext');
  final file = File(filepath);
  final hasDeletedFile = await ref.read(_fileManagerProvider).deleteInWithBasename(dirPath: dir, pattern: basename);
  if (hasDeletedFile) {
    ref.read(_replacedFilesControllerProvider.notifier).add(filepath);
  }

  final bytes = await bytesStream.toList();
  await file.writeAsBytes(bytes.first, mode: FileMode.writeOnly);
  ref.log('artwork $filepath created');

  ref.invalidate(steamProgramsProvider);
}

@riverpod
class _ReplacedFilesController extends _$ReplacedFilesController {
  @override
  List<String> build() => [];

  void add(String path) {
    final newState = List<String>.from(state);
    newState.add(path);
    state = newState;
  }

  void remove(String path) {
    final newState = List<String>.from(state);
    newState.remove(path);
    state = newState;
  }
}

@riverpod
class WasFileReplacedController extends _$WasFileReplacedController {
  @override
  bool build(String path) => ref.watch(_replacedFilesControllerProvider).contains(path);
}

typedef DownloadableArtwork = ({
  String url,
  String thumbnail,
});

typedef DownloadableArtworkState = ({
  String searchTerm,
  Iterable<ProgramSearchResult> programResults,
  int? selectedProgram,
  Iterable<DownloadableArtwork> downloadableArtworks,
});

typedef ProgramSearchResult = ({
  int id,
  String name,
});

@riverpod
class DownloadableArtworkController extends _$DownloadableArtworkController {
  var _searchTerm = '';
  Iterable<ProgramSearchResult> _programResults = <ProgramSearchResult>[];
  int? _selectedProgram;
  Iterable<DownloadableArtwork> _downloadableArtworks = <DownloadableArtwork>[];

  @override
  Future<DownloadableArtworkState> build({
    required String initialSearchTerm,
    required SteamGridArtType artType,
  }) {
    _searchTerm = initialSearchTerm;
    return _getProgramsForSearchTerm();
  }

  Future<DownloadableArtworkState> _getProgramsForSearchTerm() async {
    ref.log('getting programs for $_searchTerm');

    _selectedProgram = null;
    _programResults = [];
    _downloadableArtworks = [];

    final gameResults = await ref.read(steamGridDBClientProvider).getGamesBySearchTerm(_searchTerm);
    ref.log('${gameResults.length} result(s) found');
    ref.log(gameResults.map((e) => e.name).toList().toString());
    _programResults = gameResults.map((e) => (id: e.id, name: e.name));

    if (_programResults.isNotEmpty) {
      _selectedProgram = gameResults.first.id;
      await _getArtworkForSelectedProgram();
    }
    // else {
    //   throw Exception('No artwork found');
    // }

    // if (artworkResults.isEmpty) {
    //   throw Exception('No artwork found');
    // }

    return (
      searchTerm: _searchTerm,
      programResults: _programResults,
      selectedProgram: _selectedProgram,
      downloadableArtworks: _downloadableArtworks,
    );
  }

  Future<void> _getArtworkForSelectedProgram() async {
    assert(_selectedProgram != null);

    final gameId = _selectedProgram!.toString();
    ref.log('getting artwork for $_selectedProgram');

    final List<Grid> artworkResults;
    switch (artType) {
      case SteamGridArtType.background:
        artworkResults = await ref.read(steamGridDBClientProvider).getHeroesForGame(gameId);
      case SteamGridArtType.hero:
        artworkResults = await ref.read(steamGridDBClientProvider).getHeroesForGame(gameId);
      case SteamGridArtType.cover:
        artworkResults = await ref.read(steamGridDBClientProvider).getCoversForGame(gameId);
      case SteamGridArtType.icon:
        artworkResults = await ref.read(steamGridDBClientProvider).getIconsForGame(gameId);
      case SteamGridArtType.logo:
        artworkResults = await ref.read(steamGridDBClientProvider).getLogosForGame(gameId);
    }
    _downloadableArtworks = artworkResults.map((artwork) => (url: artwork.url, thumbnail: artwork.thumb));
  }

  Future<void> updateSearchTerm(String searchTerm) async {
    if (searchTerm.isNotEmpty && _searchTerm != searchTerm) {
      _searchTerm = searchTerm;
      state = const AsyncValue.loading();
      state = await AsyncValue.guard(_getProgramsForSearchTerm);
    }
  }

  Future<void> updateSelectedProgram(int selectedProgram) async {
    if (_selectedProgram != selectedProgram && _programResults.map((e) => e.id).contains(selectedProgram)) {
      _selectedProgram = selectedProgram;
      state = const AsyncValue.loading();

      state = await AsyncValue.guard(() async {
        await _getArtworkForSelectedProgram();

        return (
          searchTerm: _searchTerm,
          programResults: _programResults,
          selectedProgram: _selectedProgram,
          downloadableArtworks: _downloadableArtworks,
        );
      });
    }
  }
}
