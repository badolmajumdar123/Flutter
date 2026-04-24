import 'package:flu/NavigationDrawer.dart';

import 'package:flutter/material.dart';

//Navigation Drawer Two Part
//Header and ListTitle
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

      home: Navigationdrawer(),
    );
  }
}
