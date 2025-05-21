import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:non_steam_artwork/core/extensions/theme_extensions.dart';
import 'package:non_steam_artwork/core/l10n/l10n_extension.dart';
import 'package:non_steam_artwork/core/steam/steam_program.dart';
import 'package:non_steam_artwork/core/ui/common/default_artwork.dart';
import 'package:non_steam_artwork/features/home/home_screen.dart';
import 'package:non_steam_artwork/features/home/home_state.dart';
import 'package:non_steam_artwork/features/home/steam_grid_art_type.dart';

class LogoPositionScreen extends ConsumerWidget {
  const LogoPositionScreen({super.key, required this.program});

  final SteamProgram program;

  static void show(BuildContext context, {required SteamProgram program}) =>
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => LogoPositionScreen(program: program)));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LogoPositionScreenContent(
      program: program,
      onSave: (position, size) async {
        final navigator = Navigator.of(context);
        await ref.read(saveLogoPositionProvider(appId: program.appId, position: position, size: size).future);
        navigator.pop();
      },
    );
  }
}

@visibleForTesting
class LogoPositionScreenContent extends StatefulWidget {
  const LogoPositionScreenContent({super.key, required this.program, required this.onSave});

  final SteamProgram program;
  final void Function(LogoPositionType, double) onSave;

  @override
  State<LogoPositionScreenContent> createState() => LogoPositionTypeScreenState();
}

class LogoPositionTypeScreenState extends State<LogoPositionScreenContent> {
  late LogoPositionType _position;
  late double _size;
  var _isSaving = false;

  @override
  void initState() {
    super.initState();

    _position = widget.program.logoPosition?.position ?? LogoPositionType.bottomLeft;
    _size = (widget.program.logoPosition?.width ?? 50.0).clamp(0, 100) / 100;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.program.appName),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: !_isSaving
                  ? () {
                      widget.onSave(_position, _size * 100);
                      _isSaving = true;
                    }
                  : null,
              icon: const Icon(Icons.save),
            ),
          ),
        ],
      ),
      body: Center(
        child: SizedBox(
          // width: SteamGridArtType.background.size.width * widthFactor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  final widthFactor = 1;
                  print(constraints);

                  print(
                    (constraints.maxWidth / SteamGridArtType.background.size.width) *
                        SteamGridArtType.background.size.height,
                  );

                  return Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      widget.program.background != null
                          ? ArtworkImage(widget.program.background!)
                          // : SizedBox(
                          //   width: constraints.maxWidth,
                          //   height:
                          //       (constraints.maxWidth / SteamGridArtType.background.size.width) *
                          //       SteamGridArtType.background.size.height,
                          //   // height: SteamGridArtType.background.size.height * widthFactor,
                          //   child: const DefaultArtwork(),
                          // ),
                          : Positioned.fill(child: const DefaultArtwork()),
                      if (widget.program.logo != null)
                        _Positioned(
                          position: _position,
                          child: Padding(
                            padding: switch (_position) {
                              LogoPositionType.bottomLeft => const EdgeInsets.only(left: 8, bottom: 8),
                              LogoPositionType.upperCenter => const EdgeInsets.only(top: 8),
                              LogoPositionType.centerCenter => EdgeInsets.zero,
                              LogoPositionType.bottomCenter => const EdgeInsets.only(bottom: 8),
                            },
                            child: SizedBox(
                              width: constraints.maxWidth * _size * 0.5,
                              height: constraints.maxHeight * _size * 0.5,
                              child: ArtworkImage(widget.program.logo!, alignment: _position.alignment),
                            ),
                          ),
                        ),
                      for (final position in LogoPositionType.values)
                        _Positioned(
                          position: position,
                          child: IconButton(
                            onPressed: () => setState(() => _position = position),
                            icon: Icon(Icons.check_box_outline_blank, color: context.colorScheme.primary),
                          ),
                        ),
                    ],
                  );
                },
              ),
              if (widget.program.logo != null) ...[
                const SizedBox(height: 16),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(context.l10n.logoPositionScreenSize),
                    Slider(value: _size, onChanged: (value) => setState(() => _size = value)),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _Positioned extends StatelessWidget {
  const _Positioned({required this.position, required this.child});

  final LogoPositionType position;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(alignment: position.alignment, child: child),
    );
  }
}

extension on LogoPositionType {
  Alignment get alignment => switch (this) {
    LogoPositionType.bottomLeft => Alignment.bottomLeft,
    LogoPositionType.upperCenter => Alignment.topCenter,
    LogoPositionType.centerCenter => Alignment.center,
    LogoPositionType.bottomCenter => Alignment.bottomCenter,
  };
}
