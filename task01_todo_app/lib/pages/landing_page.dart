import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: ListView(
          children: [
            Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.check_box_sharp),
                  title: const Text(
                    "Office works",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(
                    Icons.delete,
                    color: Colors.black,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
