import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'theme_entry.dart';
import 'package:kaomoji_flutter/constants/themes.dart';

class ThemeModel extends ChangeNotifier {
  ThemeModel() {
    _theme = _loadTheme();
  }

  late Future<ThemeEntry> _theme;
  Future<ThemeEntry> get theme => _theme;
  List<ThemeEntry> get themes => appThemes;

  Future<ThemeEntry> _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int themeIdInt = (prefs.getInt('theme') ?? ThemeKey.DEFAULT.index);
    ThemeEntry themeEntry = getThemeByIndex(themeIdInt);
    return themeEntry;
  }

  Future<void> initTheme() async {
    _theme = _loadTheme();
    notifyListeners();
  }

  void applyTheme(ThemeKey key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('theme', key.index).whenComplete(() {
      initTheme();
    });
  }

  ThemeEntry getDefaultTheme() {
    return appThemes.firstWhere((e) => e.key == ThemeKey.DEFAULT);
  }

  ThemeEntry getTheme(ThemeKey key) {
    return appThemes.firstWhere(
      (e) => key == e.key,
      orElse: () => getDefaultTheme(),
    );
  }

  ThemeEntry getThemeByIndex(int themeIndex) {
    return appThemes[themeIndex];
  }
}
