import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Color.fromARGB(255, 255, 255, 255),
        onPrimary: Colors.black,
        secondary: Color.fromARGB(255, 255, 255, 255),
        onSecondary: Colors.black,
        error: Colors.red,
        onError: Colors.white,
        surface: Color.fromARGB(255, 255, 255, 255),
        onSurface: Colors.black,
      ),
      useMaterial3: true,
    );
  }
}
