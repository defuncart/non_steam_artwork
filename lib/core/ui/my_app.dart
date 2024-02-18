import 'package:flutter/material.dart';
import 'package:non_steam_artwork/core/ui/app_window.dart';
import 'package:non_steam_artwork/features/splash/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppWindow(
      child: SplashScreen(),
    );
  }
}
