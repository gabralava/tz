import 'package:flutter/material.dart';
import 'package:tz/presentation/ui/emotion_card.dart';
import 'package:tz/presentation/ui/note_field_card.dart';
import 'package:tz/presentation/ui/slider_card.dart';

class HomeScreen extends StatelessWidget {
  final List<String> emotionList = const [
    'assets/images/Радость.png',
    'assets/images/Страх.png',
    'assets/images/Бешенство.png',
    'assets/images/Грусть.png',
    'assets/images/Сила.png',
  ];
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: ListView(
        children: [
          Text(
            'Что чувствуешь?',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: emotionList.length,
              itemBuilder: (context, index) {
                return EmotionCard(
                    emotionStatus: emotionList[index],
                    imagePath: emotionList[index]);
              },
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Уровень стресса',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          SizedBox(
            height: 20,
          ),
          SliderCard(
            startName: 'Низкий',
            lastName: 'Высокий',
          ),
          SizedBox(
            height: 36,
          ),
          Text(
            'Самооценка',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          SizedBox(
            height: 20,
          ),
          SliderCard(startName: 'Неуверенность', lastName: 'Уверенность'),
          SizedBox(
            height: 36,
          ),
          Text(
            'Заметки',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          SizedBox(
            height: 20,
          ),
          NoteFieldCard(),
          SizedBox(
            height: 36,
          ),
          TextButton(
              onPressed: null,
              child: Text('Сохранить'),
              style: TextButton.styleFrom(
                  backgroundColor: Color.fromARGB(1, 242, 242, 242)))
        ],
      ),
    );
  }
}
