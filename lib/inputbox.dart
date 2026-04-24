import 'package:flutter/material.dart';

class InputBox extends StatefulWidget {
  const InputBox({super.key});

  @override
  State<InputBox> createState() => _PracticeTextState();
}

class _PracticeTextState extends State<InputBox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 10, height: 7),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "First Name",
            ),
          ),
          SizedBox(width: 10, height: 7),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Last Name",
            ),
          ),
          SizedBox(width: 10, height: 7),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Email",
            ),
          ),
          SizedBox(width: 10, height: 7),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Password",
            ),
          ),
          SizedBox(width: 10, height: 7),
          ElevatedButton(
            onPressed: () {
              print("Button 3 clicked");
            },
            child: Text("Row Button 3"),
          ),
        ],
      ),
    );
  }
}
