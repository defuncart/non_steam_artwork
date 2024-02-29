import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:menubar/menubar.dart';
import 'package:native_context_menu/native_context_menu.dart';
import 'package:non_steam_artwork/core/extensions/int_extension.dart';
import 'package:non_steam_artwork/core/extensions/theme_extensions.dart';
import 'package:non_steam_artwork/core/l10n/l10n_extension.dart';
import 'package:non_steam_artwork/core/logging/logger.dart';
import 'package:non_steam_artwork/core/settings/sort_program_type.dart';
import 'package:non_steam_artwork/core/settings/state.dart';
import 'package:non_steam_artwork/core/steam/steam_program.dart';
import 'package:non_steam_artwork/features/home/home_state.dart';
import 'package:non_steam_artwork/features/home/steam_grid_art_type.dart';
import 'package:non_steam_artwork/features/support/licenses_screen.dart';
import 'package:non_steam_artwork/features/support/logs_screen.dart';
import 'package:non_steam_artwork/features/support/privacy_policy_screen.dart';
import 'package:non_steam_artwork/features/support/steamgriddb_dialog.dart';
import 'package:super_clipboard/super_clipboard.dart';
import 'package:super_drag_and_drop/super_drag_and_drop.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(
      () => setApplicationMenu([
        NativeSubmenu(
          label: context.l10n.menuBarFile,
          children: [
            NativeMenuItem(
              label: context.l10n.menuBarFileQuit,
              onSelected: () => exit(0),
            ),
          ],
        ),
        NativeSubmenu(
          label: context.l10n.menuBarCache,
          children: [
            // NativeMenuItem(
            //   label: context.l10n.menuBarCacheOpen,
            //   onSelected: ref.read(cacheControllerProvider.notifier).open,
            // ),
            NativeMenuItem(
              label: context.l10n.menuBarCacheBackup,
              onSelected: ref.read(cacheControllerProvider.notifier).backup,
            ),
            NativeMenuItem(
              label: context.l10n.menuBarCacheDeleteAll,
              onSelected: ref.read(cacheControllerProvider.notifier).deleteAll,
            ),
          ],
        ),
        NativeSubmenu(
          label: context.l10n.menuBarOptions,
          children: [
            NativeMenuItem(
              label: context.l10n.menuBarOptionsApiKey,
              onSelected: () => SteamGridDBDialog.show(context),
            ),
            NativeSubmenu(
              label: context.l10n.menuBarOptionsTheme,
              children: [
                NativeMenuItem(
                  label: context.l10n.menuBarOptionsThemeSystem,
                  onSelected: () => ref.read(themeModeControllerProvider.notifier).set(ThemeMode.system),
                ),
                NativeMenuItem(
                  label: context.l10n.menuBarOptionsThemeLight,
                  onSelected: () => ref.read(themeModeControllerProvider.notifier).set(ThemeMode.light),
                ),
                NativeMenuItem(
                  label: context.l10n.menuBarOptionsThemeDark,
                  onSelected: () => ref.read(themeModeControllerProvider.notifier).set(ThemeMode.dark),
                ),
              ],
            ),
          ],
        ),
        NativeSubmenu(
          label: context.l10n.menuBarView,
          children: [
            NativeMenuItem(
              label: context.l10n.menuBarViewLogs,
              onSelected: () => LogsScreen.show(context),
            ),
            NativeMenuItem(
              label: context.l10n.menuBarViewShowLicenses,
              onSelected: () => LicensesScreen.show(context),
            ),
            NativeMenuItem(
              label: context.l10n.menuBarViewShowPrivacyPolicy,
              onSelected: () => PrivacyPolicyScreen.show(context),
            ),
          ],
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SearchProgramsTextField(),
        actions: const [
          FilterProgramChips(),
          SortProgramsButton(),
        ],
      ),
      body: const Center(
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
    );
  }
}

class SearchProgramsTextField extends ConsumerStatefulWidget {
  const SearchProgramsTextField({super.key});

  @override
  ConsumerState<SearchProgramsTextField> createState() => _SearchProgramsTextFieldState();
}

