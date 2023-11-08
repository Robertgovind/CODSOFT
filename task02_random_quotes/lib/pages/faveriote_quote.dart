import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/modal_class.dart';

class FaveriotePage extends StatefulWidget {
  const FaveriotePage({super.key});

  @override
  State<FaveriotePage> createState() => _FaveriotePageState();
}

class _FaveriotePageState extends State<FaveriotePage> {
  var qList = QuotesClass.quotesList;
  List<String>? favQuotes = [];

  @override
  void initState() {
    super.initState();
    getQuotes();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 94, 142, 205),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 94, 142, 205),
          title: const Text('Bookmarked'),
        ),
        body: ListView.builder(
          itemCount: favQuotes?.length,
          itemBuilder: (context, index) {
            return Container(
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
                  favQuotes![index],
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void getQuotes() async {
    SharedPreferences qts = await SharedPreferences.getInstance();
    favQuotes = qts.getStringList('quoteList');
    setState(() {});
  }
}
