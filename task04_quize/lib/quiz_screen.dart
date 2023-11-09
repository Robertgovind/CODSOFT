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
  bool decideScreen = false;
  var res;
  String question = '';
  String optionA = '';
  String optionB = '';
  String optionC = '';
  String optionD = '';
  int questionNumber = 1;

  int q = 0, a = 0, b = 0, c = 0;

  @override
  void initState() {
    super.initState();
    getQuestions();
    assignQuestion();
  }

  void getQuestions() async {
    var response = await http.get(
      Uri.parse('https://opentdb.com/api.php?amount=10'),
    );
    res = jsonDecode(response.body);
    print(response.body);

    decideScreen = true;

    setState(() {});
  }

  void assignQuestion() {
    setState(() {
      if (res != null) {
        question = res['results'][q]['question'];
        optionA = res['results'][q]['correct_answer'];
        optionB = res['results'][a]['incorrect_answers'][0];
        optionC = res['results'][b]['incorrect_answers'][1];
        optionD = res['results'][c]['incorrect_answers'][2];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return decideScreen
        ? Scaffold(
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/back.webp'), fit: BoxFit.cover),
              ),
              child: Column(
                children: [
                  QuestionsContainer(
                    question: question,
                    number: questionNumber,
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
                      child: Column(
                        children: [
                          OptionsContainer(
                            lead: 'A',
                            optionText: optionA,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          OptionsContainer(
                            lead: 'B',
                            optionText: optionB,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          OptionsContainer(
                            lead: 'C',
                            optionText: optionC,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          OptionsContainer(
                            lead: 'D',
                            optionText: optionD,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => kButtonColor),
                      ),
                      onPressed: () {
                        setState(() {
                          q++;
                          a++;
                          b++;
                          c++;
                          questionNumber++;
                          assignQuestion();
                        });
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
          )
        : Scaffold(
            backgroundColor: kBackgroundColor,
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/back.webp'), fit: BoxFit.cover),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Expanded(
                    flex: 9,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 35),
                      child: Image(
                        image: AssetImage('assets/science.png'),
                        width: 300,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 120, vertical: 15),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                            (states) => kButtonColor,
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'START',
                          style: TextStyle(
                              fontSize: 25,
                              letterSpacing: 2,
                              color: Colors.white),
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
