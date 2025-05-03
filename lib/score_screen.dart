import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_screen.dart';

class ScoreScreen extends StatelessWidget {
  final int totalScore;
  final int rightAnswers;
  final int wrongAnswers;

  const ScoreScreen({
    super.key,
    required this.totalScore,
    required this.rightAnswers,
    required this.wrongAnswers,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Quiz Completed!',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              const SizedBox(height: 30),
              Text(
                'Total Score: $totalScore',
                style: const TextStyle(color: Colors.green, fontSize: 24),
              ),
              const SizedBox(height: 10),
              Text(
                'Right Answers: $rightAnswers',
                style: const TextStyle(color: Colors.blue, fontSize: 24),
              ),
              const SizedBox(height: 10),
              Text(
                'Wrong Answers: $wrongAnswers',
                style: const TextStyle(color: Colors.red, fontSize: 24),
              ),
              const SizedBox(height: 40),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const QuizScreen()),
                  );
                },
                child: const Text(
                  'Restart Quiz',
                  style: TextStyle(fontSize: 20, color: Colors.yellow),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
