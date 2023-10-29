import 'package:flutter/material.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(left: 18, right: 18, top: 20),
          child: Column(
            children: [
              Text("TODO App"),
              TextField(),
              ListView(
                children: [
                  Text("Tasks"),
                  Container(
                    height: 200,
                    color: Colors.red,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
