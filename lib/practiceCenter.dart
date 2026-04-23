import 'package:flutter/material.dart';

class PracticeCenter extends StatefulWidget {
  const PracticeCenter({super.key});

  @override
  State<PracticeCenter> createState() => _PracticeCenterState();
}

class _PracticeCenterState extends State<PracticeCenter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Hello World",
          style: TextStyle(
            fontSize: 30,
            fontStyle: FontStyle.italic,
            color: Colors.amberAccent,
          ),
        ),
      ),
    );
  }
}
