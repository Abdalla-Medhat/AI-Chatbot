import "package:flutter/material.dart";

class Themes {
  ColorScheme get colorScheme =>
      ColorScheme.fromSeed(seedColor: const Color(0xFF1E88E5)).copyWith(
        primary: const Color(0xFF1E88E5),
        onPrimary: const Color(0xFFFFFFFF),
        secondary: const Color(0xFF5d799e),
        tertiary: const Color(0xFFcc6c00),
        surface: const Color(0xFFF8F9FA),
        surfaceContainer: Colors.white,
      );
  ThemeData get lightTheme => ThemeData(
    brightness: Brightness.light,

    colorScheme: colorScheme,

    textTheme: ThemeData().textTheme.copyWith(
      titleMedium: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
      titleSmall: const TextStyle(color: Colors.blueGrey),
      headlineLarge: ThemeData().textTheme.headlineLarge?.copyWith(
        fontWeight: FontWeight.bold,
        color: colorScheme.onSurface,
      ),
      bodyLarge: ThemeData().textTheme.bodyLarge?.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF1E88E5),
        foregroundColor: colorScheme.surface,
      ),
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      shadowColor: Colors.transparent,
      elevation: 0,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide.none,
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        // borderSide: BorderSide(color: Colors.grey),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(color: Colors.green, width: 2),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(color: Colors.red),
      ),

      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),

      hintStyle: TextStyle(color: Colors.grey),
      labelStyle: TextStyle(color: Colors.black),
    ),
  );
}
