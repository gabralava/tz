import 'package:flutter/material.dart';
import 'package:tz/theme/text_theme.dart';

class ThemeDataStyle {
  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
    ),
    colorScheme: const ColorScheme.light(
      primaryContainer: Color.fromRGBO(255, 135, 2, 1),
      primary: Color.fromRGBO(225, 135, 2, 0.25),
      secondaryContainer: Color.fromRGBO(242, 242, 242, 1),
      secondary: Color.fromRGBO(188, 188, 191, 1),
      surface: Color.fromRGBO(225, 221, 216, 1),
    ),
    textTheme: TextThemeStyle.light,
  );
}