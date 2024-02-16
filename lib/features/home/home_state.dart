import 'dart:developer' show log;
import 'dart:io';

import 'package:non_steam_artwork/core/extensions/file_extension.dart';
import 'package:non_steam_artwork/core/steam/state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_state.g.dart';

@riverpod
class FreeCache extends _$FreeCache {
  Iterable<File> _data = const Iterable<File>.empty();

  Future<int> _determineBytesUnusedInCache() async {
    _data = await ref.read(steamManagerProvider).determineUnusedCache();
    return _data.totalBytes;
  }

  @override
  FutureOr<int> build() async {
    try {
      return await _determineBytesUnusedInCache();
    } catch (e) {
      log(e.toString());
      return 0;
    }
  }
}
