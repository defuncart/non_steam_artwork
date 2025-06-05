import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:menubar/menubar.dart';
import 'package:native_context_menu/native_context_menu.dart';
import 'package:non_steam_artwork/core/configs/window_config.dart';
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
import 'package:non_steam_artwork/features/support/manual_screen.dart';
import 'package:non_steam_artwork/features/support/privacy_policy_screen.dart';
import 'package:non_steam_artwork/features/support/steamgriddb_dialog.dart';
import 'package:non_steam_artwork/features/viewer/shortcuts_viewer_screen.dart';
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
          // ignore: use_build_context_synchronously
          label: context.l10n.menuBarFile,
          children: [
            NativeMenuItem(
              // ignore: use_build_context_synchronously
              label: context.l10n.menuBarFileQuit,
              onSelected: () => exit(0),
            ),
          ],
        ),
        NativeSubmenu(
          // ignore: use_build_context_synchronously
          label: context.l10n.menuBarCache,
          children: [
            // NativeMenuItem(
            //   // ignore: use_build_context_synchronously
            //   label: context.l10n.menuBarCacheOpen,
            //   onSelected: ref.read(cacheControllerProvider.notifier).open,
            // ),
            NativeMenuItem(
              // ignore: use_build_context_synchronously
              label: context.l10n.menuBarCacheBackup,
              onSelected: ref.read(cacheControllerProvider.notifier).backup,
            ),
            NativeMenuItem(
              // ignore: use_build_context_synchronously
              label: context.l10n.menuBarCacheDeleteAll,
              onSelected: ref.read(cacheControllerProvider.notifier).deleteAll,
            ),
          ],
        ),
        NativeSubmenu(
          // ignore: use_build_context_synchronously
          label: context.l10n.menuBarOptions,
          children: [
            NativeMenuItem(
              // ignore: use_build_context_synchronously
              label: context.l10n.menuBarOptionsApiKey,
              onSelected: () => SteamGridDBDialog.show(context),
            ),
            NativeSubmenu(
              // ignore: use_build_context_synchronously
              label: context.l10n.menuBarOptionsTheme,
              children: [
                NativeMenuItem(
                  // ignore: use_build_context_synchronously
                  label: context.l10n.menuBarOptionsThemeSystem,
                  onSelected: () => ref.read(themeModeControllerProvider.notifier).set(ThemeMode.system),
                ),
                NativeMenuItem(
                  // ignore: use_build_context_synchronously
                  label: context.l10n.menuBarOptionsThemeLight,
                  onSelected: () => ref.read(themeModeControllerProvider.notifier).set(ThemeMode.light),
                ),
                NativeMenuItem(
                  // ignore: use_build_context_synchronously
                  label: context.l10n.menuBarOptionsThemeDark,
                  onSelected: () => ref.read(themeModeControllerProvider.notifier).set(ThemeMode.dark),
                ),
              ],
            ),
          ],
        ),
        NativeSubmenu(
          // ignore: use_build_context_synchronously
          label: context.l10n.menuBarView,
          children: [
            NativeMenuItem(
              // ignore: use_build_context_synchronously
              label: context.l10n.menuBarViewManual,
              onSelected: () => ManualScreen.show(context),
            ),
            NativeMenuItem(
              // ignore: use_build_context_synchronously
              label: context.l10n.menuBarViewShortcutsViewer,
              onSelected: () => ShortcutsViewerScreen.show(context),
            ),
            NativeMenuItem(
              // ignore: use_build_context_synchronously
              label: context.l10n.menuBarViewLogs,
              onSelected: () => LogsScreen.show(context),
            ),
            NativeMenuItem(
              // ignore: use_build_context_synchronously
              label: context.l10n.menuBarViewShowLicenses,
              onSelected: () => LicensesScreen.show(context),
            ),
            NativeMenuItem(
              // ignore: use_build_context_synchronously
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
      AsyncError(:final error) => HomeScreenSteamError(error: error),
      // TODO: Remove after upgrade to riverpod v3
      _ => const SizedBox.shrink(),
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
            Expanded(child: ProgramsView()),
          ],
        ),
      ),
    );
  }
}

@visibleForTesting
class HomeScreenSteamError extends StatelessWidget {
  const HomeScreenSteamError({required this.error, super.key});

  final Object error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Text(context.l10n.homeErrorLabel1(error)), Text(context.l10n.homeErrorLabel2)],
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
      AsyncData(:final value) =>
        value.isEmpty
            ? Center(
                child: Text(
                  ref.read(searchControllerProvider).isNotEmpty
                      ? context.l10n.homeSearchEmpty
                      : context.l10n.homeProgramsEmpty,
                ),
              )
            : ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                itemCount: value.length,
                itemBuilder: (context, index) => ProgramView(program: value.toList()[index]),
                separatorBuilder: (context, index) => Center(
                  child: SizedBox(width: minWindowSize.width * 0.75, child: const Divider()),
                ),
              ),
      _ => const SizedBox.shrink(),
    };
  }
}

