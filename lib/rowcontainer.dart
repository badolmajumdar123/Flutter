import 'package:flutter/material.dart';

class Rowcontainer extends StatefulWidget {
  const Rowcontainer({super.key});

  @override
  State<Rowcontainer> createState() => RowContainer();
}

class RowContainer extends State<Rowcontainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Row Container")),
      body: Row(
        children: [
          Container(child: Text("Row Container 1")),
          Container(child: Text("Row Container 2")),
          Container(child: Text("Row Container 3")),
        ],
      ),
    );
  }
}
