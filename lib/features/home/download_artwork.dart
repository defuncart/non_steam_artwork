import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:non_steam_artwork/core/l10n/l10n_extension.dart';
import 'package:non_steam_artwork/core/steam/steam_program.dart';
import 'package:non_steam_artwork/features/home/home_state.dart';
import 'package:non_steam_artwork/features/home/steam_grid_art_type.dart';

class DownloadArtwork extends ConsumerWidget {
  const DownloadArtwork({
    required this.program,
    required this.artType,
    super.key,
  });

  final SteamProgram program;
  final SteamGridArtType artType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = downloadableArtworkControllerProvider(initialSearchTerm: program.appName, artType: artType);
    final state = ref.watch(provider);

    return Scaffold(
      appBar: AppBar(
        title: switch (state) {
          AsyncData(:final value) => TextField(
              decoration: InputDecoration(
                hintText: value.searchTerm,
              ),
              onSubmitted: (value) => ref.read(provider.notifier).updateSearchTerm(value),
            ),
          _ => null,
        },
        actions: [
          switch (state) {
            AsyncData(:final value) => value.programResults.isNotEmpty
                ? Padding(
                    // 16 right, 2 vertically to better align
                    padding: const EdgeInsets.only(right: 16, top: 2, bottom: 2),
                    child: DropdownMenu(
                      dropdownMenuEntries: value.programResults
                          .map((e) => DropdownMenuEntry(
                                value: e.id,
                                label: e.name,
                              ))
                          .toList(),
                      initialSelection: value.selectedProgram,
                      requestFocusOnTap: false,
                      onSelected: (id) {
                        if (id != null) {
                          ref.read(provider.notifier).updateSelectedProgram(id);
                        }
                      },
                    ),
                  )
                : const SizedBox.shrink(),
            _ => const SizedBox.shrink(),
          },
        ],
      ),
      body: switch (state) {
        AsyncData(:final value) => value.programResults.isEmpty
            ? Center(
                child: Text(context.l10n.homeProgramsEmpty),
              )
            : value.downloadableArtworks.isEmpty
                ? Center(
                    child: Text(context.l10n.homeArtworkEmpty),
                  )
                : ArtworkSelector(
                    artType: artType,
                    downloadableArtworks: value.downloadableArtworks,
                    onSelect: (file) {
                      ref.read(
                        createArtworkFileProvider(
                          appId: program.appId,
                          file: file,
                          ext: '.png',
                          artType: artType,
                        ),
                      );

                      Navigator.of(context).pop();
                    },
                  ),
        AsyncLoading() => const Center(
            child: CircularProgressIndicator(),
          ),
        AsyncError(:final error) => Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(error.toString()),
                TextButton(
                  onPressed: () => ref.invalidate(provider),
                  child: Text(
                    context.l10n.generalErrorTryAgain,
                  ),
                ),
              ],
            ),
          ),
      },
    );
  }

  static void show(
    BuildContext context, {
    required SteamProgram program,
    required SteamGridArtType artType,
  }) =>
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DownloadArtwork(
            program: program,
            artType: artType,
          ),
        ),
      );
}

@visibleForTesting
class ArtworkSelector extends StatefulWidget {
  const ArtworkSelector({
    required this.artType,
    required this.downloadableArtworks,
    required this.onSelect,
    super.key,
  });

  final SteamGridArtType artType;
  final Iterable<DownloadableArtwork> downloadableArtworks;
  final void Function(File) onSelect;

  @override
  State<ArtworkSelector> createState() => _ArtworkSelectorState();
}

class _ArtworkSelectorState extends State<ArtworkSelector> {
  final _cacheManager = DefaultCacheManager();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Center(
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: widget.downloadableArtworks
                .map(
                  (artwork) => GestureDetector(
                    onTap: () async {
                      try {
                        final file = await _cacheManager.getSingleFile(artwork.url);
                        widget.onSelect(file);
                      } catch (e) {
                        // ignore: use_build_context_synchronously
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(
                              context.l10n.generalErrorTitle,
                            ),
                            content: Text(
                              context.l10n.generalErrorNoInternetDescription,
                            ),
                            actions: [
                              TextButton(
                                onPressed: Navigator.of(context).pop,
                                child: Text(context.l10n.generalOk),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    child: HoverableWidget(
                      child: SizedBox.fromSize(
                        size: widget.artType.size * 0.5,
                        child: CachedNetworkImage(
                          cacheManager: _cacheManager,
                          imageUrl: artwork.thumbnail,
                          imageBuilder: (context, imageProvider) => Image(
                            image: imageProvider,
                          ),
                          progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                            child: CircularProgressIndicator(
                              value: downloadProgress.progress,
                            ),
                          ),
                          fadeInDuration: Duration.zero,
                          fadeOutDuration: Duration.zero,
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

@visibleForTesting
class HoverableWidget extends StatefulWidget {
  const HoverableWidget({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  State<HoverableWidget> createState() => _HoverableWidgetState();
}

class _HoverableWidgetState extends State<HoverableWidget> {
  var _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      cursor: SystemMouseCursors.click,
      child: Opacity(
        opacity: _isHovering ? 0.6 : 1,
        child: widget.child,
      ),
    );
  }
}
