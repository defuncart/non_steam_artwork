import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    return Text(shortcut.toString());
  }
}
