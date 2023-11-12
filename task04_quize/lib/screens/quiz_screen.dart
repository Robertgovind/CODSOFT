import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task04_quize/constants.dart';
import 'package:task04_quize/screens/result_screen.dart';
import 'package:task04_quize/screens/splash_screen.dart';
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
  int questionNumber = 0;

  String cAnswer = 'correct_answer';
  String iAnswer = 'incorrect_answers';

  Map<String, dynamic>? ques;

  int q = 0, a = 0, b = 0, c = 0;

  bool isColoured = false;
  int score = 0;

  @override
  void initState() {
    super.initState();
    getQuestions();
    assignQuestion();
    setState(() {});
  }

  void getQuestions() async {
    var response = await http.get(
      Uri.parse('https://opentdb.com/api.php?amount=10&type=multiple'),
    );
    res = jsonDecode(response.body);
    print(response.body);

    decideScreen = true;

    setState(() {});
  }

  void assignQuestion() {
    if (res != null) {
      question = res['results'][q]['question'];
      ques = {iAnswer: res['results'][a][iAnswer]};
      ques?.addAll({cAnswer: res['results'][q][cAnswer]});
    }
    setState(() {});
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
                          GestureDetector(
                            onTap: () {
                              isColoured = !isColoured;
                              score += 10;
                              setState(() {});
                            },
                            child: OptionsContainer(
                              lead: 'A',
                              optionText: ques?[cAnswer] ?? '',
                              ansColor:
                                  isColoured ? Colors.green : Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              isColoured = !isColoured;
                              setState(() {});
                            },
                            child: OptionsContainer(
                              lead: 'B',
                              optionText: ques?[iAnswer][0] ?? '',
                              ansColor: isColoured ? Colors.red : Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              isColoured = !isColoured;
                              setState(() {});
                            },
                            child: OptionsContainer(
                              lead: 'C',
                              optionText: ques?[iAnswer][1] ?? '',
                              ansColor: isColoured ? Colors.red : Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              isColoured = !isColoured;

                              setState(() {});
                            },
                            child: OptionsContainer(
                              lead: 'D',
                              optionText: ques?[iAnswer][2] ?? '',
                              ansColor: isColoured ? Colors.red : Colors.white,
                            ),
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
                      onPressed: questionNumber <= 5
                          ? () {
                              setState(() {
                                q++;
                                a++;
                                b++;
                                c++;
                                questionNumber++;
                                assignQuestion();
                              });
                            }
                          : () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const ResultScreen();
                              }));
                            },
                      child: questionNumber <= 5
                          ? const Text(
                              'Next Question',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            )
                          : const Text(
                              'View Result',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : const SplashScreen();
  }
}
