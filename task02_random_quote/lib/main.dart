import 'package:flutter/material.dart';
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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quotes',
      home: QuotesPage(),
    );
  }
}
