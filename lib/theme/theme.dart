import 'package:flutter/material.dart';

class AppTheme {
  // ---------------- LIGHT THEME ----------------
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,

    primaryColor: const Color(0xFF5B3CC4),

    scaffoldBackgroundColor: Colors.white,

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF5B3CC4),
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
    ),

    colorScheme: const ColorScheme.light(
      primary: Color(0xFF5B3CC4),
      secondary: Color(0xFF7C6AE6),
      background: Colors.white,
      surface: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onBackground: Color(0xFF1F1F1F),
      onSurface: Color(0xFF1F1F1F),
      error: Color(0xFFD32F2F),
    ),

    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Color(0xFF1F1F1F),
      ),
      bodyMedium: TextStyle(fontSize: 14, color: Color(0xFF5F5F5F)),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF5B3CC4),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),

    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );

  // ---------------- DARK THEME ----------------
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,

    primaryColor: const Color(0xFF8B7CF6),

    scaffoldBackgroundColor: const Color(0xFF0F1022),

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1A1B3A),
      foregroundColor: Color(0xFFEDEDF4),
      elevation: 0,
      centerTitle: true,
    ),

    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF8B7CF6),
      secondary: Color(0xFFAFA8FF),
      background: Color(0xFF0F1022),
      surface: Color(0xFF1A1B3A),
      onPrimary: Colors.black,
      onSecondary: Colors.black,
      onBackground: Color(0xFFEDEDF4),
      onSurface: Color(0xFFEDEDF4),
      error: Color(0xFFF87171),
    ),

    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Color(0xFFEDEDF4),
      ),
      bodyMedium: TextStyle(fontSize: 14, color: Color(0xFFB5B6D6)),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF8B7CF6),
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),

    cardTheme: CardThemeData(
      color: const Color(0xFF1A1B3A),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}
