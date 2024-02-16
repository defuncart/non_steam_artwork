import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:native_context_menu/native_context_menu.dart';
import 'package:non_steam_artwork/core/extensions/int_extension.dart';
import 'package:non_steam_artwork/core/extensions/theme_extensions.dart';
import 'package:non_steam_artwork/core/l10n/l10n_extension.dart';
import 'package:non_steam_artwork/core/steam/steam_program.dart';
import 'package:non_steam_artwork/features/home/home_state.dart';
import 'package:non_steam_artwork/features/home/steam_grid_art_type.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CleanUpCacheView(),
            Expanded(
              child: ProgramsView(),
            ),
          ],
        ),
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

@visibleForTesting
class ProgramsView extends ConsumerWidget {
  const ProgramsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(steamProgramsProvider);

    return switch (state) {
      AsyncData(:final value) => value.isEmpty
          ? Text(context.l10n.homeProgramsEmpty)
          : ListView.builder(
              shrinkWrap: true,
              itemCount: value.length,
              itemBuilder: (context, index) => ProgramView(
                program: value.toList()[index],
              ),
            ),
      _ => const SizedBox.shrink(),
    };
  }
}

class ProgramView extends ConsumerWidget {
  const ProgramView({
    required this.program,
    super.key,
  });

  final SteamProgram program;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          program.appName,
        ),
        Wrap(
          spacing: 4,
          runSpacing: 4,
          children: [
            for (final artType in SteamGridArtType.values)
              SteamArtwork(
                artType: artType,
                file: switch (artType) {
                  SteamGridArtType.icon => program.icon,
                  SteamGridArtType.cover => program.cover,
                  SteamGridArtType.background => program.background,
                  SteamGridArtType.logo => program.logo,
                  SteamGridArtType.hero => program.hero,
                },
                onDeleteFile: (file) => ref.read(deleteArtworkProvider(file: file)),
                onCopyFile: (file, artType) => ref.read(copyArtworkProvider(file: file, artType: artType)),
              ),
          ],
        ),
      ],
    );
  }
}

class SteamArtwork extends StatelessWidget {
  const SteamArtwork({
    required this.artType,
    required this.file,
    required this.onDeleteFile,
    required this.onCopyFile,
    super.key,
  });

  final SteamGridArtType artType;
  final File? file;
  final void Function(File) onDeleteFile;
  final void Function(File, SteamGridArtType) onCopyFile;

  @override
  Widget build(BuildContext context) {
    return ContextMenuRegion(
      onDismissed: () {},
      onItemSelected: (item) {
        if (item.title == context.l10n.homeProgramArtworkDelete) {
          onDeleteFile(file!);
        } else if (item.title == context.l10n.homeProgramArtworkSetBackgroundAsHero) {
          onCopyFile(file!, SteamGridArtType.hero);
        } else if (item.title == context.l10n.homeProgramArtworkSetHeroAsBackground) {
          onCopyFile(file!, SteamGridArtType.background);
        }
      },
      menuItems: [
        if (file != null)
          MenuItem(
            title: context.l10n.homeProgramArtworkDelete,
          ),
        if (file != null && artType == SteamGridArtType.background)
          MenuItem(
            title: context.l10n.homeProgramArtworkSetBackgroundAsHero,
          ),
        if (file != null && artType == SteamGridArtType.hero)
          MenuItem(
            title: context.l10n.homeProgramArtworkSetHeroAsBackground,
          ),
      ],
      child: SizedBox(
        width: artType.size.width * 0.25,
        height: artType.size.height * 0.25,
        child: file != null
            ? Image.file(file!)
            : ColoredBox(
                color: context.colorScheme.tertiary,
                child: Icon(
                  Icons.broken_image,
                  size: artType.size.width * 0.25 * 0.25,
                  color: context.colorScheme.onTertiary,
                ),
              ),
      ),
    );
  }
}
