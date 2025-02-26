import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:non_steam_artwork/core/steam/state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:steam_shortcuts_util/steam_shortcuts_util.dart';

part 'viewer_state.g.dart';

@riverpod
Future<List<SteamShortcut>> getShortcuts(Ref ref) => ref.read(steamManagerProvider).getShortcuts();
