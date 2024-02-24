import 'package:flutter/material.dart';
import 'package:non_steam_artwork/core/l10n/l10n_extension.dart';
import 'package:non_steam_artwork/core/ui/markdown_screen.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MarkdownScreen(
      title: context.l10n.privacyPolicyScreenTitle,
      url: 'https://raw.githubusercontent.com/defuncart/non_steam_artwork/main/privacy_policy.md',
    );
  }

  static void show(BuildContext context) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const PrivacyPolicyScreen(),
        ),
      );
}
