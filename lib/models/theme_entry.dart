import 'package:flutter/foundation.dart';
import 'package:kaomoji_flutter/constants/theme_ids.dart';

class ThemeEntry {
  final ThemeIds id;
  final String name;
  final String description;

  const ThemeEntry({
    @required this.id,
    @required this.name,
    @required this.description,
  });
}
