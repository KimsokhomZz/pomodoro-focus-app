import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
      //theme for text
      fontFamily: 'Zain', // Set the global font to 'Zain'
      //theme for input field
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: const Color(0xff353935).withOpacity(0.5),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xff353935), width: 1.5),
        ),
        contentPadding: const EdgeInsets.all(16),
      ),
      //theme of button
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(16),
          backgroundColor: const Color(0xff353935),
          foregroundColor: Colors.white, // Text color
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(16),
          backgroundColor: Colors.white, // Slightly transparent
          side: BorderSide(color: const Color(0xff353935).withOpacity(0.5)),
          foregroundColor: const Color(0xff353935), // Text color
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
      scaffoldBackgroundColor: Colors.white,
    );
  }
}
