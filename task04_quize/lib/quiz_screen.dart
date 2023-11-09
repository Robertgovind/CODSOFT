import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  String Questions = '';
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
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 80,
                ),
                decoration: BoxDecoration(
                  border: Border.all(width: 3, color: Colors.purple),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    getQuestions();
                  },
                  child: Text('get'),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 3, color: Colors.purple),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 3, color: Colors.purple),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 3, color: Colors.purple),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 3, color: Colors.purple),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 3, color: Colors.purple),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
