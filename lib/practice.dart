import 'package:flutter/material.dart';

class Practicepage extends StatefulWidget {
  const Practicepage({super.key});

  @override
  State<Practicepage> createState() => _PracticepageState();
}

class _PracticepageState extends State<Practicepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "hello1",
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                color: Colors.tealAccent,
              ),
            ),
            SizedBox(width: 20),
            Text(
              "hello2",

              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                color: Colors.tealAccent,
              ),
            ),
            SizedBox(width: 20),
            Text(
              "hello3",
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                color: Colors.greenAccent,
              ),
            ),
            SizedBox(width: 70),
          ],
        ),
      ),
    );
  }
}
