import 'package:flutter/material.dart';
import 'package:tz/presentation/screens/home_screen.dart';
import 'package:tz/presentation/screens/statistics_screen.dart';
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
      home: CustomTabBar(),
    );
  }
}


class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('1 января 09:00', style: Theme.of(context).textTheme.headlineLarge,),
          centerTitle: true,
          actions: [Icon(Icons.calendar_month)],
          bottom: const TabBar(
          tabs: [
            Tab(
              text: 'Дневник настроения',
            ),
            Tab(
              text: 'Статистика',
            )
          ],
        ),
        ),
        body: const TabBarView(children: [HomeScreen(), StatisticsScreen()]),
      ),
    );
  }
}