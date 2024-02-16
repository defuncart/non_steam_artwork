import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:native_context_menu/native_context_menu.dart';
import 'package:non_steam_artwork/core/extensions/int_extension.dart';
import 'package:non_steam_artwork/core/extensions/theme_extensions.dart';
import 'package:non_steam_artwork/core/l10n/l10n_extension.dart';
import 'package:non_steam_artwork/core/steam/steam_program.dart';
import 'package:non_steam_artwork/features/home/home_state.dart';

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
          ? Text('No programs')
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

class ProgramView extends StatelessWidget {
  const ProgramView({
    required this.program,
    super.key,
  });

  final SteamProgram program;

  @override
  Widget build(BuildContext context) {
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
              ),
          ],
        ),
      ],
    );
  }
}

class SteamArtwork extends ConsumerWidget {
  const SteamArtwork({
    required this.artType,
    required this.file,
    super.key,
  });

  final SteamGridArtType artType;
  final File? file;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ContextMenuRegion(
      onDismissed: () {},
      onItemSelected: (item) {
        if (item.title == 'Delete') {
          ref.read(deleteArtworkProvider(file: file!));
        } else if (item.title == 'Set as hero') {
          ref.read(copyArtworkProvider(file: file!, artType: SteamGridArtType.hero));
        } else if (item.title == 'Set as background') {
          ref.read(copyArtworkProvider(file: file!, artType: SteamGridArtType.background));
        }
      },
      menuItems: [
        if (file != null)
          MenuItem(
            title: 'Delete',
          ),
        if (file != null && artType == SteamGridArtType.background)
          MenuItem(
            title: 'Set as hero',
          ),
        if (file != null && artType == SteamGridArtType.hero)
          MenuItem(
            title: 'Set as background',
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

enum SteamGridArtType {
  icon(Size(256, 256)),
  cover(Size(600, 900)),
  background(Size(1290, 620)),
  logo(Size(650, 248)),
  hero(Size(1290, 620));

  const SteamGridArtType(this.size);

  final Size size;
}
