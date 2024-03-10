import 'package:non_steam_artwork/core/settings/state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:steamgriddb/steamgriddb.dart';

part 'state.g.dart';

@riverpod
SteamGridDB steamGridDBClient(SteamGridDBClientRef ref) {
  final apiKey = ref.watch(steamGridDBApiKeyControllerProvider);

  return SteamGridDB(apiKey ?? '');
}
