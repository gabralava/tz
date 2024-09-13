import 'package:flutter/material.dart';
import 'package:tz/presentation/screens/home_screen.dart';
import 'package:tz/presentation/screens/statistics_screen.dart';
import 'package:tz/service/date_convert.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            convertDate(),
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
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(48)),
              child: TabBar(
                dividerColor: Colors.transparent,
                splashBorderRadius: BorderRadius.circular(48),
                indicator: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(48),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: Theme.of(context).textTheme.labelMedium,
                unselectedLabelStyle: Theme.of(context).textTheme.labelSmall,
                tabs: [
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/1.png'),
                        SizedBox(width: 8,),
                        Text(
                          'Дневник настроения',
                        )
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/2.png', color: Colors.white,),
                        SizedBox(width: 8,),
                        Text('Статистика',)
                      ],
                    ),
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