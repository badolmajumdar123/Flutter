import 'package:flutter/material.dart';

class PracticeText extends StatefulWidget {
  const PracticeText({super.key});

  @override
  State<PracticeText> createState() => _PracticeTextState();
}

class _PracticeTextState extends State<PracticeText> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        "Flutter is a open source framework.",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          fontStyle: FontStyle.italic,
          color: Colors.red,
        ),
      ),
    );
  }
}
