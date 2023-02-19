import 'package:flutter/material.dart';
import 'package:kaomoji_flutter/constants/themes.dart';

class ThemeEntry {
  final ThemeKey key;
  final String name;
  final ThemeData themeData;

  const ThemeEntry({
    required this.key,
    required this.name,
    required this.themeData,
  });
}
