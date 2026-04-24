import 'package:flutter/material.dart';

class Containerr extends StatefulWidget {
  const Containerr({super.key});

  @override
  State<Containerr> createState() => _ContainerrState();
}

class _ContainerrState extends State<Containerr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 80,
        width: 80,
        alignment: Alignment.topRight,
        child: Text("Container"),
        margin: EdgeInsets.fromLTRB(99, 20, 20, 20),
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),

        decoration: BoxDecoration(
          color: Colors.blue,
          border: Border.all(color: Colors.red, width: 4),
        ),
      ),
    );
  }
}
