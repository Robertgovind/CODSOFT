import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var time = DateTime.now();
  var formatDate = DateFormat.yMd().format(DateTime.now());
  @override
  void initState() {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        time = DateTime.now();
        setState(() {});
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 65, 12, 74),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '${time.hour > 12 ? time.hour - 12 : time.hour}:${time.minute < 9 ? '0${time.minute}' : time.minute}:${time.second < 9 ? '0${time.second}' : time.second}',
              style: GoogleFonts.raleway(
                fontSize: 23,
                color: Colors.white,
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
                height: 18,
              ),
            ),
            Text(
              'Alarm',
              style: GoogleFonts.raleway(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                height: 18,
              ),
            ),
            Text(
              formatDate,
              style: GoogleFonts.raleway(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
                height: 18,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.pink, Colors.blueAccent],
          ),
        ),
        child: Column(
          children: [
            AlarmContainer(),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class AlarmContainer extends StatefulWidget {
  AlarmContainer({
    super.key,
  });

  bool isActivated = true;
  void toggle() {
    isActivated = !isActivated;
  }

  @override
  State<AlarmContainer> createState() => _AlarmContainerState();
}

class _AlarmContainerState extends State<AlarmContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1)),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '6:30',
                      style: GoogleFonts.raleway(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2),
                    ),
                    Text(
                      'am',
                      style: GoogleFonts.raleway(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 2),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 0,
                ),
                Text(
                  'Daily',
                  style: GoogleFonts.raleway(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 2),
                ),
              ],
            ),
          ),
          Switch(
            value: widget.isActivated,
            onChanged: (bool val) {
              widget.toggle();
              setState(() {});
            },
            activeColor: Colors.blueAccent,
            inactiveThumbColor: Colors.grey,
          ),
        ],
      ),
    );
  }
}
