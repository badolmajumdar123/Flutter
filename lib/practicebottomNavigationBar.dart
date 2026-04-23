import 'package:flutter/material.dart';

class Practicebottomnavigationbar extends StatefulWidget {
  const Practicebottomnavigationbar({super.key});

  @override
  State<Practicebottomnavigationbar> createState() =>
      _PracticebottomnavigationbarState();
}

class _PracticebottomnavigationbarState
    extends State<Practicebottomnavigationbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Home Page")),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
