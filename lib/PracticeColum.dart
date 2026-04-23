import 'package:flutter/material.dart';

class PracticeColumn extends StatefulWidget {
  const PracticeColumn({super.key});

  @override
  State<PracticeColumn> createState() => _PracticeColumnState();
}

class _PracticeColumnState extends State<PracticeColumn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 10),

          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ],
      ),
    );
  }
}
