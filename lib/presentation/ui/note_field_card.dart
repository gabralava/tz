import 'package:flutter/material.dart';

class NoteFieldCard extends StatefulWidget {
  const NoteFieldCard({super.key});

  @override
  State<NoteFieldCard> createState() => _NoteFieldCardState();
}

class _NoteFieldCardState extends State<NoteFieldCard> {
  final TextEditingController _controller = TextEditingController();
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
        decoration: const InputDecoration(
          hintText: 'Введите заметку',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(16),
        ),
      ),
    );
  }
}
