import 'package:flutter/material.dart';

class EmotionCard extends StatelessWidget {
  final String emotionStatus;
  final String imagePath;
  const EmotionCard(
      {super.key, required this.emotionStatus, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 12),
      child: Container(
        height: 118,
        width: 83,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(64),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(182, 161, 192, 0.11),
              offset: Offset(2, 4),
              blurRadius: 10.8,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath),
            Text(emotionStatus.substring(14).replaceAll('.png', ''), style: Theme.of(context).textTheme.titleMedium,),
          ],
        ),
      ),
    );
  }
}
