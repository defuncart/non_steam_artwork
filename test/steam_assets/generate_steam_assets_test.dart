import 'package:app_store_screenshots/app_store_screenshots.dart';
import 'package:flutter/material.dart';
import 'package:non_steam_artwork/core/extensions/theme_extensions.dart';
import 'package:non_steam_artwork/core/theme/themes.dart';

void main() {
  generateAppIcon(
    onBuildIcon: (size) => Theme(
      data: darkTheme,
      child: SteamAsset(
        size: size,
      ),
    ),
  );
}

class SteamAsset extends StatelessWidget {
  const SteamAsset({
    super.key,
    required this.size,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      color: Theme.of(context).colorScheme.tertiary,
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.broken_image,
              color: context.colorScheme.onTertiary,
              size: size * 0.6,
            ),
          ],
        ),
      ),
    );
  }
}
