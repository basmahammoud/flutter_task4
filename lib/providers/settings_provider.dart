import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  bool _isDarkMode = false;
  String _currentLanguage = 'en';

  String get currentLanguage => _currentLanguage;
  bool get isDarkMode => _isDarkMode;

  Locale get locale => Locale(_currentLanguage);

  // loadSettings
  Future<void> loadSettings(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    _currentLanguage = prefs.getString('currentLanguage') ?? 'en';

    // تطبيق اللغة المحفوظة عند البداية
    await context.setLocale(Locale(_currentLanguage));

    notifyListeners();
  }

  //  change theme 
  Future<void> toggleDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkMode = !_isDarkMode;
    await prefs.setBool('isDarkMode', _isDarkMode);
    notifyListeners();
  }

  //  change language
  Future<void> changeLanguage(BuildContext context, String code) async {
    final prefs = await SharedPreferences.getInstance();
    _currentLanguage = code;
    await prefs.setString('currentLanguage', _currentLanguage);

    // تحديث لغة التطبيق فورًا
    await context.setLocale(Locale(code));

    notifyListeners();
  }

  // Reset settings to default values
  Future<void> resetSettings(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkMode = false;
    _currentLanguage = 'en';
    await prefs.remove('isDarkMode');
    await prefs.remove('currentLanguage');
    await context.setLocale(Locale('en'));
    notifyListeners();
  }
}
