import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GraphCard extends StatelessWidget {
  const GraphCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minY: 0, // Минимальное значение оси Y
        maxY: 100, // Максимальное значение оси Y
        gridData: const FlGridData(show: false),
        titlesData: FlTitlesData(
          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                TextStyle? style = Theme.of(context).textTheme.labelMedium;
                switch (value.toInt()) {
                  case 0:
                    return Padding(
                      padding: const EdgeInsets.only(top: 8, left: 8),
                      child: Text('Пн', style: style),
                    );
                  case 1:
                    return Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text('Вт', style: style),
                    );
                  case 2:
                    return Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text('Ср', style: style),
                    );
                  case 3:
                    return Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text('Чт', style: style),
                    );
                  case 4:
                    return Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text('Пт', style: style),
                    );
                  case 5:
                    return Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text('Сб', style: style),
                    );
                  case 6:
                    return Padding(
                      padding: const EdgeInsets.only(top: 8, right: 12),
                      child: Text('Вс', style: style),
                    );
                }
                return const Text('');
              },
              interval: 1,
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 20,
              reservedSize: 40,
              getTitlesWidget: (value, meta) {
                return Text(value.toInt().toString(),
                    style: Theme.of(context).textTheme.labelMedium);
              },
            ),
          ),
        ),
        borderData: FlBorderData(
            show: true,
            border: const Border(
              left: BorderSide(color: Color.fromRGBO(76, 76, 105, 1), width: 1),
              bottom: BorderSide(color: Color.fromRGBO(76, 76, 105, 1), width: 1),
            )),
        lineBarsData: [
          LineChartBarData(
              spots: [
                const FlSpot(0, 50), // Понедельник
                const FlSpot(1, 80), // Вторник
                const FlSpot(2, 40), // Среда
                const FlSpot(3, 70), // Четверг
                const FlSpot(4, 90), // Пятница
                const FlSpot(5, 30), // Суббота
                const FlSpot(6, 60), // Воскресенье
              ],
              isCurved: true, // Сглаженные линии
              barWidth: 4,
              color: Theme.of(context).colorScheme.primaryContainer,
              belowBarData: BarAreaData(
                show: true,
                color: Theme.of(context).colorScheme.primary.withOpacity(0.11),
              ),
              dotData: const FlDotData(show: false)),
        ],
      ),
    );
  }
}
