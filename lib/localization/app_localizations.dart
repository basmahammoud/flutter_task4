import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(
      context,
      AppLocalizations,
    )!;
  }

  static const Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'settings': 'Settings',
      'appearance': 'Appearance',
      'dark_mode': 'Dark Mode',
      'enable_dark_theme': 'Enable dark theme',
      'language': 'Language',
      'app_language': 'App Language',
      'english': 'English',
      'arabic': 'Arabic',
    },
    'ar': {
      'settings': 'الإعدادات',
      'appearance': 'المظهر',
      'dark_mode': 'الوضع الداكن',
      'enable_dark_theme': 'تفعيل الوضع الداكن',
      'language': 'اللغة',
      'app_language': 'لغة التطبيق',
      'english': 'الإنجليزية',
      'arabic': 'العربية',
    },
  };

  String _text(String key) {
    return _localizedValues[locale.languageCode]![key]!;
  }

  String get settings => _text('settings');
  String get appearance => _text('appearance');
  String get darkMode => _text('dark_mode');
  String get enableDarkTheme => _text('enable_dark_theme');
  String get language => _text('language');
  String get appLanguage => _text('app_language');
  String get english => _text('english');
  String get arabic => _text('arabic');
}
class AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
