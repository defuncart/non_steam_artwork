import 'dart:developer' show log;
import 'dart:io';

import 'package:non_steam_artwork/core/extensions/file_extension.dart';
import 'package:non_steam_artwork/core/steam/file_manager.dart';
import 'package:non_steam_artwork/core/steam/state.dart';
import 'package:non_steam_artwork/core/steam/steam_program.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_state.g.dart';

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
    await const FileManager().deleteAll(_data);
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