class _SearchProgramsTextFieldState extends ConsumerState<SearchProgramsTextField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController()
      ..addListener(() {
        ref.read(searchControllerProvider.notifier).updateSearch(_controller.text);
      });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
    );
  }
}

@visibleForTesting
class FilterProgramChips extends ConsumerWidget {
  const FilterProgramChips({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(filteredProgramTypesControllerProvider);

    return Wrap(
      children: [
        for (final type in SteamProgramType.values)
          FilterChip(
            label: Text(type.name),
            selected: state[type]!,
            onSelected: (_) => ref.read(filteredProgramTypesControllerProvider.notifier).toggle(type),
          ),
      ],
    );
  }
}

class SortProgramsButton extends ConsumerWidget {
  const SortProgramsButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(sortProgramTypeControllerProvider);

    return DropdownMenu<SortProgramType>(
      initialSelection: state,
      leadingIcon: const Icon(Icons.sort),
      label: const Text('Sort'),
      onSelected: (value) {
        if (value != null) {
          ref.read(sortProgramTypeControllerProvider.notifier).set(value);
        }
      },
      dropdownMenuEntries: SortProgramType.values
          .map((sortType) => DropdownMenuEntry<SortProgramType>(
                value: sortType,
                leadingIcon: Icon(sortType.icon),
                label: sortType.label,
                enabled: true,
              ))
          .toList(),
    );
  }
}

extension on SortProgramType {
  IconData get icon => switch (this) {
        SortProgramType.dateAdded => Icons.date_range,
        SortProgramType.alphabetic => Icons.abc,
        SortProgramType.programId => Icons.onetwothree,
      };

  String get label => switch (this) {
        SortProgramType.dateAdded => 'Date',
        SortProgramType.alphabetic => 'Name',
        SortProgramType.programId => 'Id',
      };
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
                      onPressed: ref.read(cacheControllerProvider.notifier).cleanUp,
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
                onCreateFile: (bytesStream, ext) => ref.read(createArtworkProvider(
                  appId: program.appId,
                  bytesStream: bytesStream,
                  ext: ext,
                  artType: artType,
                )),
                onLog: ref.read(loggerProvider).log,
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
    required this.onLog,
    super.key,
  });

  final SteamGridArtType artType;
  final File? file;
  final void Function(File) onDeleteFile;
  final void Function(File, SteamGridArtType) onCopyFile;
  final void Function(Stream<Uint8List>, String) onCreateFile;
  final void Function(String) onLog;

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
              widget.onCreateFile(file.getStream(), '.jpg');
            }, onError: (error) {
              widget.onLog('Error reading value $error');
            });
          } else if (reader.canProvide(Formats.png)) {
            reader.getFile(Formats.png, (file) {
              widget.onCreateFile(file.getStream(), '.png');
            }, onError: (error) {
              widget.onLog('Error reading value $error');
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
            if (item.title == context.l10n.homeProgramArtworkPaste) {
              SystemClipboard.instance?.read().then((reader) {
                if (reader.canProvide(Formats.jpeg)) {
                  reader.getFile(Formats.jpeg, (file) {
                    widget.onCreateFile(file.getStream(), '.jpg');
                  }, onError: (error) {
                    widget.onLog('Error reading value $error');
                  });
                } else if (reader.canProvide(Formats.png)) {
                  reader.getFile(Formats.png, (file) {
                    widget.onCreateFile(file.getStream(), '.png');
                  }, onError: (error) {
                    widget.onLog('Error reading value $error');
                  });
                } else {
                  widget.onLog('clipboard contents is not .jpg nor .png');
                }
              });
              // TODO: show toast when clipboard content isn't valid
            } else if (item.title == context.l10n.homeProgramArtworkDelete) {
              widget.onDeleteFile(widget.file!);
            } else if (item.title == context.l10n.homeProgramArtworkSetBackgroundAsHero) {
              widget.onCopyFile(widget.file!, SteamGridArtType.hero);
            } else if (item.title == context.l10n.homeProgramArtworkSetHeroAsBackground) {
              widget.onCopyFile(widget.file!, SteamGridArtType.background);
            }
          },
          menuItems: [
            MenuItem(
              title: context.l10n.homeProgramArtworkPaste,
            ),
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
