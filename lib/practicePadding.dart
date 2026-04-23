import 'package:flutter/material.dart';

class PracticePadding extends StatefulWidget {
  const PracticePadding({super.key});

  @override
  State<PracticePadding> createState() => _PracticePaddingState();
}

class _PracticePaddingState extends State<PracticePadding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 60, right: 60, top: 50, bottom: 50),
        child: Text(
          "Flutter is a open source framework",
          style: TextStyle(fontSize: 20, color: Colors.blue),
        ),
      ),
    );
  }
}
