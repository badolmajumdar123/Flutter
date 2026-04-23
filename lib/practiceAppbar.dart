import 'package:flutter/material.dart';

class PracticeAppBarr extends StatefulWidget {
  const PracticeAppBarr({super.key});

  @override
  State<PracticeAppBarr> createState() => _PracticeAppBarrState();
}

class _PracticeAppBarrState extends State<PracticeAppBarr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Practice App Bar")),
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
