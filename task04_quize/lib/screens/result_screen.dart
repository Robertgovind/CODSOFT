import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, this.score});
  final score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin:const EdgeInsets.only(left: 25,right: 25,top: 40) ,
        decoration: BoxDecoration(border: Border.all(width:1 ),),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$score/50',
              style:const TextStyle(fontSize: 40),
            ),
             const Text(
              'Congratulation',
              style: TextStyle(fontSize: 40,color: Colors.green),
            ),

            Container(child: Image(image: AssetImage('assets/trophy-star.png'),),),
          ],
        ),
      ),
    );
  }
}
