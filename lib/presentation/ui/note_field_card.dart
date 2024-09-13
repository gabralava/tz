import 'package:flutter/material.dart';

class NoteFieldCard extends StatefulWidget {
  final ValueChanged<String> onChanged;

  const NoteFieldCard({super.key, required this.onChanged});

  @override
  State<NoteFieldCard> createState() => _NoteFieldCardState();
}

class _NoteFieldCardState extends State<NoteFieldCard> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      widget.onChanged(_controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: _controller,
        maxLines: null,
        style: Theme.of(context).textTheme.titleMedium,
        decoration: InputDecoration(
          hintText: 'Введите заметку',
          hintStyle: Theme.of(context).textTheme.bodyLarge,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(16),
        ),
      ),
    );
  }
}
