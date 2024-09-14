import 'package:flutter/material.dart';
import 'package:tz/presentation/ui/statistic/graph_card.dart';
import 'package:tz/presentation/ui/statistic/top_emotion_card.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 22, right: 22),
      child: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            child: Text(
              'Сводка за неделю',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const SizedBox(
            height: 320,
            child: GraphCard(),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Самые частые эмоции',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const TopEmotionCard(place: 1, usage: 80, emotion: 'Восторг',),
          const TopEmotionCard(place: 2, usage: 32, emotion: 'Очарование',),
          const TopEmotionCard(place: 3, usage: 11, emotion: 'Грусть',),
        ],
      ),
    );
  }
}
