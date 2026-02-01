import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  bool _isDarkMode = false;
  String _languageCode = 'en';

  bool get isDarkMode => _isDarkMode;
  String get languageCode => _languageCode;

  // Retrieving recorded data
  Future<void> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();

    _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    _languageCode = prefs.getString('languageCode') ?? 'en';

    notifyListeners();
  }

  // change theme mode
  Future<void> toggleDarkMode() async {
    final prefs = await SharedPreferences.getInstance();

    _isDarkMode = !_isDarkMode;

    await prefs.setBool('isDarkMode', _isDarkMode);

    notifyListeners();
  }

  // change language
  Future<void> changeLanguage(String code) async {
    final prefs = await SharedPreferences.getInstance();

    _languageCode = code;

    await prefs.setString('languageCode', _languageCode);

    notifyListeners();
  }
}
