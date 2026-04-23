import 'package:flutter/material.dart';

class PracticeContainer extends StatefulWidget {
  const PracticeContainer({super.key});

  @override
  State<PracticeContainer> createState() => _PracticeContainerState();
}

class _PracticeContainerState extends State<PracticeContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
