import 'package:flutter/material.dart';
import 'package:tz/presentation/ui/home/dropdown_menu.dart';
import 'package:tz/presentation/ui/home/emotion_card.dart';
import 'package:tz/presentation/ui/home/note_field_card.dart';
import 'package:tz/presentation/ui/home/slider_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> emotionList = const [
    'assets/images/Радость.png',
    'assets/images/Страх.png',
    'assets/images/Бешенство.png',
    'assets/images/Грусть.png',
    'assets/images/Сила.png',
  ];

  // Список для динамического отображения dropdown элементов
  final Map<int, List<String>> dropdownEmotionList = {
    0: [
      "Возбуждение",
      "Восторг",
      "Игривость",
      "Наслаждение",
      "Очарование",
      "Осознанность",
      "Смелость",
      "Чувственность",
      "Энергичность",
      "Экстравагантность",
    ],
    1: [
      "Тревога",
      "Паника",
      "Невроз",
    ],
    2: [
      "Гнев",
      "Раздражение",
      "Ярость",
    ],
    3: [
      "Грусть",
      "Скорбь",
      "Одиночество",
    ],
    4: [
      "Сила",
      "Твердость",
      "Мужественность",
    ]
  };

  final Map<int, List<String>> selectedDropdownItems = {};

  int selectedEmotionIndex = -1;
  bool isStressSliderActive = false;
  bool isConfidenceSliderActive = false;
  String noteText = '';

  bool get isFormValid {
    return selectedEmotionIndex != -1 &&
        isStressSliderActive &&
        isConfidenceSliderActive &&
        noteText.isNotEmpty;
  }

  void _onTapEmotion(int index) {
    setState(() {
      if (selectedEmotionIndex == index) {
        selectedEmotionIndex = -1;
      } else {
        selectedEmotionIndex = index;
      }
    });
  }

  void _updateNoteText(String text) {
    setState(() {
      noteText = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [
          Text(
            'Что чувствуешь?',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
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
                  imagePath: emotionList[index],
                  isExpanded: selectedEmotionIndex == index,
                  onTap: _onTapEmotion,
                  index: index,
                );
              },
            ),
          ),
          if (selectedEmotionIndex != -1 &&
              dropdownEmotionList.containsKey(selectedEmotionIndex))
            CustomDropdownMenu(selectedEmotionIndex: selectedEmotionIndex),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Уровень стресса',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 20,
          ),
          SliderCard(
            startName: 'Низкий',
            lastName: 'Высокий',
            onSliderChanged: (isActive) {
              setState(() {
                isStressSliderActive = isActive;
              });
            },
          ),
          const SizedBox(
            height: 36,
          ),
          Text(
            'Самооценка',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 20,
          ),
          SliderCard(
              startName: 'Неуверенность',
              lastName: 'Уверенность',
              onSliderChanged: (isActive) {
                setState(() {
                  isConfidenceSliderActive = isActive;
                });
              }),
          const SizedBox(
            height: 36,
          ),
          Text(
            'Заметки',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 20,
          ),
          NoteFieldCard(
            onChanged: _updateNoteText,
          ),
          const SizedBox(
            height: 36,
          ),
          TextButton(
            onPressed: () {
              // SendData(choosedEmotions: [], stressLevel: null, selfEsteemLevel: null).sendToDataBaseData();
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        'Отлично!',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      content: Text(
                        'Заметка успешно сохранена',
                        style: TextStyle(
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color.fromRGBO(76, 76, 105, 1)),
                      ),
                    );
                  });
            },
            style: TextButton.styleFrom(
                backgroundColor: isFormValid
                    ? Theme.of(context).colorScheme.primaryContainer
                    : Theme.of(context).colorScheme.secondaryContainer),
            child: Text(
              'Сохранить',
              style: isFormValid
                  ? TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.white)
                  : Theme.of(context).textTheme.displaySmall,
            ),
          ),
        ],
      ),
    );
  }
}
