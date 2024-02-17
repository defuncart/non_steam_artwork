import 'dart:developer' show log;
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:native_context_menu/native_context_menu.dart';
import 'package:non_steam_artwork/core/extensions/int_extension.dart';
import 'package:non_steam_artwork/core/extensions/theme_extensions.dart';
import 'package:non_steam_artwork/core/l10n/l10n_extension.dart';
import 'package:non_steam_artwork/core/steam/steam_program.dart';
import 'package:non_steam_artwork/features/home/home_state.dart';
import 'package:non_steam_artwork/features/home/steam_grid_art_type.dart';
import 'package:super_drag_and_drop/super_drag_and_drop.dart';

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

@visibleForTesting
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
                onCreateFile: (bytesStream) => bytesStream.first.then((value) => print(value)),
              ),
          ],
        ),
      ],
    );
  }
}

@visibleForTesting
class SteamArtwork extends StatefulWidget {
  const SteamArtwork({
    required this.artType,
    required this.file,
    required this.onDeleteFile,
    required this.onCopyFile,
    required this.onCreateFile,
    super.key,
  });

  final SteamGridArtType artType;
  final File? file;
  final void Function(File) onDeleteFile;
  final void Function(File, SteamGridArtType) onCopyFile;
  final void Function(Stream<Uint8List>) onCreateFile;

  @override
  State<SteamArtwork> createState() => _SteamArtworkState();
}

class _SteamArtworkState extends State<SteamArtwork> {
  var _isDragging = false;

  @override
  Widget build(BuildContext context) {
    return DropRegion(
      // TODO: consider supporting other formats
      // formats: const [Formats.jpeg, Formats.png],
      formats: Formats.standardFormats,
      hitTestBehavior: HitTestBehavior.opaque,
      onDropOver: (event) {
        if (event.session.items.isEmpty || event.session.items.length > 1) {
          return DropOperation.none;
        }

        final item = event.session.items.first;
        if (item.canProvide(Formats.jpeg) || item.canProvide(Formats.png)) {
          if (_isDragging == false) {
            setState(() => _isDragging = true);
          }
          return DropOperation.copy;
        }

        return DropOperation.none;
      },
      onDropEnter: (event) {
        // does not seem to be invoked??
      },
      onDropLeave: (event) {
        setState(() => _isDragging = false);
      },
      onPerformDrop: (event) async {
        if (event.session.items.length == 1) {
          final item = event.session.items.first;
          final reader = item.dataReader!;
          if (reader.canProvide(Formats.jpeg)) {
            reader.getFile(Formats.jpeg, (file) {
              widget.onCreateFile(file.getStream());
            }, onError: (error) {
              log('Error reading value $error');
            });
          } else if (reader.canProvide(Formats.png)) {
            reader.getFile(Formats.png, (file) {
              widget.onCreateFile(file.getStream());
            }, onError: (error) {
              log('Error reading value $error');
            });
          }
        }
      },
      // when dragging, do not allow right-click
      child: IgnorePointer(
        ignoring: _isDragging,
        child: ContextMenuRegion(
          onDismissed: () {},
          onItemSelected: (item) {
            if (item.title == context.l10n.homeProgramArtworkDelete) {
              widget.onDeleteFile(widget.file!);
            } else if (item.title == context.l10n.homeProgramArtworkSetBackgroundAsHero) {
              widget.onCopyFile(widget.file!, SteamGridArtType.hero);
            } else if (item.title == context.l10n.homeProgramArtworkSetHeroAsBackground) {
              widget.onCopyFile(widget.file!, SteamGridArtType.background);
            }
          },
          menuItems: [
            if (widget.file != null)
              MenuItem(
                title: context.l10n.homeProgramArtworkDelete,
              ),
            if (widget.file != null && widget.artType == SteamGridArtType.background)
              MenuItem(
                title: context.l10n.homeProgramArtworkSetBackgroundAsHero,
              ),
            if (widget.file != null && widget.artType == SteamGridArtType.hero)
              MenuItem(
                title: context.l10n.homeProgramArtworkSetHeroAsBackground,
              ),
          ],
          child: SizedBox(
            width: widget.artType.size.width * 0.25,
            height: widget.artType.size.height * 0.25,
            child: Opacity(
              opacity: _isDragging ? 0.75 : 1,
              child: widget.file != null
                  ? Image.file(widget.file!)
                  : ColoredBox(
                      color: context.colorScheme.tertiary,
                      child: Icon(
                        Icons.broken_image,
                        size: widget.artType.size.width * 0.25 * 0.25,
                        color: context.colorScheme.onTertiary,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
