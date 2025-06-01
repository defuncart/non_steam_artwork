import 'dart:math';

import 'package:flutter/material.dart';
import 'package:non_steam_artwork/core/extensions/theme_extensions.dart';

class DefaultArtwork extends StatelessWidget {
  const DefaultArtwork({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final minSize = min(constraints.maxWidth, constraints.maxHeight);
        final size = minSize * 0.6;

        return ColoredBox(
          color: context.colorScheme.tertiary,
          child: Icon(Icons.broken_image, size: size, color: context.colorScheme.onTertiary),
        );
      },
    );
  }
}
