import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF4A90E2);
  static const Color secondaryColor = Color(0xFFF5A623);
  static const Color backgroundColor = Color(0xFFF0F0F0);
  static const Color cardColor = Colors.white;
  static const Color textColor = Color(0xFF333333);

  static const TextStyle headlineStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: textColor,
  );

  static const TextStyle bodyStyle = TextStyle(
    fontSize: 18,
    color: textColor,
  );

  static const TextStyle buttonTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle cardTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: textColor,
  );

  static const TextStyle appBarTitleStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static ThemeData get themeData {
    return ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: secondaryColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          textStyle: buttonTextStyle,
        ),
      ),
    );
  }
}