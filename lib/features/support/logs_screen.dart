import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:non_steam_artwork/core/l10n/l10n_extension.dart';
import 'package:non_steam_artwork/core/logging/logger.dart';

class LogsScreen extends ConsumerWidget {
  const LogsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(logsViewerProvider);

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.logsScreenTitle)),
      body: switch (state) {
        AsyncData(:final value) => ListView(
          children: value
              .map((log) => ListTile(dense: true, title: Text(log.message), subtitle: log.subtitle))
              .toList(),
        ),
        _ => const SizedBox.shrink(),
      },
    );
  }

  static void show(BuildContext context) =>
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LogsScreen()));
}

extension on LogEvent {
  Widget? get subtitle {
    if (className == null || methodName == null || lineNumber == null) {
      return null;
    }

    return Text('${className!}.${methodName!}(${lineNumber!})');
  }
}
