import 'package:flutter/material.dart';
import 'package:kaomoji_flutter/models/theme_entry.dart';

// NOTE: the order of these should follow the theme items list
enum ThemeKey {
  DEFAULT,
  DARK,
  AMOLED_BLACK,
  MEADOW_GREEN,
  PURPLE,
  LIME,
  INDIGO_BLUE,
  PINK,
}

final _defaultTheme = ThemeData();
final _darkTheme = ThemeData.dark();

final appThemes = [
  ThemeEntry(
    key: ThemeKey.DEFAULT,
    name: 'Blue (Default)',
    themeData: _defaultTheme.copyWith(
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: _defaultTheme.primaryColor,
    ),
  ),
  ThemeEntry(
    key: ThemeKey.DARK,
    name: 'Dark',
    themeData: _darkTheme.copyWith(
      indicatorColor: Colors.white,
      colorScheme: _darkTheme.colorScheme.copyWith(
        secondary: Colors.white,
      ),
    ),
  ),
  ThemeEntry(
    key: ThemeKey.AMOLED_BLACK,
    name: "AMOLED Black",
    themeData: _darkTheme.copyWith(
      scaffoldBackgroundColor: Colors.black,
      primaryColor: Colors.black,
      cardColor: Colors.black,
      indicatorColor: Colors.white,
      buttonTheme: _darkTheme.buttonTheme.copyWith(
        colorScheme: _darkTheme.colorScheme.copyWith(
          primary: Colors.black,
          secondary: Colors.white,
        ),
      ),
      appBarTheme: _darkTheme.appBarTheme.copyWith(
        color: Colors.black,
      ),
      tabBarTheme: _darkTheme.tabBarTheme.copyWith(
        indicatorColor: Colors.white,
        overlayColor: MaterialStateProperty.all(Colors.white),
        dividerColor: Colors.black,
      ),
      colorScheme: _darkTheme.colorScheme.copyWith(
        secondary: Colors.black,
        primary: Colors.black,
        tertiary: Colors.black,
        background: Colors.black,
      ),
    ),
  ),
  ThemeEntry(
    key: ThemeKey.MEADOW_GREEN,
    name: "Meadow",
    themeData: ThemeData.from(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.green,
      ),
    ),
  ),
  ThemeEntry(
    key: ThemeKey.PURPLE,
    name: "Purple",
    themeData: ThemeData.from(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.purple,
      ),
    ),
  ),
  ThemeEntry(
    key: ThemeKey.LIME,
    name: "Lime",
    themeData: ThemeData.from(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.lime,
      ),
    ),
  ),
  ThemeEntry(
    key: ThemeKey.INDIGO_BLUE,
    name: "Indigo",
    themeData: ThemeData.from(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.indigo,
      ),
    ),
  ),
  ThemeEntry(
    key: ThemeKey.PINK,
    name: "Pink",
    themeData: ThemeData.from(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.pink,
      ),
    ),
  ),
];
