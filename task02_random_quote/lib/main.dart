import 'package:flutter/material.dart';
import 'package:task02_random_quote/pages/faveriote_quote.dart';
import 'package:task02_random_quote/pages/home.dart';
import 'package:task02_random_quote/pages/quote_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp( 
      debugShowCheckedModeBanner: false,
      title: 'Quotes',
      initialRoute: '/',
      routes: {'/':(context)=>const Home(),
      '/QuotesPage':(context)=>const QuotesPage(),
      '/FaveriotesPage':(context)=>const FaveriotePage(),},
      
    );
  }
}
