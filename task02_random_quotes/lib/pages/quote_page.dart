import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/modal_class.dart';
import 'package:share_plus/share_plus.dart';

class QuotesPage extends StatefulWidget {
  const QuotesPage({
    super.key,
  });

  @override
  State<QuotesPage> createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
  var qList = QuotesClass.quotesList;
  var quoteObject = QuotesClass();
  var quotes;
  bool isBookmarked = false;
  String savedQuote = '';
  List<String> favQuotes = [];

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
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getQuotes();
    addQuote();
    getQuote();

    getFavQuotes();
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Quote of the day'),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Random Quote'),
                      ),
                    ],
                  )),
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
                    IconButton(
                      onPressed: () {
                        setState(() async {
                          if (quotes != null) {
                            await Share.share(quotes['slip']['advice']);
                          }
                        });
                      },
                      icon: const Icon(
                        Icons.share_sharp,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                          (states) => const Color.fromARGB(255, 187, 134, 197),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          getQuotes();
                          isBookmarked = false;
                        });
                      },
                      child: Text(
                        'Generate',
                        style: GoogleFonts.roboto(color: Colors.white),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        toggleBookmarked();
                        setState(() async {
                          if (isBookmarked) {
                            favQuotes.add(quotes['slip']['advice']);
                            SharedPreferences qts =
                                await SharedPreferences.getInstance();
                            qts.setStringList('quoteList', favQuotes);
                          } else {
                            favQuotes.remove(quotes['slip']['advice']);
                            SharedPreferences qts =
                                await SharedPreferences.getInstance();
                            qts.setStringList('quoteList', favQuotes);
                          }
                        });
                      },
                      icon: quotes != null
                          ? Icon(
                              Icons.bookmark,
                              size: 30,
                              color:
                                  isBookmarked ? Colors.yellow : Colors.black,
                            )
                          : const Icon(
                              Icons.bookmark,
                              size: 30,
                              color: Colors.black,
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
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                        (states) => const Color.fromARGB(255, 187, 134, 197),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/FaveriotesPage');
                    },
                    child: Text(
                      'Bookmarked',
                      style: GoogleFonts.roboto(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addQuote() async {
    SharedPreferences qts = await SharedPreferences.getInstance();
    qts.setString('quote', quotes['slip']['advice']);
  }

  void getQuote() async {
    SharedPreferences qts = await SharedPreferences.getInstance();
    savedQuote = qts.getString('quote').toString();
    setState(() {});
  }

  void setFavQuotes() async {
    SharedPreferences qtsList = await SharedPreferences.getInstance();
    qtsList.setStringList('quoteList', favQuotes);
  }

  void getFavQuotes() async {
    SharedPreferences qtsList = await SharedPreferences.getInstance();
    favQuotes = qtsList.getStringList('quoteList')!;
    setState(() {});
  }
}
