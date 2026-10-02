import 'dart:async';

import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() {
  runApp(MaterialApp(home: SpalshScreen(), debugShowCheckedModeBanner: false));
}

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => InstagramApp()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              height: 600,
              width: 200,
              child: Image.asset('images/1.jpeg', scale: 4.5),
            ),
          ),

          Text(
            'From ',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          Image.asset('images/2meta.png', scale: 7),
        ],
      ),
    );
  }
}
