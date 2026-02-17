import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task4/bloc/language/language_bloc.dart';
import 'package:flutter_task4/bloc/session/session_bloc.dart';
import 'package:flutter_task4/bloc/session/session_event.dart';
import 'package:flutter_task4/bloc/theme/theme_bloc.dart';
import 'package:flutter_task4/bloc/theme/theme_state.dart';
import 'package:flutter_task4/bloc/usage/usage_block.dart';
import 'package:flutter_task4/bloc/user_name/user_bloc.dart';
import 'package:flutter_task4/core/theme/theme.dart';
import 'package:flutter_task4/screens/home_screen.dart';
import 'package:flutter_task4/screens/login_screen.dart';
import 'package:flutter_task4/screens/settings_screen.dart';
import 'package:flutter_task4/screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // final sessionBloc = SessionBloc();
  // sessionBloc.add(const SessionCheck());
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeBloc()),
        BlocProvider(create: (_) => LanguageBloc()),
        BlocProvider(create: (_) => UsageBloc()),
        BlocProvider(create: (_) => UserNameBloc()),
        BlocProvider(create: (_) => SessionBloc()..add(SessionCheck())),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,

            // THEME
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: themeState.isDarkMode ? ThemeMode.dark : ThemeMode.light,

            // LANGUAGE
            locale: context.locale,
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,

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
