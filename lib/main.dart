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
      home: const CustomTabBar(),
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
          title: Text(
            '1 января 09:00',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          centerTitle: true,
          actions: const [Icon(Icons.calendar_month)],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(30),
            child: Container(
              height: 30,
              margin: EdgeInsets.only(left: 22, right: 22),
              decoration: BoxDecoration(
                color: Color.fromRGBO(242, 242, 242, 1),
                borderRadius: BorderRadius.circular(48)
              ),
              child: TabBar(
                dividerColor: Colors.transparent,
                splashBorderRadius: BorderRadius.circular(48),
                indicator: BoxDecoration(
                  color: Color.fromRGBO(255, 135, 2, 1),
                  borderRadius: BorderRadius.circular(48),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: Theme.of(context).textTheme.labelMedium,
                unselectedLabelStyle: Theme.of(context).textTheme.labelSmall,
                tabs: [
                  Tab(
                    icon: Icon(
                      Icons.book,
                      size: 12,
                    ),
                    text: 'Дневник настроения',
                  ),
                  Tab(
                    icon: Icon(
                      Icons.bar_chart,
                      size: 12,
                    ),
                    text: 'Статистика',
                  )
                ],
              ),
            ),
          ),
        ),
        body: const TabBarView(children: [HomeScreen(), StatisticsScreen()]),
      ),
    );
  }
}
