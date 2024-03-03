import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:non_steam_artwork/core/extensions/int_extension.dart';
import 'package:non_steam_artwork/core/extensions/theme_extensions.dart';
import 'package:non_steam_artwork/core/l10n/l10n_extension.dart';
import 'package:non_steam_artwork/core/settings/state.dart';
import 'package:non_steam_artwork/features/home/home_state.dart';
import 'package:non_steam_artwork/features/support/steamgriddb_dialog.dart';

class HomeTipsPanel extends StatelessWidget {
  const HomeTipsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: BackupUpCacheView(),
        ),
        Flexible(
          child: CleanUpCacheView(),
        ),
        Flexible(
          child: AddApiKeyView(),
        ),
      ],
    );
  }
}

@visibleForTesting
class BackupUpCacheView extends ConsumerWidget {
  const BackupUpCacheView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(cacheBackupExistsControllerProvider);

    return switch (state) {
      AsyncData(:final value) => value
          ? const SizedBox.shrink()
          : TipCard(
              backgroundColor: context.colorScheme.primaryContainer,
              foregroundColor: context.colorScheme.onPrimaryContainer,
              title: context.l10n.homeTipsBackupCacheDescription,
              buttonIcon: Icons.backup,
              buttonLabel: context.l10n.homeTipsBackupCacheButton,
              onButtonPressed: () async {
                await ref.read(cacheControllerProvider.notifier).backup();
                ref.invalidate(cacheBackupExistsControllerProvider);
              },
            ),
      _ => const SizedBox.shrink(),
    };
  }
}

@visibleForTesting
class CleanUpCacheView extends ConsumerWidget {
  const CleanUpCacheView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(cacheControllerProvider);

    return switch (state) {
      AsyncData(:final value) => value == 0
          ? const SizedBox.shrink()
          : TipCard(
              backgroundColor: context.colorScheme.secondaryContainer,
              foregroundColor: context.colorScheme.onSecondaryContainer,
              title: context.l10n.homeTipsCleanUpCacheDescription(value.displaySize),
              buttonIcon: Icons.delete_sweep_rounded,
              buttonLabel: context.l10n.homeTipsCleanUpCacheButton,
              onButtonPressed: ref.read(cacheControllerProvider.notifier).cleanUp,
            ),
      _ => const SizedBox.shrink(),
    };
  }
}

@visibleForTesting
class AddApiKeyView extends ConsumerWidget {
  const AddApiKeyView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(steamGridDBApiKeyControllerProvider);

    return state == null
        ? TipCard(
            backgroundColor: context.colorScheme.errorContainer,
            foregroundColor: context.colorScheme.onErrorContainer,
            title: context.l10n.homeTipsAddApiKeyDescription,
            buttonIcon: Icons.language,
            buttonLabel: context.l10n.homeTipsAddApiKeyButton,
            onButtonPressed: () => SteamGridDBDialog.show(context),
          )
        : const SizedBox.shrink();
  }
}

@visibleForTesting
class TipCard extends StatelessWidget {
  const TipCard({
    required this.backgroundColor,
    required this.foregroundColor,
    required this.title,
    required this.buttonIcon,
    required this.buttonLabel,
    required this.onButtonPressed,
    super.key,
  });

  final Color backgroundColor;
  final Color foregroundColor;
  final String title;
  final IconData buttonIcon;
  final String buttonLabel;
  final VoidCallback onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title),
            const SizedBox(height: 16),
            Theme(
              data: Theme.of(context).copyWith(
                colorScheme: Theme.of(context).colorScheme.copyWith(
                      primary: foregroundColor,
                    ),
              ),
              child: TextButton.icon(
                onPressed: onButtonPressed,
                icon: Icon(buttonIcon),
                label: Text(buttonLabel),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
