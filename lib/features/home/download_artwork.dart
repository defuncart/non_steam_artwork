import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
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
    final provider = gameArtworkDownloadProvider(searchTerm: program.appName, artType: artType);
    final state = ref.watch(provider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          iconSize: kMinInteractiveDimension,
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.close),
        ),
        Expanded(
          child: switch (state) {
            AsyncData(:final value) => ArtworkSelector(
                urls: value.toList(),
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
                        context.l10n.markdownScreenErrorTryAgain,
                      ),
                    ),
                  ],
                ),
              ),
          },
        ),
      ],
    );
  }

  static void show(
    BuildContext context, {
    required SteamProgram program,
    required SteamGridArtType artType,
  }) =>
      showDialog(
        context: context,
        builder: (context) => Material(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: DownloadArtwork(
              program: program,
              artType: artType,
            ),
          ),
        ),
        barrierDismissible: false,
      );
}

class ArtworkSelector extends StatefulWidget {
  const ArtworkSelector({
    required this.urls,
    required this.onSelect,
    super.key,
  });

  final List<String> urls;
  final void Function(File) onSelect;

  @override
  State<ArtworkSelector> createState() => _ArtworkSelectorState();
}

class _ArtworkSelectorState extends State<ArtworkSelector> {
  var _index = 0;
  final _cacheManager = DefaultCacheManager();

  int get _totalImages => widget.urls.length;
  String get _currentImage => widget.urls[_index];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Gap(16),
        Expanded(
          child: Stack(
            alignment: Alignment.center,
            children: [
              CachedNetworkImage(
                cacheManager: _cacheManager,
                imageUrl: _currentImage,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    iconSize: kMinInteractiveDimension,
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: _index > 0 ? () => setState(() => _index--) : null,
                    icon: const Icon(Icons.arrow_left),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    iconSize: kMinInteractiveDimension,
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: _index < _totalImages - 1 ? () => setState(() => _index++) : null,
                    icon: const Icon(Icons.arrow_right),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Gap(16),
        Center(
          child: IconButton(
            padding: EdgeInsets.zero,
            iconSize: kMinInteractiveDimension,
            onPressed: () async {
              final fileInfo = await _cacheManager.getFileFromMemory(_currentImage);
              if (fileInfo != null) {
                widget.onSelect(fileInfo.file);
              }
            },
            icon: const Icon(Icons.check),
          ),
        ),
      ],
    );
  }
}
