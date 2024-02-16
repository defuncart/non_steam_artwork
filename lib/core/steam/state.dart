import 'package:non_steam_artwork/core/steam/steam_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'state.g.dart';

@Riverpod(keepAlive: true)
SteamManager steamManager(SteamManagerRef ref) => SteamManager();
