import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_screen.dart';

void main() {
  runApp(const MyApp());
}

class Question {
  final String questionText;
  final bool answerText;

  Question({required this.questionText, required this.answerText});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const QuizScreen());
  }
}
