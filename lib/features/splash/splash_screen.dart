import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:non_steam_artwork/features/home/home_screen.dart';
import 'package:non_steam_artwork/features/splash/splash_state.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(splashStateProvider);

    return switch (state) {
      AsyncData() => const HomeScreen(),
      _ => const SizedBox.shrink(),
    };
  }
}
