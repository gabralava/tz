import 'package:flutter/material.dart';

class CustomDropdownMenu extends StatefulWidget {
  final Map<int, List<String>> dropdownEmotionList;
  final int selectedEmotionIndex;

  const CustomDropdownMenu({super.key, required this.selectedEmotionIndex, required this.dropdownEmotionList});

  @override
  State<CustomDropdownMenu> createState() => _CustomDropdownMenuState();
}

class _CustomDropdownMenuState extends State<CustomDropdownMenu> {

  final Map<int, List<String>> selectedDropdownItems = {};

  @override
  Widget build(BuildContext context) {
    if (!widget.dropdownEmotionList.containsKey(widget.selectedEmotionIndex)) {
      return const SizedBox();
    }

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 4.0,
        children: widget.dropdownEmotionList[widget.selectedEmotionIndex]!
            .map((item) => Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(182, 161, 192, 0.11),
                        offset: Offset(2, 4),
                        blurRadius: 10,
                        spreadRadius: 0
                      ),
                    ],
                  ),
                  child: FilterChip(
                    side: BorderSide.none,
                    label: Text(item,
                        style:
                            selectedDropdownItems[widget.selectedEmotionIndex]
                                        ?.contains(item) ??
                                    false
                                ? const TextStyle(fontFamily: 'Nunito', fontSize: 11, fontWeight: FontWeight.w400, color: Colors.white)
                                : Theme.of(context).textTheme.labelMedium),
                    selected: selectedDropdownItems[widget.selectedEmotionIndex]
                            ?.contains(item) ??
                        false,
                    onSelected: (selected) {
                      _onChipSelected(
                          selected, item, widget.selectedEmotionIndex);
                    },
                    selectedColor:
                        Theme.of(context).colorScheme.primaryContainer,
                    showCheckmark: false,
                  ),
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
