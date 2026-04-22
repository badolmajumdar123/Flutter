import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Homeactivity());
  }
}

class Homeactivity extends StatelessWidget {
  const Homeactivity({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

class LoginActivity extends StatelessWidget {
  const LoginActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

class RegisterActivity extends StatelessWidget {
  const RegisterActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
