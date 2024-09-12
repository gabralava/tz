import 'package:flutter/material.dart';

class SliderCard extends StatefulWidget {
  final String startName;
  final String lastName;
  const SliderCard(
      {super.key, required this.startName, required this.lastName});

  @override
  State<SliderCard> createState() => _SliderCardState();
}

class _SliderCardState extends State<SliderCard> {
  double _currentSliderValue = 50;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 77,
      width: 335,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
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
        children: [
          Slider(
            activeColor: Color.fromRGBO(255, 135, 2, 1),
            inactiveColor: Color.fromRGBO(225, 221, 216, 1),
            value: _currentSliderValue,
            max: 100,
            divisions: 5,
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(widget.startName),
            ), Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Text(widget.lastName),
            )],
          ),
        ],
      ),
    );
  }
}
