import 'package:flutter/material.dart';

class PracticeSizedBox extends StatefulWidget {
  const PracticeSizedBox({super.key});

  @override
  State<PracticeSizedBox> createState() => _PracticeSizedBoxState();
}

class _PracticeSizedBoxState extends State<PracticeSizedBox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 100,
        height: 100,

        child: Container(color: Colors.blue),
      ),
    );
  }
}
