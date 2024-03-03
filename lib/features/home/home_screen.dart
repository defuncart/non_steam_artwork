import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:menubar/menubar.dart';
import 'package:native_context_menu/native_context_menu.dart';
import 'package:non_steam_artwork/core/configs/window_config.dart';
import 'package:non_steam_artwork/core/extensions/iterable_widget_extension.dart';
import 'package:non_steam_artwork/core/extensions/theme_extensions.dart';
import 'package:non_steam_artwork/core/l10n/l10n_extension.dart';
import 'package:non_steam_artwork/core/logging/logger.dart';
import 'package:non_steam_artwork/core/settings/state.dart';
import 'package:non_steam_artwork/core/steam/steam_program.dart';
import 'package:non_steam_artwork/features/home/download_artwork.dart';
import 'package:non_steam_artwork/features/home/home_app_bar.dart';
import 'package:non_steam_artwork/features/home/home_state.dart';
import 'package:non_steam_artwork/features/home/home_tips_panel.dart';
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
    final state = ref.watch(steamFolderExistsControllerProvider);
    return switch (state) {
      AsyncLoading() => const SizedBox.shrink(),
      AsyncData() => const HomeScreenContent(),
      AsyncError(:final error) => HomeScreenSteamError(
          error: error,
        ),
    };
  }
}

@visibleForTesting
class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HomeAppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            HomeTipsPanel(),
            Expanded(
              child: ProgramsView(),
            ),
          ],
        ),
      ),
    );
  }
}

@visibleForTesting
class HomeScreenSteamError extends StatelessWidget {
  const HomeScreenSteamError({
    required this.error,
    super.key,
  });

  final Object error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(context.l10n.homeErrorLabel1(error)),
            Text(context.l10n.homeErrorLabel2),
          ],
        ),
      ),
    );
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
          : ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
              itemCount: value.length,
              itemBuilder: (context, index) => ProgramView(
                program: value.toList()[index],
              ),
              separatorBuilder: (context, index) => Center(
                child: SizedBox(
                  width: minWindowSize.width * 0.75,
                  child: const Divider(),
                ),
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
    return LayoutBuilder(
      builder: (context, constraints) {
        final widthFactor = constraints.maxWidth / (minWindowSize.width - 16);

        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(4),
            Text(
              program.appName,
              style: context.textTheme.headlineSmall,
            ),
            const Gap(8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final artType in [
                  // currently icon is not supported
                  SteamGridArtType.cover,
                  SteamGridArtType.background,
                  SteamGridArtType.logo,
                  SteamGridArtType.hero,
                ])
                  SteamArtwork(
                    artType: artType,
                    file: switch (artType) {
                      SteamGridArtType.icon => program.icon,
                      SteamGridArtType.cover => program.cover,
                      SteamGridArtType.background => program.background,
                      SteamGridArtType.logo => program.logo,
                      SteamGridArtType.hero => program.hero,
                    },
                    width: artType.size.width * 0.25 * widthFactor,
                    height: artType.size.height * 0.25 * widthFactor,
                    onDeleteFile: (file) => ref.read(deleteArtworkProvider(file: file)),
                    onCopyFile: (file, artType) => ref.read(copyArtworkProvider(file: file, artType: artType)),
                    onCreateFile: (bytesStream, ext) => ref.read(createArtworkProvider(
                      appId: program.appId,
                      bytesStream: bytesStream,
                      ext: ext,
                      artType: artType,
                    )),
                    onLog: ref.read(loggerProvider).log,
                    canDownloadArtwork: ref.watch(steamGridDBApiKeyControllerProvider) != null,
                    onDownload: () => DownloadArtwork.show(
                      context,
                      program: program,
                      artType: artType,
                    ),
                  ),
              ].intersperse(Gap(12 * widthFactor)),
            ),
            const Gap(8),
          ],
        );
      },
    );
  }
}

@visibleForTesting
class SteamArtwork extends StatefulWidget {
  const SteamArtwork({
    required this.artType,
    required this.file,
    required this.width,
    required this.height,
    required this.onDeleteFile,
    required this.onCopyFile,
    required this.onCreateFile,
    required this.onLog,
    required this.canDownloadArtwork,
    required this.onDownload,
    super.key,
  });

  final SteamGridArtType artType;

  final File? file;
  final double width;
  final double height;
  final void Function(File) onDeleteFile;
  final void Function(File, SteamGridArtType) onCopyFile;
  final void Function(Stream<Uint8List>, String) onCreateFile;
  final void Function(String) onLog;
  final bool canDownloadArtwork;
  final VoidCallback onDownload;

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
            if (item.title == 'Search on SteamGridDB') {
              widget.onDownload();
            } else if (item.title == context.l10n.homeProgramArtworkPaste) {
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
            if (widget.canDownloadArtwork)
              MenuItem(
                title: context.l10n.homeProgramSearchSteamGridDB,
              ),
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
            width: widget.width,
            height: widget.height,
            child: Opacity(
              opacity: _isDragging ? 0.75 : 1,
              child: widget.file != null
                  ? Image.file(widget.file!)
                  : ColoredBox(
                      color: context.colorScheme.tertiary,
                      child: Icon(
                        Icons.broken_image,
                        size: widget.width * 0.25,
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
