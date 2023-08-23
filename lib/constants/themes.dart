import 'package:flutter/material.dart';
import 'package:kaomoji_flutter/models/theme_entry.dart';

// NOTE: the order of these should follow the theme items list
enum ThemeKey {
  DEFAULT,
  DARK,
  AMOLED_BLACK,
  MEADOW_GREEN,
  MELLOW_YELLOW,
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
      floatingActionButtonTheme: _darkTheme.floatingActionButtonTheme.copyWith(
        backgroundColor: Colors.white,
      ),
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
        tertiary: Colors.white,
        background: Colors.black,
        onSurface: Colors.white,
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
    key: ThemeKey.MELLOW_YELLOW,
    name: "Mellow Yellow",
    themeData: ThemeData(
      primaryColor: Colors.yellow.shade100,
      indicatorColor: Colors.yellow.shade800,
      appBarTheme: AppBarTheme(
        color: Colors.yellow.shade200,
        elevation: 0,
      ),
      scaffoldBackgroundColor: Colors.yellow.shade200,
      primaryColorDark: Colors.yellow.shade900,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.yellow,
        accentColor: Colors.yellow.shade900,
        backgroundColor: Colors.yellow.shade100,
        cardColor: Colors.yellow.shade100,
        errorColor: Colors.red,
        brightness: Brightness.light,
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
