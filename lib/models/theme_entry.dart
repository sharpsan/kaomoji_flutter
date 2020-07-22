import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThemeEntry {
  final int id;
  final String name;
  final String description;
  final ThemeData themeData;

  const ThemeEntry({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.themeData,
  });
}
