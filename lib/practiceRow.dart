import 'package:flutter/material.dart';

class PracticeRow extends StatefulWidget {
  const PracticeRow({super.key});

  @override
  State<PracticeRow> createState() => _PracticeRowState();
}

class _PracticeRowState extends State<PracticeRow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(width: 10),

          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          SizedBox(width: 10),
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          SizedBox(width: 10),
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
