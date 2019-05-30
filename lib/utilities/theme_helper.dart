import 'package:flutter/material.dart';
import 'package:kaomoji_flutter/constants/theme_ids.dart';

class ThemeHelper {
  final BuildContext context;

  ThemeHelper({this.context});

  ThemeData getThemeById(int themeId) {
    switch(themeId) {
      case ThemeIds.DEFAULT_THEME:
        return getDefaultTheme();
      case ThemeIds.DARK_THEME:
        return getDarkTheme();
      case ThemeIds.AMOLED_BLACK_THEME:
       return getAmoledTheme();
      default:
        return getDefaultTheme();
    }
  }

  ThemeData getDefaultTheme() {
    return ThemeData(
      primaryColor: Colors.blue,
    );
  }

  ThemeData getDarkTheme() {
    return ThemeData.dark().copyWith(
      accentColor: Colors.blue,
      indicatorColor: Colors.blue,
    );
  }

  ThemeData getAmoledTheme() {
    return ThemeData(
      primaryColor: Colors.black,
      accentColor: Colors.blue,
    );
  }

}