@visibleForTesting
class ProgramView extends ConsumerWidget {
  const ProgramView({required this.program, super.key});

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
            Text(program.appName, style: context.textTheme.headlineSmall),
            const Gap(8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 12 * widthFactor,
              children: [
                for (final artType in [
                  // currently icon is not supported
                  SteamGridArtType.cover,
                  SteamGridArtType.hero,
                  SteamGridArtType.logo,
                  SteamGridArtType.banner,
                ])
                  SteamArtwork(
                    // key: UniqueKey(),
                    artType: artType,
                    file: switch (artType) {
                      SteamGridArtType.icon => program.icon,
                      SteamGridArtType.cover => program.cover,
                      SteamGridArtType.hero => program.hero,
                      SteamGridArtType.logo => program.logo,
                      SteamGridArtType.banner => program.banner,
                    },
                    // 0.26215 is a magic number which correctly scales artwork depending on widthFactor and min window width
                    width: artType.size.width * 0.26215 * widthFactor,
                    height: artType.size.height * 0.26215 * widthFactor,
                    onDeleteFile: (file) => ref.read(deleteArtworkProvider(file: file)),
                    onCopyFile: (file, artType) => ref.read(copyArtworkProvider(file: file, artType: artType)),
                    onCreateFile: (bytesStream, ext) => ref.read(
                      createArtworkProvider(
                        appId: program.appId,
                        bytesStream: bytesStream,
                        ext: ext,
                        artType: artType,
                      ),
                    ),
                    onLog: ref.read(loggerProvider).log,
                    canDownloadArtwork: ref.watch(steamGridDBApiKeyControllerProvider) != null,
                    onDownload: () => DownloadArtwork.show(context, program: program, artType: artType),
                  ),
              ],
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
            reader.getFile(
              Formats.jpeg,
              (file) {
                widget.onCreateFile(file.getStream(), '.jpg');
              },
              onError: (error) {
                widget.onLog('Error reading value $error');
              },
            );
          } else if (reader.canProvide(Formats.png)) {
            reader.getFile(
              Formats.png,
              (file) {
                widget.onCreateFile(file.getStream(), '.png');
              },
              onError: (error) {
                widget.onLog('Error reading value $error');
              },
            );
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
              final scaffoldMessenger = ScaffoldMessenger.of(context);
              final l10n = context.l10n;

              SystemClipboard.instance?.read().then((reader) {
                if (reader.canProvide(Formats.jpeg)) {
                  reader.getFile(
                    Formats.jpeg,
                    (file) {
                      widget.onCreateFile(file.getStream(), '.jpg');
                    },
                    onError: (error) {
                      widget.onLog('Error reading value $error');
                    },
                  );
                } else if (reader.canProvide(Formats.png)) {
                  reader.getFile(
                    Formats.png,
                    (file) {
                      widget.onCreateFile(file.getStream(), '.png');
                    },
                    onError: (error) {
                      widget.onLog('Error reading value $error');
                    },
                  );
                } else {
                  scaffoldMessenger.showSnackBar(
                    SnackBar(content: Text(l10n.homeProgramPasteError), duration: const Duration(seconds: 2)),
                  );
                  widget.onLog('clipboard contents is not .jpg nor .png');
                }
              });
            } else if (item.title == context.l10n.homeProgramArtworkDelete) {
              widget.onDeleteFile(widget.file!);
            } else if (item.title == context.l10n.homeProgramArtworkSetHeroAsBanner) {
              widget.onCopyFile(widget.file!, SteamGridArtType.banner);
            } else if (item.title == context.l10n.homeProgramArtworkCreateEmptyLogo) {
              final bytes = const Base64Codec().decode('R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7');
              widget.onCreateFile(Stream.value(bytes), '.jpg');
            } else if (item.title == context.l10n.homeProgramArtworkSetBannerAsHero) {
              widget.onCopyFile(widget.file!, SteamGridArtType.hero);
            }
          },
          menuItems: [
            if (widget.canDownloadArtwork) MenuItem(title: context.l10n.homeProgramSearchSteamGridDB),
            MenuItem(title: context.l10n.homeProgramArtworkPaste),
            if (widget.file != null) MenuItem(title: context.l10n.homeProgramArtworkDelete),
            if (widget.file != null && widget.artType == SteamGridArtType.hero)
              MenuItem(title: context.l10n.homeProgramArtworkSetHeroAsBanner),
            if (widget.artType == SteamGridArtType.logo)
              MenuItem(title: context.l10n.homeProgramArtworkCreateEmptyLogo),
            if (widget.file != null && widget.artType == SteamGridArtType.banner)
              MenuItem(title: context.l10n.homeProgramArtworkSetBannerAsHero),
          ],
          child: SizedBox(
            width: widget.width,
            height: widget.height,
            child: Opacity(
              opacity: _isDragging ? 0.75 : 1,
              child: widget.file != null
                  ? ArtworkImage(widget.file!)
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

// When a.png already exists on disk and is replaced, Image.file does not represent
// new contents. As a hack, a list of replaced files are kept in memory and when a
// replaced image should be rendered, Image.memory is used instead
@visibleForTesting
class ArtworkImage extends ConsumerWidget {
  const ArtworkImage(this.file, {super.key});

  final File file;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = wasFileReplacedControllerProvider(file.path);
    final wasUpdated = ref.watch(provider);
    if (wasUpdated) {
      // to cover case of rendering after file replaced/deleted, use cache
      try {
        return Image.memory(file.readAsBytesSync());
      } catch (e) {
        return const SizedBox.shrink();
      }
    }

    return Image.file(file);
  }
}
