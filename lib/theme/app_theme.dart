import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color text = Color(0xFFd3f8fc);
  static const Color background = Color(0xFF090d10);
  static const Color secondaryBackground = Color(0xFF0E181C);
  static const Color primary = Color(0xFF7be4f6);
  static const Color secondary = Color(0xFF0F172A);
  static const Color accent = Color(0xFF4b3af2);

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: background,
    fontFamily: 'NotoSans',

    colorScheme: const ColorScheme.dark(
      primary: primary,
      secondary: secondary,
      surface: secondaryBackground,
      onSurface: text,
    ),

    textTheme: const TextTheme(
      displayMedium: TextStyle(
        fontFamily: 'Noto Sans',
        fontWeight: FontWeight.w500,
        fontSize: 20,
        letterSpacing: -0.6,
        color: background
      ),

      bodyMedium: TextStyle(
        fontFamily: 'Noto Sans',
        fontWeight: FontWeight.w500,
        fontSize: 16,
        letterSpacing: -0.48,
        color: text,
      ),

      bodyLarge: TextStyle(
        fontFamily: 'Noto Sans',
        fontWeight: FontWeight.w500,
        fontSize: 20,
        letterSpacing: -0.6,
        color: text,
      ),

      headlineMedium: TextStyle(
        fontFamily: 'Noto Sans',
        fontWeight: FontWeight.w600,
        fontSize: 24,
        letterSpacing: -0.72,
        color: text,
      ),

      headlineLarge: TextStyle(
        fontFamily: 'Noto Sans',
        fontWeight: FontWeight.w600,
        fontSize: 28,
        letterSpacing: -0.84,
        color: text,
      ),
    ),
  );
}