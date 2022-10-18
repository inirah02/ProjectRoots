import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final bool isImage;
  final String answerText;
  Color? answerColor;
  final VoidCallback answerTap;

  Answer({
    this.isImage = false,
    required this.answerText,
    this.answerColor,
    required this.answerTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: answerTap,
      child: Container(
        padding: EdgeInsets.all(15.0),
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
        width: !isImage ? double.infinity : null,
        decoration: BoxDecoration(
          color: answerColor,
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: !isImage
            ? Text(
                answerText,
                style: TextStyle(
                  fontSize: 15.0,
                ),
              )
            : Image.asset(
                'assets/images/${answerText}',
              ),
      ),
    );
  }
}
