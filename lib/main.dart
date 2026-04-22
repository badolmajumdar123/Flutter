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

class Homeactivity extends StatelessWidget {
  const Homeactivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("App", style: TextStyle(color: Colors.red)),
        ),
      ),

      drawerScrimColor: Colors.blue,
      body: Center(
        child: Text("Hello Dart", style: TextStyle(color: Colors.blue)),
      ),

      backgroundColor: Colors.brown,
      drawer: Drawer(shadowColor: Colors.red),
      // endDrawer: EndDrawerButton(),
    );
  }
}
