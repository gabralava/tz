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
            color: Colors.grey.withOpacity(0.2), // Не забыть переделать
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: _controller,
        maxLines: null,
        style: TextStyle(fontFamily: 'Nunito', fontWeight: FontWeight.w400, fontSize: 14, color: Color.fromRGBO(76, 76, 105, 1)),
        decoration: InputDecoration(
          hintText: 'Введите заметку',
          hintStyle: TextStyle(fontFamily: 'Nunito', fontWeight: FontWeight.w400, fontSize: 14, color: Color.fromRGBO(188, 188, 191, 1)),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(16),
        ),
      ),
    );
  }
}
