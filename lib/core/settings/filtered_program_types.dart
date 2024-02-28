import 'package:non_steam_artwork/core/steam/steam_program.dart';

class FilteredProgramTypes {
  FilteredProgramTypes._(this._types);

  final Map<SteamProgramType, bool> _types;
  Map<SteamProgramType, bool> get internalMap => Map.unmodifiable(_types);

  void toggleTypeValue(SteamProgramType type) => _types[type] = !_types[type]!;

  Map<String, dynamic> toJson() => _types.map((key, value) => MapEntry(key.name, value));

  factory FilteredProgramTypes() => FilteredProgramTypes.fromJson({});

  factory FilteredProgramTypes.fromJson(Map<String, dynamic> json) {
    final types = <SteamProgramType, bool>{};
    for (final type in SteamProgramType.values) {
      types[type] = json[type.name] ?? _defaults[type]!;
    }

    return FilteredProgramTypes._(types);
  }

  static const _defaults = {
    SteamProgramType.lutris: true,
    SteamProgramType.heroic: false,
    SteamProgramType.roms: false,
    SteamProgramType.other: true,
  };
}
