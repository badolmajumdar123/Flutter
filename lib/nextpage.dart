import 'package:flu/animation.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  void login(BuildContext context) {
    String email = emailController.text;
    String pass = passController.text;

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Email: $email | Password: $pass")));
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Login Page",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 30),

                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 15),

                TextField(
                  controller: passController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 25),

                ElevatedButton(
                  onPressed: () {
                    String name = emailController.text;
                    String pass = passController.text;

                    // 👉 simple condition (demo)
                    if (name == "badol" && pass == "123") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => SuperUIAnimation()),
                      );
                    } else {
                      print("Login failed");
                    }
                  },
                  child: Text("Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
