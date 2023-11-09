import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task04_quize/constants.dart';
import 'package:task04_quize/widgets/options.dart';
import 'package:task04_quize/widgets/questions.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  String questions = '';
  void getQuestions() async {
    var response = await http.get(
      Uri.parse('https://opentdb.com/api.php?amount=10'),
    );

    print(response.body);
    setState(() {});
  }

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
          children: [
            const QuestionsContainer(
              question: 'Which of the following is a fruit?',
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Column(
                  children: [
                    OptionsContainer(
                      lead: 'A',
                      optionText: 'Apple',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    OptionsContainer(
                      lead: 'B',
                      optionText: 'Aeroplane',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    OptionsContainer(
                      lead: 'C',
                      optionText: 'Train',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    OptionsContainer(
                      lead: 'D',
                      optionText: 'Stomach',
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => kButtonColor),
                ),
                onPressed: () {
                  getQuestions();
                },
                child: const Text(
                  'Next Question',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
