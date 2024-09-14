import 'package:flutter/material.dart';

class SliderCard extends StatefulWidget {
  final String startName;
  final String lastName;
  final ValueChanged<bool> onSliderChanged;

  const SliderCard({
    super.key, 
    required this.startName, 
    required this.lastName,
    required this.onSliderChanged,
  });

  @override
  State<SliderCard> createState() => _SliderCardState();
}

class _SliderCardState extends State<SliderCard> {
  double _currentSliderValue = 50;
  bool _isSliderActive = false;

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
          Column(
            children: [
              Slider.adaptive(
                activeColor: _isSliderActive
                    ? Theme.of(context).colorScheme.primaryContainer
                    : Theme.of(context).colorScheme.surface,
                inactiveColor: Theme.of(context).colorScheme.surface,
                value: _currentSliderValue,
                max: 100,
                divisions: 5,
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                    _isSliderActive = true;
                    widget.onSliderChanged(true);
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text(widget.startName, style: _isSliderActive ? Theme.of(context).textTheme.bodyLarge : Theme.of(context).textTheme.labelSmall,),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: Text(
                  widget.lastName, style: _isSliderActive ? Theme.of(context).textTheme.bodyLarge : Theme.of(context).textTheme.labelSmall,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
