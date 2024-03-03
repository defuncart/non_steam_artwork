import 'package:flutter/material.dart';
import 'package:non_steam_artwork/core/l10n/l10n_extension.dart';
import 'package:non_steam_artwork/core/ui/common/markdown_screen.dart';

class ManualScreen extends StatelessWidget {
  const ManualScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MarkdownScreen(
      title: context.l10n.manualScreenTitle,
      url: 'https://raw.githubusercontent.com/defuncart/non_steam_artwork/feature/add-manual/docs/manual.md',
    );
  }

  static void show(BuildContext context) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const ManualScreen(),
        ),
      );
}
