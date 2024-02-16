import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier(
      {super.key, required this.isCorrect, required this.questionIndex});
  final bool isCorrect;
  final int questionIndex;
  @override
  Widget build(context) {
    final questionNumber = questionIndex + 1;
    return Container(
      width: 25,
      height: 25,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrect ? Colors.green : Colors.red,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        questionNumber.toString(),
        style: const TextStyle(
            fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 0, 0)),
      ),
    );
  }
}
