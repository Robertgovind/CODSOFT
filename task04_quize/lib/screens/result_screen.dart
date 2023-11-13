import 'package:flutter/material.dart';
import 'package:task04_quize/constants.dart';
import 'package:task04_quize/screens/quiz_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, this.score = 0});
  final score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/back.webp'), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Result",
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
            Container(
              margin: const EdgeInsets.only(left: 25, right: 25, top: 40),
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(color: Colors.black, blurRadius: 1),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Congratulation!!',
                    style: TextStyle(fontSize: 40, color: Colors.green),
                  ),
                  Text(
                    '$score/50',
                    style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const Image(
                    image: AssetImage('assets/trophy-star.png'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => kButtonColor),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return const QuizScreen();
                  }));
                },
                child: const Text(
                  'Next Round',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
