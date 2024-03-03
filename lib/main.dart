import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:non_steam_artwork/core/configs/window_config.dart';
import 'package:non_steam_artwork/core/ui/my_app.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:window_size/window_size.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dir = await getApplicationDocumentsDirectory();
  final defaultDirectory = p.join(dir.path, 'non_steam_artwork');
  if (!await Directory(defaultDirectory).exists()) {
    await Directory(defaultDirectory).create(recursive: true);
  }
  Hive.defaultDirectory = defaultDirectory;

  setWindowMinSize(minWindowSize);
  runApp(const ProviderScope(child: MyApp()));
}
