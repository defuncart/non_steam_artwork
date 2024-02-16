import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:non_steam_artwork/features/home/home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CleanUpCacheView(),
      ),
    );
  }
}

class CleanUpCacheView extends ConsumerWidget {
  const CleanUpCacheView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(freeCacheProvider);

    return switch (state) {
      AsyncData(:final value) => Text(value.toString()),
      _ => const SizedBox.shrink(),
    };
  }
}
