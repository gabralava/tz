import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tz/service/capitalize.dart';

class MonthWidget extends StatelessWidget {
  final int currentMonth;
  final DateTime selectedDate;
  final bool isZoomedOut;
  final Function(DateTime) onDateSelected;

  const MonthWidget({
    super.key,
    required this.currentMonth,
    required this.selectedDate,
    required this.onDateSelected,
    required this.isZoomedOut,
  });

  @override
  Widget build(BuildContext context) {
    final year = selectedDate.year;

    // Количество дней в текущем месяце
    final daysInMonth = DateTime(year, currentMonth + 1, 0).day;

    // Определяем день недели для первого числа месяца
    final firstDayOfWeek = getFirstDayOfWeek(year, currentMonth);

    List<Widget> days = [];

    // Добавляем пустые контейнеры для смещения первой недели
    for (int i = 0; i < firstDayOfWeek; i++) {
      days.add(Container());
    }

    // Генерация чисел текущего месяца
    for (int i = 1; i <= daysInMonth; i++) {
      final date = DateTime(year, currentMonth, i);
      final isToday = isSameDate(date, DateTime.now());
      final isSelected = isSameDate(date, selectedDate);

      days.add(
        GestureDetector(
          onTap: () {
            onDateSelected(date);
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: !isZoomedOut ? 32 : 24,
                width: !isZoomedOut ? 32 : 24,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Colors.transparent,
                ),
                child: Text('$i',
                    style: isZoomedOut
                        ? Theme.of(context).textTheme.bodyMedium
                        : Theme.of(context).textTheme.headlineSmall),
              ),
              if (isToday && !isZoomedOut)
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.orange,
                  ),
                ),
            ],
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 22, right: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              !isZoomedOut ?
              Text(
                DateFormat('y', 'ru').format(DateTime(year, currentMonth)),
                style: Theme.of(context).textTheme.titleMedium,
              ) : Container(),
              Text(
                capitalize(DateFormat('MMMM', 'ru').format(DateTime(year, currentMonth))),
                style: isZoomedOut
                    ? Theme.of(context).textTheme.titleSmall
                    : Theme.of(context).textTheme.displayMedium,
              ),
            ],
          ),
        ),
        SizedBox(height: 8,),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Container(
            height: isZoomedOut ? 150 : 280,
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
              ),
              itemCount: days.length,
              itemBuilder: (context, index) {
                return days[index];
              },
            ),
          ),
        ),
      ],
    );
  }

  bool isSameDate(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  int getFirstDayOfWeek(int year, int month) {
    return DateTime(year, month, 1).weekday - 1;
  }
}