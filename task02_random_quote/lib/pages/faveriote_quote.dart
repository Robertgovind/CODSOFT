import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FaveriotePage extends StatefulWidget {
  const FaveriotePage({super.key});

  @override
  State<FaveriotePage> createState() => _FaveriotePageState();
}

class _FaveriotePageState extends State<FaveriotePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(
                (25),
              ),
              margin: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.transparent,
                boxShadow: const [
                  BoxShadow(color: Colors.black, blurRadius: 10),
                ],
              ),
              child: Center(
                child: Text(
                  "I'm selfish, impatient and a little insecure. I make mistakes, I am out of control and at times hard to handle. But if you can't handle me at my worst, then you sure as hell don't deserve me at my best",
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(
                (25),
              ),
              margin: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.transparent,
                boxShadow: const [
                  BoxShadow(color: Colors.black, blurRadius: 10),
                ],
              ),
              child: Center(
                child: Text(
                  "I'm selfish, impatient and a little insecure. I make mistakes, I am out of control and at times hard to handle. But if you can't handle me at my worst, then you sure as hell don't deserve me at my best",
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(
                (25),
              ),
              margin: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.transparent,
                boxShadow: const [
                  BoxShadow(color: Colors.black, blurRadius: 10),
                ],
              ),
              child: Center(
                child: Text(
                  "Two things are infinite: the universe and human stupidity; and I'm not sure about the universe.",
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 18,
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
