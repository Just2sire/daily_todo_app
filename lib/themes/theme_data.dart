import 'package:flutter/material.dart';

class ThemeClass {
  // Color lightPrimaryColor = const Color(0xFFF6F6F6);
  static const Color primaryColor = Color(0xFF9581FF);
  static const Color accentColor = Color(0xFFFFC804);
  static const Color darkColor = Color(0xFF000000);
  static const Color secondaryColor = Color(0xFF0F071A);
  static const Color lightColor = Color(0xFFF6F6F6);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: Color(0xFF9581FF),
    scaffoldBackgroundColor: secondaryColor,
    colorScheme: ColorScheme.fromSeed(
      primary: Color(0xFF9581FF),
      secondary: Color(0xFF0F071A),
      background: Color(0xFF9581FF),
      surface: Colors.white,
      tertiary: Color(0xFFFFC804),
      seedColor: const Color(0xFFF6F6F6),
      // primary: const Color.from
    ),
  );
}

ThemeClass _themeClass = ThemeClass();
