import 'package:app_store_screenshots/app_store_screenshots.dart';
import 'package:flutter/material.dart';
import 'package:non_steam_artwork/core/extensions/theme_extensions.dart';
import 'package:non_steam_artwork/core/theme/themes.dart';

void main() {
  generateAppIcon(
    onBuildIcon: (size) => AppIcon(
      size: size,
    ),
  );
}

class AppIcon extends StatelessWidget {
  const AppIcon({
    super.key,
    required this.size,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: darkTheme,
      child: Builder(
        builder: (context) => Container(
          width: size,
          height: size,
          color: Theme.of(context).colorScheme.tertiary,
          child: Center(
            child: Icon(
              Icons.broken_image,
              color: context.colorScheme.onTertiary,
              size: size * 0.6,
            ),
          ),
        ),
      ),
    );
  }
}
