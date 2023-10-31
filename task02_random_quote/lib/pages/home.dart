import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Q',
              style: GoogleFonts.roboto(
                  fontSize: 95,
                  shadows: [
                    const Shadow(
                        color: Color.fromARGB(255, 80, 1, 239), blurRadius: 15),
                  ],
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 6, 234, 207)),
            ),
            Text(
              'Quotes',
              style: GoogleFonts.roboto(
                  fontSize: 30, fontWeight: FontWeight.bold, letterSpacing: 5),
            ),
          ],
        ),
      ),
    );
  }
}
