import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:non_steam_artwork/core/extensions/theme_extensions.dart';
import 'package:non_steam_artwork/core/l10n/l10n_extension.dart';
import 'package:non_steam_artwork/core/settings/state.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SteamGridDBDialog extends ConsumerStatefulWidget {
  const SteamGridDBDialog({super.key});

  static void show(BuildContext context) => showDialog(
        context: context,
        builder: (context) => const SteamGridDBDialog(),
      );

  @override
  ConsumerState<SteamGridDBDialog> createState() => _SteamGridDBDialogState();
}

class _SteamGridDBDialogState extends ConsumerState<SteamGridDBDialog> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  late final bool _canDelete;
  var _canSubmit = false;

  @override
  void initState() {
    super.initState();

    final apiKey = ref.read(steamGridDBApiKeyControllerProvider);
    _canDelete = apiKey != null;
    _controller = TextEditingController()
      ..text = apiKey ?? ''
      ..addListener(() {
        final canSubmit = _controller.text.length == 32;
        if (canSubmit != _canSubmit) {
          setState(() => _canSubmit = canSubmit);
        }
      });
    _focusNode = FocusNode();
    if (apiKey == null) {
      _focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(context.l10n.steamGridDBDialogTitle),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _controller,
            focusNode: _focusNode,
            enableSuggestions: false,
            maxLength: 32,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[a-z0-9]')),
            ],
          ),
          SizedBox(
            width: 400,
            height: 50,
            child: MarkdownWidget(
              data: context.l10n.steamGridDBDialogDescription,
              shrinkWrap: true,
              config: MarkdownConfig(
                configs: [
                  LinkConfig(
                    style: TextStyle(
                      color: context.colorScheme.primary,
                      decoration: TextDecoration.underline,
                    ),
                    onTap: (url) => launchUrlString(url),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: _canDelete
              ? () {
                  ref.read(steamGridDBApiKeyControllerProvider.notifier).set(null);
                  Navigator.of(context).pop();
                }
              : null,
          child: Text(
            MaterialLocalizations.of(context).deleteButtonTooltip,
            style: _canDelete
                ? TextStyle(
                    color: context.colorScheme.error,
                  )
                : null,
          ),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(MaterialLocalizations.of(context).closeButtonLabel),
        ),
        TextButton(
          onPressed: _canSubmit
              ? () {
                  ref.read(steamGridDBApiKeyControllerProvider.notifier).set(_controller.text);
                  Navigator.of(context).pop();
                }
              : null,
          child: Text(MaterialLocalizations.of(context).continueButtonLabel),
        ),
      ],
    );
  }
}
