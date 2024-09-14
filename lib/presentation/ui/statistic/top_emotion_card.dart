import 'package:flutter/material.dart';

class TopEmotionCard extends StatelessWidget {
  final int place;
  final String emotion;
  final int usage;
  const TopEmotionCard({super.key, required this.place, required this.emotion, required this.usage});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: EdgeInsets.only(left: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(182, 161, 192, 0.11),
            offset: Offset(2, 4),
            blurRadius: 10.8,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: [
          Text(
            '$place. $emotion $usage%',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
