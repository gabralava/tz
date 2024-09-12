import 'package:flutter/material.dart';

class TextThemeStyle {
  static TextTheme light = const TextTheme(
    headlineLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 188, 188, 191), fontFamily: 'Nunito'),
    titleLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: Color.fromARGB(255, 76, 76, 105), fontFamily: 'Nunito'),
    titleMedium: TextStyle(fontSize: 11, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 76, 76, 105), fontFamily: 'Nunito'),
    bodyLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 188, 188, 191), fontFamily: 'Nunito'),
    bodyMedium: TextStyle(fontSize: 11, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 188, 188, 191), fontFamily: 'Nunito'),
  );
}