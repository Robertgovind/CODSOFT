import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuotesPage extends StatelessWidget {
  const QuotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Quote of the day',
                style: GoogleFonts.roboto(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white54),
              ),
              Container(
                padding: const EdgeInsets.all(
                  (25),
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.transparent,
                  boxShadow: const [
                    BoxShadow(color: Colors.black, blurRadius: 10),
                  ],
                ),
                height: 500,
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Share',
                          style: GoogleFonts.roboto(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.share_sharp,
                          size: 30,
                        )
                      ],
                    ),
                    Icon(
                      Icons.bookmark,
                      size: 35,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
