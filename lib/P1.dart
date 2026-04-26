import 'package:flutter/material.dart';

class P1 extends StatefulWidget {
  const P1({super.key});

  @override
  State<P1> createState() => _PracticeTextState();
}

class _PracticeTextState extends State<P1> {
  final emailContrller = TextEditingController();

  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: const Color.fromARGB(255, 89, 149, 198),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Padding(padding: EdgeInsets.only(top: 5, left: 20)),
            CircleAvatar(
              radius: 20,
              backgroundColor: const Color.fromARGB(255, 184, 212, 235),
              child: Icon(Icons.account_balance, color: Colors.black),
            ),
            SizedBox(height: 20),
            Padding(padding: EdgeInsets.only(left: 20, top: 5)),
            Text(
              "WelCome Back",
              style: TextStyle(
                fontSize: 38,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 185, 183, 183),
              ),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 99, 179, 244),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              height: 500,
              width: 400,
              child: Column(
                children: [
                  TextFormField(
                    controller: emailContrller,

                    decoration: InputDecoration(
                      fillColor: Color.fromARGB(255, 184, 212, 235),
                      filled: true,
                      hintText: "Enter your email",
                      hintStyle: TextStyle(
                        color: const Color.fromARGB(255, 151, 192, 192),
                      ),
                      prefixIcon: Icon(Icons.email),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 2, 40, 58),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      fillColor: Color.fromARGB(255, 184, 212, 235),
                      filled: true,
                      hintText: "Enter your Password",
                      hintStyle: TextStyle(
                        color: const Color.fromARGB(255, 151, 192, 192),
                      ),
                      prefixIcon: Icon(Icons.email),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 2, 40, 58),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Spacer(),
                  TextFormField(),
                  SizedBox(height: 15),
                  Text("Forget Password", style: TextStyle(color: Colors.blue)),
                  SizedBox(height: 40),
                  MaterialButton(
                    color: Colors.blue,
                    minWidth: double.infinity,

                    onPressed: () {},
                    child: Text("Sign in"),
                  ),
                  SizedBox(height: 70),
                  Spacer(),
                  Text(
                    "Don't have an acount?",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
