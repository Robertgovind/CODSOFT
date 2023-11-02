import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task02_random_quote/models/modal_class.dart';
import 'package:task02_random_quote/pages/quote_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var object = QuotesClass();
  var quotes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Q',
                  style: GoogleFonts.roboto(
                      fontSize: 95,
                      shadows: [
                        const Shadow(
                            color: Color.fromARGB(255, 80, 1, 239),
                            blurRadius: 15),
                      ],
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 6, 234, 207)),
                ),
                Text(
                  'Quotes',
                  style: GoogleFonts.roboto(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 5),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.blueAccent),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/QuotesPage');
                  },
                  child: Text(
                    'Get Started',
                    style:
                        GoogleFonts.roboto(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
