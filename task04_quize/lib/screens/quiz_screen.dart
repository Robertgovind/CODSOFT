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
  int questionNumber = 1;

  String cAnswer = 'correct_answer';
  String iAnswer = 'incorrect_answers';

  List<Map> data = [];

  int q = 0, a = 0, b = 0, c = 0;

  int score = 0;

  @override
  void initState() {
    super.initState();
    getQuestions();

    setState(() {});
  }

  void getQuestions() async {
    var response = await http.get(
      Uri.parse('https://opentdb.com/api.php?amount=10&type=multiple'),
    );
    res = jsonDecode(response.body);
    question = res['results'][q]['question'];

    data.add({'${iAnswer}1': res['results'][q][iAnswer][0]});
    data.add({'${iAnswer}2': res['results'][q][iAnswer][1]});
    data.add({'${iAnswer}3': res['results'][q][iAnswer][2]});
    data.add({cAnswer: res['results'][q][cAnswer]});
    data.shuffle();
    decideScreen = true;

    setState(() {});
  }

  void assignQuestion() {
    question = res['results'][q]['question'];
    data.add({'${iAnswer}1': res['results'][q][iAnswer][0]});
    data.add({'${iAnswer}2': res['results'][q][iAnswer][1]});
    data.add({'${iAnswer}3': res['results'][q][iAnswer][2]});
    data.add({cAnswer: res['results'][q][cAnswer]});
    data.shuffle();
    setState(() {});
  }

  bool optA = false;
  bool optB = false;
  bool optC = false;
  bool optD = false;
  var ansColorA = const Color.fromARGB(255, 168, 54, 244);
  var ansColorB = const Color.fromARGB(255, 168, 54, 244);
  var ansColorC = const Color.fromARGB(255, 168, 54, 244);
  var ansColorD = const Color.fromARGB(255, 168, 54, 244);

  Color checkAnswer(Map submittedAns) {
    if (submittedAns.containsKey(cAnswer)) {
      score += 10;
      return Colors.green;
    } else {
      return Colors.red;
    }
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
                              print(data[0].keys);
                              ansColorA = checkAnswer(data[0]);
                              setState(() {});
                            },
                            child: OptionsContainer(
                              lead: 'A',
                              optionText: data[0].values.toString(),
                              ansColor: ansColorA,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              ansColorB = checkAnswer(data[1]);
                              setState(() {});
                            },
                            child: OptionsContainer(
                              lead: 'B',
                              optionText: data[1].values.toString(),
                              ansColor: ansColorB,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              ansColorC = checkAnswer(data[2]);
                              setState(() {});
                            },
                            child: OptionsContainer(
                              lead: 'C',
                              optionText: data[2].values.toString(),
                              ansColor: ansColorC,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              ansColorD = checkAnswer(data[3]);
                              setState(() {});
                            },
                            child: OptionsContainer(
                              lead: 'D',
                              optionText: data[3].values.toString(),
                              ansColor: ansColorD,
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
                      onPressed: questionNumber <= 4
                          ? () {
                              setState(() {
                                q++;
                                questionNumber++;
                                data.removeRange(0, data.length - 1);
                                optA = false;
                                optB = false;
                                optC = false;
                                optD = false;
                                ansColorA =
                                    const Color.fromARGB(255, 168, 54, 244);
                                ansColorB =
                                    const Color.fromARGB(255, 168, 54, 244);
                                ansColorC =
                                    const Color.fromARGB(255, 168, 54, 244);
                                ansColorD =
                                    const Color.fromARGB(255, 168, 54, 244);
                                assignQuestion();
                              });
                            }
                          : () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ResultScreen(
                                  score: score,
                                );
                              }));
                            },
                      child: questionNumber <= 4
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
