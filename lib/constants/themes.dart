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

// These themes were designed for Material 2, so opt out of the Material 3 default.
final _defaultTheme = ThemeData(useMaterial3: false);
final _darkTheme = ThemeData.dark(useMaterial3: false);

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
      tabBarTheme: _darkTheme.tabBarTheme.copyWith(
        indicatorColor: Colors.white,
      ),
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
        backgroundColor: Colors.black,
      ),
      tabBarTheme: _darkTheme.tabBarTheme.copyWith(
        indicatorColor: Colors.white,
        overlayColor: WidgetStateProperty.all(Colors.white),
        dividerColor: Colors.black,
      ),
      colorScheme: _darkTheme.colorScheme.copyWith(
        secondary: Colors.black,
        primary: Colors.black,
        tertiary: Colors.white,
        surface: Colors.black,
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
      useMaterial3: false,
    ),
  ),
  ThemeEntry(
    key: ThemeKey.MELLOW_YELLOW,
    name: "Mellow Yellow",
    themeData: ThemeData(
      useMaterial3: false,
      primaryColor: Colors.yellow.shade100,
      tabBarTheme: TabBarThemeData(
        indicatorColor: Colors.yellow.shade800,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.yellow.shade200,
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
      useMaterial3: false,
    ),
  ),
  ThemeEntry(
    key: ThemeKey.LIME,
    name: "Lime",
    themeData: ThemeData.from(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.lime,
      ),
      useMaterial3: false,
    ),
  ),
  ThemeEntry(
    key: ThemeKey.INDIGO_BLUE,
    name: "Indigo",
    themeData: ThemeData.from(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.indigo,
      ),
      useMaterial3: false,
    ),
  ),
  ThemeEntry(
    key: ThemeKey.PINK,
    name: "Pink",
    themeData: ThemeData.from(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.pink,
      ),
      useMaterial3: false,
    ),
  ),
];
