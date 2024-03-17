import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:non_steam_artwork/core/extensions/theme_extensions.dart';
import 'package:non_steam_artwork/core/l10n/l10n_extension.dart';
import 'package:non_steam_artwork/features/viewer/viewer_state.dart';
import 'package:steam_shortcuts_util/steam_shortcuts_util.dart';

class ShortcutsViewerScreen extends ConsumerWidget {
  const ShortcutsViewerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(getShortcutsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.shortcutsScreenTitle),
      ),
      body: switch (state) {
        AsyncLoading() => const Center(
            child: CircularProgressIndicator(),
          ),
        AsyncData(:final value) => ShortcutsViewerScreenContent(shortcuts: value),
        AsyncError(:final error) => Center(
            child: Text(error.toString()),
          )
      },
    );
  }

  static void show(BuildContext context) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const ShortcutsViewerScreen(),
        ),
      );
}

@visibleForTesting
class ShortcutsViewerScreenContent extends ConsumerStatefulWidget {
  const ShortcutsViewerScreenContent({
    required this.shortcuts,
    super.key,
  });

  final List<SteamShortcut> shortcuts;

  @override
  ConsumerState<ShortcutsViewerScreenContent> createState() => _ShortcutsViewerScreenContentState();
}

class _ShortcutsViewerScreenContentState extends ConsumerState<ShortcutsViewerScreenContent> {
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.shortcuts.isEmpty) {
      return Center(
        child: Text(context.l10n.homeProgramsEmpty),
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.shortcuts.length,
            itemBuilder: (context, index) => ListTile(
              dense: false,
              title: Text(
                widget.shortcuts[index].appName,
              ),
              onTap: () => setState(() => _selectedIndex = index),
            ),
          ),
        ),
        Expanded(
          child: ShortcutDetails(
            shortcut: widget.shortcuts[_selectedIndex],
          ),
        ),
      ],
    );
  }
}

@visibleForTesting
class ShortcutDetails extends StatelessWidget {
  const ShortcutDetails({
    required this.shortcut,
    super.key,
  });

  final SteamShortcut shortcut;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 64,
              height: 64,
              child: shortcut.icon.isNotEmpty
                  ? Image.file(File(shortcut.icon))
                  : ColoredBox(
                      color: context.colorScheme.tertiary,
                      child: Icon(
                        Icons.broken_image,
                        size: 64 * 0.25,
                        color: context.colorScheme.onTertiary,
                      ),
                    ),
            ),
            const Gap(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    shortcut.appName,
                    style: context.textTheme.headlineMedium,
                  ),
                  Text(
                    shortcut.appId.toString(),
                    style: context.textTheme.headlineSmall,
                  ),
                ],
              ),
            ),
          ],
        ),
        const Gap(16),
        TextField(
          readOnly: true,
          controller: TextEditingController()..text = shortcut.target,
          decoration: const InputDecoration(
            label: Text('Target'),
          ),
        ),
        const Gap(4),
        TextField(
          readOnly: true,
          controller: TextEditingController()..text = shortcut.startDir,
          decoration: const InputDecoration(
            label: Text('Start in'),
          ),
        ),
        const Gap(4),
        TextField(
          readOnly: true,
          controller: TextEditingController()..text = shortcut.launchOptions,
          decoration: const InputDecoration(
            label: Text('Launch options'),
          ),
        ),
        const Gap(16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Hidden'),
            Switch(
              value: shortcut.isHidden,
              onChanged: null,
            ),
          ],
        ),
        const Gap(16),
        const Text('Tags'),
        const Gap(4),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: shortcut.tags.map((e) => Text(e)).toList(),
        ),
      ],
    );
  }
}
