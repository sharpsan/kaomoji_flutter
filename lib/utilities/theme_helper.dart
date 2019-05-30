import 'package:flutter/material.dart';
import 'package:kaomoji_flutter/constants/theme_ids.dart';

class ThemeHelper {
  final BuildContext context;

  ThemeHelper({this.context});

  ThemeData getThemeById(int themeId) {
    ThemeIds themeIdEnum = ThemeIds.values[themeId];
    switch(themeIdEnum) {
      case ThemeIds.DEFAULT:
        return getDefaultTheme();
//      case ThemeIds.LIGHT:
//        return getLightTheme();
      case ThemeIds.DARK:
        return getDarkTheme();
      case ThemeIds.DARKER:
        return getDarkerTheme();
      case ThemeIds.BLACK:
       return getBlackTheme();
      case ThemeIds.AMOLED_BLACK:
        return getAmoledBlackTheme();
      case ThemeIds.RED_GREY:
        return getRedGreytheme();
      default:
        return getDefaultTheme();
    }
  }

  ThemeData getDefaultTheme() {
    return ThemeData(
      primaryColor: Colors.blue,
    );
  }

  ThemeData getLightTheme() {
    return ThemeData(
      primaryColor: Colors.white,
    );
  }

  ThemeData getDarkTheme() {
    return ThemeData(
      primaryColor: Color(0xFF222222),
      indicatorColor: Colors.blue,
    );
  }

  ThemeData getDarkerTheme() {
    return ThemeData.dark().copyWith(
      accentColor: Colors.white,
      indicatorColor: Colors.white,
    );
  }

  ThemeData getBlackTheme() {
    return ThemeData(
      primaryColor: Colors.black,
      accentColor: Colors.blue,
    );
  }

  ThemeData getAmoledBlackTheme() {
    return ThemeData.dark().copyWith(
      primaryColor: Colors.black,
      accentColor: Colors.white,
      indicatorColor: Colors.white,
      cardColor: Colors.black,
    );
  }

  ThemeData getRedGreytheme() {
    return ThemeData(
      primaryColor: Colors.grey.shade600,
      accentColor: Colors.red,
    );
  }

}
