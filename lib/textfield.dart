import 'package:flu/Bloc/post_bloc.dart';
import 'package:flu/Bloc/post_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyTextField extends StatefulWidget {
  const MyTextField({super.key});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 158, 180, 180),
      appBar: AppBar(
        title: Center(
          child: Text(
            "App",
            style: TextStyle(color: Colors.red, fontStyle: FontStyle.italic),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 129, 218, 230),
      ),

      drawer: Drawer(backgroundColor: const Color.fromARGB(255, 203, 214, 215)),

      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "Welcome App",
              style: TextStyle(
                color: const Color.fromARGB(255, 193, 216, 219),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Enter your name...",
                hintText: "Type here...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                prefixIcon: Icon(Icons.person),

                filled: true,
                fillColor: const Color.fromARGB(255, 139, 217, 228),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: "Enter your password...",
                hintText: "Type here...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                prefixIcon: Icon(Icons.password),
                filled: true,
                fillColor: const Color.fromARGB(255, 139, 217, 228),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 4, 82, 93),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              onPressed: () {
                context.read<PostBloc>().add(
                  SubmitFormEvent(
                    name: nameController.text,
                    password: passwordController.text,
                  ),
                );
                // print(nameController.text);
                // print(passwordController.text);
              },

              child: Text("Submit", style: TextStyle(color: Colors.cyan)),
            ),
          ],
        ),
      ),
    );
  }
}
