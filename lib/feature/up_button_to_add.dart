import 'package:flutter/material.dart';

class StarButton extends StatefulWidget {
  bool isStarred;
  final VoidCallback onPressed;

  StarButton({
    this.isStarred = false,
    required this.onPressed,
  });

  @override
  State<StarButton> createState() => _StarButtonState();
}

class _StarButtonState extends State<StarButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        widget.isStarred ? Icons.star : Icons.star_border,
        color: widget.isStarred ? Colors.yellow : Colors.grey,
      ),
      onPressed: () {
        setState(() {
          widget.onPressed();
          // ОЧЕНЬ ВАЖНО ПЕРЕДАТЬ onPressed(); А НЕ onPressed БЕЗ СКОБОК
          //  скобки говорят  дай мне эту функцию и запусти ее
          widget.isStarred = !widget.isStarred;
        });
      },
    );
  }
}
