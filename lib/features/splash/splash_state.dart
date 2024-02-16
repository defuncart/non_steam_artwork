import 'package:non_steam_artwork/core/steam/state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash_state.g.dart';

@riverpod
Future<bool> splashState(SplashStateRef ref) async {
  await ref.read(steamManagerProvider).init();
  return true;
}
