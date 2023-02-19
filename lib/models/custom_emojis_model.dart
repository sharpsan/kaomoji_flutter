import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const CUSTOM_EMOJIS_KEY = 'custom_emojis';

class CustomEmojisModel extends ChangeNotifier {
  late Future<List<String>> _customEmojis;
  Future<List<String>> get customEmojis => _customEmojis;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  CustomEmojisModel() {
    _customEmojis = _loadCustomEmojis();
  }

  Future<void> initCustomEmojis() async {
    _customEmojis = _loadCustomEmojis();
    notifyListeners();
  }

  void addCustomEmoji(String emoji) async {
    final customEmojis = await _customEmojis;
    customEmojis.add(emoji);
    _saveCustomEmojis(customEmojis);
    notifyListeners();
  }

  void removeCustomEmoji(String emoji) async {
    final customEmojis = await _customEmojis;
    customEmojis.remove(emoji);
    _saveCustomEmojis(customEmojis);
    notifyListeners();
  }

  Future<List<String>> _loadCustomEmojis() async {
    final prefs = await _prefs;
    return prefs.getStringList(CUSTOM_EMOJIS_KEY) ?? [];
  }

  void _saveCustomEmojis(List<String> emojis) async {
    final prefs = await _prefs;
    await prefs.setStringList(CUSTOM_EMOJIS_KEY, emojis);
  }
}
