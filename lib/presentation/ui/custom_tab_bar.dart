import 'package:flutter/material.dart';
import 'package:tz/presentation/screens/calendar_screen.dart';
import 'package:tz/presentation/screens/home_screen.dart';
import 'package:tz/presentation/screens/statistics_screen.dart';
import 'package:tz/service/check_time.dart';
import 'package:tz/service/date_convert.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          // Создаем поток, в котором проверяем изменилось ли время
          title: StreamBuilder(
            stream: timeStream(),
            initialData: convertDate(),
            builder: (context, snapshot){
              return Text(snapshot.data ?? '', style: Theme.of(context).textTheme.headlineLarge,);
            }
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 22),
              child: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const CalendarScreen()));
                },
                icon: Icon(Icons.calendar_month, size: 24, color: Theme.of(context).colorScheme.secondary,),
              ),
            )
          ],
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
                        SizedBox(
                          width: 8,
                        ),
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
                        Image.asset(
                          'assets/icons/2.png',
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Статистика',
                        )
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
