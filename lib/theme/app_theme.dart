import 'package:flutter/material.dart';

class AppTheme {
  static const Color succes = Colors.green;
  static const Color echec = Colors.red;

  static ThemeData clair() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.green,
        brightness: Brightness.light,
      ),
    );
  }

  static ThemeData sombre() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.green,
        brightness: Brightness.dark,
      ),
    );
  }
}