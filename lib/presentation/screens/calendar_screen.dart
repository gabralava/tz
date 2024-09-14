import 'package:flutter/material.dart';
import 'package:tz/presentation/ui/calendar/month_widget.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  bool isZoomedOut = false;
  // Переменная для отслеживания выбранной даты (глобальная)
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.close,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isZoomedOut = !isZoomedOut;
                });
              },
              icon: isZoomedOut
                  ? Icon(
                      Icons.zoom_out,
                      color: Theme.of(context).colorScheme.secondary,
                    )
                  : Icon(
                      Icons.zoom_in,
                      color: Theme.of(context).colorScheme.secondary,
                    )),
          TextButton(
            onPressed: () {
              setState(() {
                selectedDate = DateTime.now();
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Text('Сегодня',
                  style: Theme.of(context).textTheme.headlineMedium),
            ),
          ),
        ],
        bottom: !isZoomedOut
            ? PreferredSize(
                preferredSize: const Size.fromHeight(52),
                child: Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: Row(
                    children: [
                      Expanded(
                        child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 7),
                            itemCount: 7,
                            itemBuilder: (context, index) {
                              return Container(
                                alignment: Alignment.center,
                                child: Text(
                                  convertIntToWeekday(index),
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                ),
              )
            : PreferredSize(
                preferredSize: const Size.fromHeight(52),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      DateTime.now().year.toString(),
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                ),
              ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isZoomedOut ? 2 : 1),
        itemCount: 12,
        itemBuilder: (context, index) {
          return MonthWidget(
            currentMonth: index + 1,
            selectedDate: selectedDate,
            onDateSelected: (date) {
              setState(
                () {
                  selectedDate = date;
                },
              );
            },
            isZoomedOut: isZoomedOut,
          );
        },
      ),
    );
  }
}

String convertIntToWeekday(int weekday) {
  const weekDays = ['пн', 'вт', 'ср', 'чт', 'пт', 'сб', 'вс'];
  return weekDays[weekday];
}
