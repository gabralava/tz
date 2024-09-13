import 'package:flutter/material.dart';
import 'package:tz/presentation/ui/custom_tab_bar.dart';
import 'package:tz/theme/color_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeDataStyle.light,
      home: const CustomTabBar(),
    );
  }
}
