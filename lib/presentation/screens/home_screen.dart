import 'package:flutter/material.dart';
import 'package:tz/presentation/ui/emotion_card.dart';
import 'package:tz/presentation/ui/note_field_card.dart';
import 'package:tz/presentation/ui/slider_card.dart';

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

  final Map<int, List<String>> selectedDropdownItems =
      {};

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
        selectedEmotionIndex = -1; // Скрыть меню, если та же эмоция выбрана
      } else {
        selectedEmotionIndex = index;
      }
    });
  }

  void _onChipSelected(bool selected, String item, int emotionIndex) {
    setState(() {
      if (selected) {
        if (!selectedDropdownItems.containsKey(emotionIndex)) {
          selectedDropdownItems[emotionIndex] = [];
        }
        selectedDropdownItems[emotionIndex]!.add(item);
      } else {
        selectedDropdownItems[emotionIndex]?.remove(item);
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
            style: Theme.of(context).textTheme.labelLarge,
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
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: dropdownEmotionList[selectedEmotionIndex]!
                    .map((item) => FilterChip(
                          label: Text(item),
                          selected: selectedDropdownItems[selectedEmotionIndex]
                                  ?.contains(item) ??
                              false,
                          onSelected: (selected) {
                            _onChipSelected(
                                selected, item, selectedEmotionIndex);
                          },
                          selectedColor: Color.fromRGBO(255, 135, 2, 1),
                          showCheckmark: false,
                        ))
                    .toList(),
              ),
            ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Уровень стресса',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(
            height: 20,
          ),
          SliderCard(
            startName: 'Низкий',
            lastName: 'Высокий',
            onSliderChanged: (isActive){
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
            style: Theme.of(context).textTheme.labelLarge,
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
            }
          ),
          const SizedBox(
            height: 36,
          ),
          Text(
            'Заметки',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(
            height: 20,
          ),
          NoteFieldCard(onChanged: _updateNoteText,),
          const SizedBox(
            height: 36,
          ),
          TextButton(
              onPressed: (){
                // SendData(choosedEmotions: [], stressLevel: null, selfEsteemLevel: null).sendToDataBaseData();
                showDialog(context: context, builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Отлично!', style: Theme.of(context).textTheme.titleLarge,),
                    content: Text('Заметка успешно сохранена', style: Theme.of(context).textTheme.titleMedium,),
                  );
                });
              },
              style: TextButton.styleFrom(
                  backgroundColor:  isFormValid ? const Color.fromRGBO(255, 135, 2, 1) : const Color.fromRGBO(242, 242, 242, 1)),
              child: Text('Сохранить', style: TextStyle(color: isFormValid ? Colors.white : const Color.fromRGBO(188, 188, 191, 1)),)),
        ],
      ),
    );
  }
}
