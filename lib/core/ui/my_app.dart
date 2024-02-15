import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:non_steam_artwork/core/steam/steam_shortcuts.dart';
import 'package:non_steam_artwork/core/theme/themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const steamShortcuts = SteamShortcuts();
    steamShortcuts.init().then((_) => steamShortcuts.getShortcuts());

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var shortcuts = <SteamShortcut>[];
  var lutrisShortcuts = <SteamShortcut>[];
  var heroicShortcuts = <SteamShortcut>[];
  var romShortcuts = <SteamShortcut>[];
  var otherShortcuts = <SteamShortcut>[];

  @override
  void initState() {
    super.initState();

    _init();
  }

  Future<void> _init() async {
    const shortcutsService = SteamShortcuts();
    await shortcutsService.init();
    shortcuts = await shortcutsService.getShortcuts();
    lutrisShortcuts = shortcuts.where((element) => element.launchOptions.contains('net.lutris.Lutris')).toList();
    heroicShortcuts = shortcuts.where((element) => element.launchOptions.contains('com.heroicgameslauncher')).toList();
    romShortcuts = shortcuts.where((element) => element.launchOptions.contains('Emulation/roms')).toList();
    otherShortcuts = List.from(shortcuts)
      ..removeWhere(
        (element) =>
            lutrisShortcuts.contains(element) || heroicShortcuts.contains(element) || romShortcuts.contains(element),
      );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('non_steam_artwork')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('There are ${shortcuts.length} shortcuts'),
            Text('lutris: ${lutrisShortcuts.length}'),
            Text('heroic: ${heroicShortcuts.length}'),
            Text('roms: ${romShortcuts.length}'),
            Text('other: ${otherShortcuts.length}'),
          ],
        ),
      ),
    );
  }
}
