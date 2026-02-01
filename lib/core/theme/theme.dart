import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: false,

  colorScheme: const ColorScheme.light(
    primary: Color(0xFF9C80E6),
    secondary: Color(0xFF5F4B8B),
    //background: Color(0xFFF6F6FA),
    surface: Color.fromARGB(255, 110, 62, 128),
    secondaryContainer:Color(0x6ECEA3FF),
    onSecondary: Color(0xFF612F72),
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
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25),
    ),
  ),


  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      color: Color(0xFF696969),
    ),
    titleSmall: TextStyle(
      fontSize: 20,
      color: Color.fromARGB(255, 202, 1, 1),
    ),
  ),
);



ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: false,

  colorScheme: const ColorScheme.dark(
    primary: Color(0xFFB39DDB),
    secondary: Color(0xFF591D59),
    //background: Color(0xFF591D59),
    surface: Color.fromARGB(255, 127, 66, 135),
    secondaryContainer:Color(0xFF591D59),
    onSecondary: Color(0xFF53014C),
  ),

  //لون الخلفية
  scaffoldBackgroundColor: const Color(0xFF303030),

  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF53014C),
    foregroundColor: Colors.white,
    elevation: 0,
  ),

////////لون الكارد
  cardTheme: const CardThemeData(
    color:  Color.fromARGB(255, 142, 0, 130),
    elevation: 10,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(25)),
    ),
  ),

  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      color: Colors.grey,
    ),
     titleSmall: TextStyle(
      fontSize: 20,
      color: Color.fromARGB(255, 202, 1, 1),
    ),
  ),
);
