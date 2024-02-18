import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:non_steam_artwork/core/extensions/int_extension.dart';
import 'package:non_steam_artwork/core/extensions/theme_extensions.dart';
import 'package:non_steam_artwork/core/l10n/l10n_extension.dart';
import 'package:non_steam_artwork/features/home/home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CleanUpCacheView(),
      ),
      floatingActionButton: DeleteAllCacheButton(),
    );
  }
}

@visibleForTesting
class DeleteAllCacheButton extends ConsumerWidget {
  const DeleteAllCacheButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton.small(
      onPressed: ref.read(freeCacheProvider.notifier).deleteAll,
      child: const Icon(Icons.delete_forever),
    );
  }
}

@visibleForTesting
class CleanUpCacheView extends ConsumerWidget {
  const CleanUpCacheView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(freeCacheProvider);

    return switch (state) {
      AsyncData(:final value) => value == 0
          ? const SizedBox.shrink()
          : Card(
              color: context.colorScheme.secondaryContainer,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      context.l10n.homeCleanUpCacheDescription(value.displaySize),
                    ),
                    const SizedBox(height: 16),
                    TextButton.icon(
                      onPressed: ref.read(freeCacheProvider.notifier).cleanUp,
                      icon: const Icon(Icons.delete_sweep_rounded),
                      label: Text(context.l10n.homeCleanUpCacheButton),
                    ),
                  ],
                ),
              ),
            ),
      _ => const SizedBox.shrink(),
    };
  }
}
