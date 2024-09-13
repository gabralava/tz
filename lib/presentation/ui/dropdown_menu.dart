import 'package:flutter/material.dart';

class CustomDropdownMenu extends StatefulWidget {
  final int selectedEmotionIndex;
  
  const CustomDropdownMenu({super.key, required this.selectedEmotionIndex});

  @override
  State<CustomDropdownMenu> createState() => _CustomDropdownMenuState();
}

class _CustomDropdownMenuState extends State<CustomDropdownMenu> {
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

  @override
  Widget build(BuildContext context) {
    if (!dropdownEmotionList.containsKey(widget.selectedEmotionIndex)) {
      return const SizedBox();
    }

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 4.0,
        children: dropdownEmotionList[widget.selectedEmotionIndex]!
            .map((item) => FilterChip(
                  label: Text(
                    item,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  selected: selectedDropdownItems[widget.selectedEmotionIndex]
                          ?.contains(item) ??
                      false,
                  onSelected: (selected) {
                    _onChipSelected(selected, item, widget.selectedEmotionIndex);
                  },
                  selectedColor: Theme.of(context).colorScheme.primaryContainer,
                  showCheckmark: false,
                ))
            .toList(),
      ),
    );
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
}
