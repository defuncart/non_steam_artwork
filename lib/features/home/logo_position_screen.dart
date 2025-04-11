import 'package:flutter/material.dart';
import 'package:non_steam_artwork/core/configs/window_config.dart';
import 'package:non_steam_artwork/core/extensions/theme_extensions.dart';
import 'package:non_steam_artwork/core/steam/steam_program.dart';
import 'package:non_steam_artwork/features/home/home_screen.dart';
import 'package:non_steam_artwork/features/home/steam_grid_art_type.dart';

class LogoPositionScreen extends StatefulWidget {
  const LogoPositionScreen({super.key, required this.program});

  final SteamProgram program;

  @override
  State<LogoPositionScreen> createState() => LogoPositionTypeScreenState();

  static void show(BuildContext context, {required SteamProgram program}) =>
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => LogoPositionScreen(program: program)));
}

class LogoPositionTypeScreenState extends State<LogoPositionScreen> {
  late LogoPositionType _position;
  late double _size;

  @override
  void initState() {
    super.initState();

    print(widget.program);
    print(widget.program.logoPosition);

    _position = widget.program.logoPosition?.position ?? LogoPositionType.bottomLeft;
    _size = (widget.program.logoPosition?.width ?? 50.0).clamp(0, 100) / 100;

    print('_position: $_position');
    print('_size: $_size');
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final widthFactor = constraints.maxWidth / (minWindowSize.width - 16);

        return Scaffold(
          appBar: AppBar(
            title: Text(widget.program.appName),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: IconButton(
                  onPressed: () {
                    // save
                  },
                  icon: const Icon(Icons.save),
                ),
              ),
            ],
          ),
          body: Center(
            child: SizedBox(
              width: SteamGridArtType.hero.size.width * widthFactor,
              // height: SteamGridArtType.background.size.width * widthFactor SteamGridArtType.background.size.height * widthFactor,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      widget.program.hero != null
                          ? ArtworkImage(widget.program.hero!)
                          : ColoredBox(
                              color: context.colorScheme.tertiary,
                              child: Icon(Icons.broken_image, color: context.colorScheme.onTertiary),
                            ),
                      if (widget.program.logo != null)
                        _Positioned(
                          position: _position,
                          child: SizedBox(
                            width: constraints.maxWidth * _size * 0.5,
                            height: constraints.maxHeight * _size * 0.5,
                            child: ArtworkImage(widget.program.logo!),
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
                  ),
                  if (widget.program.logo != null) ...[
                    const SizedBox(height: 16),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Size'),
                        Slider(value: _size, onChanged: (value) => setState(() => _size = value)),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      },
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
      child: Align(
        alignment: switch (position) {
          LogoPositionType.bottomLeft => Alignment.bottomLeft,
          LogoPositionType.centerTop => Alignment.topCenter,
          LogoPositionType.centerCenter => Alignment.center,
          LogoPositionType.centerBottom => Alignment.bottomCenter,
        },
        child: child,
      ),
    );
  }
}
