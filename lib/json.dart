import 'package:flutter/material.dart';

class PracticePage extends StatelessWidget {
  PracticePage({super.key});

  final List<Map<String, dynamic>> myArray = [
    {
      "name": "Badol Majumdar",
      "Mobile": "7001412706",
      "Email": "badol@gmail.com",
      "Password": "123",
      "Age": "20",
    },
    {
      "name": "Shomrat Biswas",
      "Mobile": "8001412706",
      "Email": "shomrat@gmail.com",
      "Password": "1234",
      "Age": "21",
    },
    {
      "name": "Akash Biswas",
      "Mobile": "9001412706",
      "Email": "akash@gmail.com",
      "Password": "12345",
      "Age": "22",
    },
    {
      "name": "Rudra Barmon",
      "Mobile": "2001412706",
      "Email": "rudra@gmail.com",
      "Password": "123456",
      "Age": "23",
    },
    {
      "name": "Chandhon Biswas",
      "Mobile": "3001412706",
      "Email": "chandhon@gmail.con",
      "Password": "1234567",
      "Age": "23",
    },
    {
      "name": "Avi Biswas",
      "Mobile": "3001412706",
      "Email": "avi@gmail.com",
      "Password": "12345678",
      "Age": "26",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stateless Example")),
      body: ListView(
        children: myArray.map((item) {
          return ListTile(
            title: Text(item['name']),
            subtitle: Text("Age: ${item['Age']}"),
          );
        }).toList(),
      ),
    );
  }
}
