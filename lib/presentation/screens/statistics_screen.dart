import 'package:flutter/material.dart';
import 'package:tz/presentation/ui/statistic/graph_card.dart';
import 'package:tz/presentation/ui/statistic/top_emotion_card.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 22, right: 22),
      child: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            child: Text(
              'Сводка за неделю',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 320,
            child: GraphCard(),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Самые частые эмоции',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          TopEmotionCard(place: 1, usage: 80, emotion: 'Восторг',),
          TopEmotionCard(place: 2, usage: 32, emotion: 'Очарование',),
          TopEmotionCard(place: 3, usage: 11, emotion: 'Грусть',),
        ],
      ),
    );
  }
}
