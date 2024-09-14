import 'package:flutter/material.dart';

class TextThemeStyle {
  static TextTheme light = const TextTheme(
    displayLarge: TextStyle(fontSize: 26, fontWeight: FontWeight.w800, color: Color.fromRGBO(76, 76, 105, 1), fontFamily: 'Nunito'), // Год в календаре
    displayMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Color.fromRGBO(76, 76, 105, 1), fontFamily: 'Nunito'), // Большие месяца в календаре
    displaySmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Color.fromRGBO(188, 188, 191, 1), fontFamily: 'Nunito'), // Кнопка сохранить
    headlineLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Color.fromRGBO(188, 188, 191, 1), fontFamily: 'Nunito'), // Дата
    headlineMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color.fromRGBO(188, 188, 191, 1), fontFamily: 'Nunito'), // Кнопка сегодня
    headlineSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color.fromRGBO(76, 76, 105, 1), fontFamily: 'Nunito'), // Дни месяца в большом календаре
    titleLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: Color.fromRGBO(76, 76, 105, 1), fontFamily: 'Nunito'), // Заголовки в главном меню
    titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color.fromRGBO(188, 188, 191, 1), fontFamily: 'Nunito'), // Года в календаре
    titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color.fromRGBO(76, 76, 105, 1), fontFamily: 'Nunito'), // Маленькие месяца в календаре
    bodyLarge: TextStyle(fontSize: 11, fontWeight: FontWeight.w400, color: Color.fromRGBO(145, 158, 171, 1), fontFamily: 'Nunito'), // Текст активных ползунков в главном меню
    bodyMedium: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: Color.fromRGBO(76, 76, 105, 1), fontFamily: 'Nunito'), // Дни месяца в маленьком календаре
    bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color.fromRGBO(188, 188, 191, 1), fontFamily: 'Nunito'), // Дни недели в календаре
    labelLarge: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Color.fromRGBO(188, 188, 191, 1), fontFamily: 'Nunito'), // Неактивный текст в tabbar
    labelMedium: TextStyle(fontSize: 11, fontWeight: FontWeight.w400, color: Color.fromRGBO(76, 76, 105, 1), fontFamily: 'Nunito'), // Текст в выпадающем меню эмоций + Текст самих эмоций
    labelSmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w400, color: Color.fromRGBO(188, 188, 191, 1), fontFamily: 'Nunito'), // Текст неактивных ползунков в главном меню
  );
} 
