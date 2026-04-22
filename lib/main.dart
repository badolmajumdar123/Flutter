import 'package:flutter/material.dart';

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

      home: const Homeactivity(),
    );
  }
}

class Homeactivity extends StatelessWidget {
  const Homeactivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My App")),

      body: Text("Hello Dart"),
      backgroundColor: Color.fromRGBO(159, 144, 144, 1),
    );
  }
}

// class LoginActivity extends StatelessWidget {
//   const LoginActivity({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold();
//   }
// }

// class RegisterActivity extends StatelessWidget {
//   const RegisterActivity({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold();
//   }
// }
