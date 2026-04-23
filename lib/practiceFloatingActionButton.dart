import 'package:flutter/material.dart';

class PracticeFloatingActionButton extends StatefulWidget {
  const PracticeFloatingActionButton({super.key});

  @override
  State<PracticeFloatingActionButton> createState() =>
      _PracticeFloatingActionButtonState();
}

class _PracticeFloatingActionButtonState
    extends State<PracticeFloatingActionButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Home")),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Clicked");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
