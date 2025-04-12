import 'package:flutter/material.dart';

enum SteamGridArtType {
  icon(Size(256, 256)),
  cover(Size(600, 900)),
  background(Size(1290, 620)),
  logo(Size(650, 248)),
  hero(Size(920, 430));

  const SteamGridArtType(this.size);

  final Size size;
}
