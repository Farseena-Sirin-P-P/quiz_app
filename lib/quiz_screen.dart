import 'package:flutter/material.dart';
import 'package:quiz_app/score_screen.dart';
import 'quiz_class.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int questionNo = 0;
  int score = 0;
  int correctAnswers = 0;
  int wrongAnswers = 0;

  List<Question> questionList = [
    Question(q: 'Elephant is a mammal', a: true),
    Question(q: 'Bats are blind', a: false),
    Question(q: 'The human body has four lungs', a: false),
    Question(q: 'Spiders have eight leg', a: true),
    Question(q: 'Penguins can fly', a: false),
  ];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = questionList[questionNo].answerText;

    if (userPickedAnswer == correctAnswer) {
      score++;
      correctAnswers++;
      print('Correct');
    } else {
      wrongAnswers++;
      print('Wrong');
    }

    setState(() {
      if (questionNo < questionList.length - 1) {
        questionNo++;
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => ScoreScreen(
                  totalScore: score,
                  rightAnswers: correctAnswers,
                  wrongAnswers: wrongAnswers,
                ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 100, 10, 100),
                child: Text(
                  questionList[questionNo].questionText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () => checkAnswer(true),
                  child: const Text(
                    'True',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () => checkAnswer(false),
                  child: const Text(
                    'False',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
