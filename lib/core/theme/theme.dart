import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: false,

  colorScheme: const ColorScheme.light(
    primary: Color(0xFFE3F2FD),
    secondary: Color(0xFF5F4B8B),
  ),
  //لون الخلفية
  scaffoldBackgroundColor: const Color(0xFFF6F6FA),

  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF612F72),
    foregroundColor: Colors.white,
    elevation: 0,
  ),

  cardTheme: CardThemeData(
    color: Color(0xFF9C80E6),
    elevation: 10,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
  ),

  iconTheme: IconThemeData(color: const Color.fromARGB(255, 53, 53, 53)),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF5F4B8B),
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: false,

  colorScheme: const ColorScheme.dark(
    primary: Color(0xFFB39DDB),
    secondary: Color(0xFF591D59),
  ),

  //لون الخلفية
  scaffoldBackgroundColor: const Color(0xFF303030),

  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF53014C),
    foregroundColor: Colors.white,
    elevation: 0,
  ),

  iconTheme: IconThemeData(color: const Color.fromARGB(255, 0, 0, 0)),

  ////////لون الكارد
  cardTheme: const CardThemeData(
    color: Color.fromARGB(255, 142, 0, 130),
    elevation: 10,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(25)),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF591D59),
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  ),
);
