import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task02_random_quote/models/modal_class.dart';

class QuotesPage extends StatefulWidget {
  const QuotesPage({
    super.key,
  });

  @override
  State<QuotesPage> createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
  var qList = QuotesClass();
  var quotes;
  bool isBookmarked = false;

  void toggleBookmarked() {
    setState(() {
      isBookmarked = !isBookmarked;
    });
  }

  void getQuotes() async {
    var response = await http.get(
      Uri.parse('https://api.adviceslip.com/advice'),
    );
    quotes = jsonDecode(response.body);
  }

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 60),
                child: Text(
                  'Quote of the day',
                  style: GoogleFonts.roboto(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white54),
                ),
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
                  child: quotes != null
                      ? Text(
                          quotes['slip']['advice'],
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        )
                      : Text(
                          'Loading......',
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
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
                        const SizedBox(width: 10),
                        const Icon(
                          Icons.share_sharp,
                          size: 30,
                        )
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          getQuotes();
                          isBookmarked = false;
                        });
                      },
                      child: const Text('Generate'),
                    ),
                    IconButton(
                      onPressed: () {
                        qList.quotesList.add(quotes['slip']['advice']);
                        toggleBookmarked();
                      },
                      icon: Icon(
                        Icons.bookmark,
                        size: 30,
                        color: isBookmarked ? Colors.yellow : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.menu,
                        size: 30,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/FaveriotesPage');
                    },
                    child: const Text('Bookmarked'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
