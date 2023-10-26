import 'package:flutter/material.dart';
import 'package:task01_todo_app/pages/landing_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "ToDo App",
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 164, 75, 180),
      ),
      body: Container(
        color: const Color.fromARGB(255, 164, 75, 180),
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black)),
                  margin: const EdgeInsets.only(
                      left: 12, right: 12, top: 12, bottom: 12),
                  child: const TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                          size: 30,
                        ),
                        fillColor: Colors.white,
                        hintText: "Enter Email",
                        contentPadding: EdgeInsets.all(12),
                        border: InputBorder.none),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black)),
                  margin:
                      const EdgeInsets.only(left: 12, right: 12, bottom: 12),
                  child: const TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          size: 30,
                        ),
                        suffixIcon: Icon(Icons.remove_red_eye),
                        fillColor: Colors.white,
                        hintText: "Enter Password",
                        contentPadding: EdgeInsets.all(12),
                        border: InputBorder.none),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black)),
                  margin:
                      const EdgeInsets.only(left: 12, right: 12, bottom: 12),
                  child: const TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          size: 30,
                        ),
                        fillColor: Colors.white,
                        hintText: "Enter Username",
                        contentPadding: EdgeInsets.all(12),
                        border: InputBorder.none),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                        (states) => const Color.fromARGB(255, 150, 63, 92),
                      ),
                    ),
                    child: const Text(
                      "Signin",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Already have an account",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                const Text("--------------OR-----------------"),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                        (states) => const Color.fromARGB(255, 150, 63, 92),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Signin with google",
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(Icons.circle),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
