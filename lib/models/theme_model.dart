import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'theme_entry.dart';

class ThemeModel extends ChangeNotifier {
  ThemeModel() {
    _theme = _loadTheme();
  }

  Future<ThemeData> _theme;

  Future<ThemeData> get theme => _theme;
  Map<Themes, ThemeEntry> get themes => _themes;

  Future<ThemeData> _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int themeIdInt = (prefs.getInt('theme') ?? Themes.DEFAULT.index);
    ThemeData theme = getThemeById(themeIdInt).themeData;
    return theme;
  }

  Future<void> loadTheme() async {
    _theme = _loadTheme();
    notifyListeners();
  }

  void applyTheme(int themeId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('theme', themeId).whenComplete(() {
      loadTheme();
    });
  }

  ThemeData getThemeData(Themes theme) {
    return _themes[theme].themeData;
  }

  ThemeEntry getThemeById(int themeId) {
    return _themes.values.firstWhere((entry) => entry.id == themeId);
  }

  ////////// THEMES //////////

  Map<Themes, ThemeEntry> _themes = {
    Themes.DEFAULT: ThemeEntry(
      id: 0,
      name: 'Default',
      description: 'Blue light theme',
      themeData: ThemeData(
        primaryColor: Colors.blue,
      ),
    ),
    Themes.DARK: ThemeEntry(
      id: 1,
      name: 'Dark',
      description: 'Material grey hybrid theme',
      themeData: ThemeData(
        primaryColor: Color(0xFF222222),
        indicatorColor: Colors.blue,
      ),
    ),
    Themes.DARKER: ThemeEntry(
      id: 2,
      name: 'Darker',
      description: 'Material grey dark theme',
      themeData: ThemeData.dark().copyWith(
        accentColor: Colors.white,
        indicatorColor: Colors.white,
      ),
    ),
    Themes.BLACK: ThemeEntry(
      id: 3,
      name: 'Black',
      description: 'Black hybrid theme',
      themeData: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.blue,
      ),
    ),
    Themes.AMOLED_BLACK: ThemeEntry(
      id: 4,
      name: "AMOLED Black",
      description: "Black dark theme",
      themeData: ThemeData.dark().copyWith(
        primaryColor: Colors.black,
        accentColor: Colors.white,
        indicatorColor: Colors.white,
        cardColor: Colors.black,
      ),
    ),
    Themes.RED_GREY: ThemeEntry(
      id: 5,
      name: "Red/Grey",
      description: "Light theme",
      themeData: ThemeData(
        primaryColor: Colors.grey.shade600,
        accentColor: Colors.red,
      ),
    ),
  };
}

enum Themes {
  DEFAULT,
  DARK,
  DARKER,
  BLACK,
  AMOLED_BLACK,
  RED_GREY,
}
