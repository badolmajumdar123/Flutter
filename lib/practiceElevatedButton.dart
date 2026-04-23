import 'package:flutter/material.dart';

class PracticeElevatedButton extends StatefulWidget {
  const PracticeElevatedButton({super.key});

  @override
  State<PracticeElevatedButton> createState() => _PracticeElevatedButtonState();
}

class _PracticeElevatedButtonState extends State<PracticeElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
        onPressed: () => print("Elevated Button Pressed"),
        child: Text("+", style: TextStyle(color: Colors.green)),
      ),
    );
  }
}
