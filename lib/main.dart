import 'package:flutter/material.dart';
import 'package:flutter_task4/core/theme/theme.dart';
import 'package:flutter_task4/localization/app_localizations.dart';
import 'package:flutter_task4/providers/language_provider.dart';
import 'package:flutter_task4/providers/session_provider.dart';
import 'package:flutter_task4/providers/theme_provider.dart';
import 'package:flutter_task4/providers/usage_provider.dart';
import 'package:flutter_task4/screens/home_screen.dart';
import 'package:flutter_task4/screens/login_screen.dart';
import 'package:flutter_task4/screens/settings_screen.dart';
import 'package:flutter_task4/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SessionProvider()..loadSession()),
        ChangeNotifierProvider(
          create: (_) => UsageProvider()..loadUsageCount(),
        ),
        ChangeNotifierProvider(create: (_) => ThemeProvider()..loadTheme()),
        // ChangeNotifierProvider(
        //   create: (_) => LanguageProvider()..loadLanguage(),
        // ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,

            // THEME
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: themeProvider.isDarkMode
                ? ThemeMode.dark
                : ThemeMode.light,

            // LANGUAGE
            // locale: languageProvider.locale,
            // supportedLocales: const [Locale('en'), Locale('ar')],
            // localizationsDelegates: const [
            //   AppLocalizationsDelegate(), //  translations file
          
            // ],

            routes: {
              '/': (context) => const SplashScreen(),
              '/login': (context) => const LoginScreen(),
              '/home': (context) => const HomeScreen(),
              '/settings': (context) => const SettingsScreen(),
            },
          );
        },
      ),
    );
  }
}
