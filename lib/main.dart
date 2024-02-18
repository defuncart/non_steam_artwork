import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:non_steam_artwork/core/ui/my_app.dart';
import 'package:non_steam_artwork/features/licenses/licenses_window.dart';
import 'package:window_size/window_size.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();

  if (args.firstOrNull == 'multi_window') {
    runApp(const LicensesWindow());
  } else {
    setWindowMinSize(const Size(1060, 580));
    runApp(const ProviderScope(child: MyApp()));
  }
}
