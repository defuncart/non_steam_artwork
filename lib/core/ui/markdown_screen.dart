import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;
import 'package:markdown_widget/markdown_widget.dart';
import 'package:non_steam_artwork/core/extensions/iterable_widget_extension.dart';
import 'package:non_steam_artwork/core/extensions/theme_extensions.dart';
import 'package:non_steam_artwork/core/l10n/l10n_extension.dart';
import 'package:non_steam_artwork/core/logging/logger.dart';

class MarkdownScreen extends ConsumerStatefulWidget {
  const MarkdownScreen({
    required this.title,
    required this.url,
    super.key,
  });

  final String title;
  final String url;

  @override
  ConsumerState<MarkdownScreen> createState() => _MarkdownScreenState();
}

class _MarkdownScreenState extends ConsumerState<MarkdownScreen> {
  Future<String> _getData() async {
    final response = await http.get(Uri.parse(widget.url));
    return response.body;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: FutureBuilder(
          future: _getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasData && snapshot.data!.isEmpty) {
              ref.log('Empty content for ${widget.url}');

              return Center(
                child: Text(
                  context.l10n.generalErrorTitle,
                  style: context.textTheme.bodyLarge,
                ),
              );
            }

            if (snapshot.hasError) {
              ref.log('Error loading ${widget.url}: ${snapshot.error!}');

              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      context.l10n.generalErrorTitle,
                      style: context.textTheme.bodyLarge,
                    ),
                    Text(
                      context.l10n.generalErrorNoInternetDescription,
                    ),
                    TextButton(
                      onPressed: () => setState(() {}),
                      child: Text(context.l10n.generalErrorTryAgain),
                    ),
                  ].intersperse(const Gap(4)),
                ),
              );
            }

            return MarkdownWidget(
              selectable: true,
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
              data: snapshot.data!,
            );
          },
        ),
      );
}
