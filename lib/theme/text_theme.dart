import 'package:flutter/material.dart';

// TODO: Переделать все в RGBO

class TextThemeStyle {
  static TextTheme light = const TextTheme(
    headlineLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Color.fromRGBO(188, 188, 191, 1), fontFamily: 'Nunito'),
    labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Color.fromRGBO(255, 255, 255, 1), fontFamily: 'Nunito'),
    labelSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Color.fromRGBO(188, 188, 191, 1), fontFamily: 'Nunito'),
    titleLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: Color.fromARGB(255, 76, 76, 105), fontFamily: 'Nunito'),
    titleMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 76, 76, 105), fontFamily: 'Nunito'),
    titleSmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 76, 76, 105), fontFamily: 'Nunito'),
    bodyLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 188, 188, 191), fontFamily: 'Nunito'),
    bodyMedium: TextStyle(fontSize: 11, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 188, 188, 191), fontFamily: 'Nunito'),
  );
}