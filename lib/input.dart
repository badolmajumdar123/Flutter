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
  final namecontroller = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    namecontroller.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User App")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: namecontroller,
              decoration: InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final name = namecontroller.text.trim();
                  final password = passwordController.text.trim();

                  if (name.isEmpty || password.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("all fields are required")),
                    );
                    return;
                  }

                  context.read<PostBloc>().add(
                    SubmitFormEvent(name: name, password: password),
                  );

                  namecontroller.clear();
                  passwordController.clear();
                },
                child: const Text("Register"),
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context.read<PostBloc>().add(FetchUsersEvent());
                },
                child: const Text("Get All Users"),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: BlocBuilder<PostBloc, PostState>(
                builder: (context, state) {
                  if (state is PostLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is PostSuccess) {
                    final data = state.data;

                    if (data is String) {
                      return Center(
                        child: Text(
                          data,
                          style: const TextStyle(
                            color: Colors.green,
                            fontSize: 16,
                          ),
                        ),
                      );
                    }

                    if (data is! Map) {
                      return const Center(child: Text("Invalid response"));
                    }

                    final users = data['users'];

                    if (users == null || users is! List || users.isEmpty) {
                      return const Center(child: Text("No users found"));
                    }

                    return ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        final user = users[index];

                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          child: ListTile(
                            leading: const Icon(Icons.person),
                            title: Text(user['name'] ?? "No Name"),
                            subtitle: Text(user['email'] ?? "No Email"),
                          ),
                        );
                      },
                    );
                  }

                  if (state is PostError) {
                    return Center(
                      child: Text(
                        state.error,
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  }

                  return const Center(
                    child: Text("please submit the from or fetch users"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
