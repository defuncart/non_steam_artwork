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
  State<LogoPositionScreen> createState() => _LogoPositionScreenState();

  static void show(BuildContext context, {required SteamProgram program}) =>
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => LogoPositionScreen(program: program)));
}

class _LogoPositionScreenState extends State<LogoPositionScreen> {
  var _position = _LogoPosition.bottomLeft;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final widthFactor = constraints.maxWidth / (minWindowSize.width - 16);

        return Scaffold(
          appBar: AppBar(title: Text(widget.program.appName)),
          body: Center(
            child: SizedBox(
              width: SteamGridArtType.background.size.width * widthFactor,
              // height: SteamGridArtType.background.size.width * widthFactor SteamGridArtType.background.size.height * widthFactor,
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  widget.program.background != null
                      ? ArtworkImage(widget.program.background!)
                      : ColoredBox(
                        color: context.colorScheme.tertiary,
                        child: Icon(Icons.broken_image, color: context.colorScheme.onTertiary),
                      ),
                  if (widget.program.logo != null)
                    _Positioned(
                      position: _position,
                      child: SizedBox(
                        width: constraints.maxWidth * 0.25,
                        height: constraints.maxHeight * 0.25,
                        child: ArtworkImage(widget.program.logo!),
                      ),
                    ),
                  for (final position in _LogoPosition.values)
                    _Positioned(
                      position: position,
                      child: IconButton(
                        onPressed: () => setState(() => _position = position),
                        icon: Icon(Icons.check_box_outline_blank, color: context.colorScheme.primary),
                      ),
                    ),
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

  final _LogoPosition position;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        alignment: switch (position) {
          _LogoPosition.bottomLeft => Alignment.bottomLeft,
          _LogoPosition.centerTop => Alignment.topCenter,
          _LogoPosition.centerCenter => Alignment.center,
          _LogoPosition.centerBottom => Alignment.bottomCenter,
        },
        child: child,
      ),
    );
  }
}

enum _LogoPosition { bottomLeft, centerTop, centerCenter, centerBottom }
