import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Bloc/post_bloc.dart';
import 'Bloc/post_event.dart';
import 'Bloc/post_state.dart';

class Input extends StatefulWidget {
  const Input({super.key});

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  final controller = TextEditingController();
  final firstnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 🔹 INPUT
            TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: "Enter Text",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

            const SizedBox(height: 20),
            TextField(
              controller: firstnameController,
              decoration: InputDecoration(
                labelText: "Enter Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 🔹 BUTTON (Bloc trigger)
            ElevatedButton(
              onPressed: () {
                context.read<PostBloc>().add(
                  SubmitFormEvent(
                    enterText: controller.text,
                    firstName: firstnameController.text,
                  ),
                );
                print(controller.text);
                print(firstnameController.text);
              },
              child: const Text("Submit"),
            ),

            const SizedBox(height: 20),

            // 🔹 UI STATE
            BlocBuilder<PostBloc, PostState>(
              builder: (context, state) {
                if (state is PostLoading) {
                  return const CircularProgressIndicator();
                }

                if (state is PostSuccess) {
                  return Text(
                    state.result,
                    style: const TextStyle(color: Colors.green),
                  );
                }

                if (state is PostError) {
                  return Text(
                    state.error,
                    style: const TextStyle(color: Colors.red),
                  );
                }

                return const Text("Enter something and submit");
              },
            ),
          ],
        ),
      ),
    );
  }
}
