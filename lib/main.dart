import 'package:flutter/material.dart';
import 'package:flu/practice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      darkTheme: ThemeData(brightness: Brightness.light),

      debugShowCheckedModeBanner: false,

      home: Practicepage(),
    );
  }
}
