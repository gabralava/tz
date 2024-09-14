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
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                const style = TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                );
                switch (value.toInt()) {
                  case 0:
                    return Text('Пн', style: style);
                  case 1:
                    return Text('Вт', style: style);
                  case 2:
                    return Text('Ср', style: style);
                  case 3:
                    return Text('Чт', style: style);
                  case 4:
                    return Text('Пт', style: style);
                  case 5:
                    return Text('Сб', style: style);
                  case 6:
                    return Text('Вс', style: style);
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
                    style: TextStyle(color: Colors.black, fontSize: 12));
              },
            ),
          ),
        ),
        borderData: FlBorderData(
            show: true,
            border: Border(
              left: BorderSide(color: Colors.black, width: 1),
              bottom: BorderSide(color: Colors.black, width: 1),
            )),
        lineBarsData: [
          LineChartBarData(
              spots: [
                FlSpot(0, 50), // Понедельник
                FlSpot(1, 80), // Вторник
                FlSpot(2, 40), // Среда
                FlSpot(3, 70), // Четверг
                FlSpot(4, 90), // Пятница
                FlSpot(5, 30), // Суббота
                FlSpot(6, 60), // Воскресенье
              ],
              isCurved: true, // Сглаженные линии
              barWidth: 4,
              color: Colors.blue,
              belowBarData: BarAreaData(
                show: true,
                color: Colors.blue.withOpacity(0.3),
              ),
              dotData: FlDotData(show: false)),
        ],
      ),
    );
  }
}
