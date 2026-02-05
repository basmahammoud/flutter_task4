// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class LanguageProvider extends ChangeNotifier {
//   String _currentLanguage = 'en';

//    String get currentLanguage => _currentLanguage;

//   Locale get locale => Locale(_currentLanguage);
//   /// load language
//   Future<void> loadLanguage() async {
//     // Simulate loading from persistent storage
//     // In a real app, you would load this from SharedPreferences
//     final prefs = await SharedPreferences.getInstance();
//      _currentLanguage = prefs.getString('currentLanguage') ?? 'en';
//     notifyListeners();
//   }

//   /// change language
//    Future<void> changeLanguage(String code) async {
//     final prefs = await SharedPreferences.getInstance();
//     _currentLanguage = code;
//     await prefs.setString('currentLanguage', code);
//     notifyListeners();
//   }
// }

