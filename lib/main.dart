import 'package:flutter/material.dart';
import 'package:flutter_task4/providers/language_provider.dart';
import 'package:flutter_task4/providers/session_provider.dart';
import 'package:flutter_task4/providers/settings_provider.dart';
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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SettingsProvider()..loadSettings(),
        ),
        ChangeNotifierProvider(create: (_) => SessionProvider()..loadSession()),
        ChangeNotifierProvider(
          create: (_) => UsageProvider()..loadUsageCount(),
        ),
        ChangeNotifierProvider(create: (_) => ThemeProvider()..loadTheme()),
        ChangeNotifierProvider(
          create: (_) => LanguageProvider()..loadLanguage(),
        ),
      ],
      child: Consumer3<SettingsProvider, ThemeProvider, LanguageProvider>(
        builder: (context, settingsProvider, themeProvider, languageProvider,child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: settingsProvider.isDarkMode
                ? ThemeData.dark()
                : ThemeData.light(),
         locale: languageProvider.locale,
            routes: {
              '/': (context) => SplashScreen(),
              '/login': (context) => LoginScreen(),
              '/home': (context) => HomeScreen(),
              '/settings': (context) => const SettingsScreen(),
            },
          );
        },
      ),
    );
  }
}
