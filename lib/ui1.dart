import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Bloc/post_bloc.dart';
import 'Bloc/post_event.dart';
import 'Bloc/post_state.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Widget buildInputCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black12,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              hintText: "Enter Name",
              prefixIcon: Icon(Icons.person),
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
              hintText: "Enter Password",
              prefixIcon: Icon(Icons.lock),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    final name = nameController.text.trim();
                    final pass = passwordController.text.trim();

                    if (name.isEmpty || pass.isEmpty) return;

                    context.read<PostBloc>().add(
                      SubmitFormEvent(name: name, password: pass),
                    );

                    nameController.clear();
                    passwordController.clear();
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text("Register"),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    context.read<PostBloc>().add(FetchUsersEvent());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black87,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text("Fetch"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildUserList(dynamic data) {
    final users = data['users'];

    if (users == null || users.isEmpty) {
      return const Center(child: Text("No users found"));
    }

    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];

        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(blurRadius: 6, color: Colors.black12)],
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.blue,
                child: Text(
                  user['name'][0].toUpperCase(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user['name'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(user['email'] ?? ""),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F6FA),
      appBar: AppBar(
        title: const Text("User Dashboard"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            buildInputCard(),
            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<PostBloc, PostState>(
                builder: (context, state) {
                  if (state is PostLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is PostSuccess) {
                    if (state.data is String) {
                      return Center(
                        child: Text(
                          state.data,
                          style: const TextStyle(color: Colors.green),
                        ),
                      );
                    }

                    return buildUserList(state.data);
                  }

                  if (state is PostError) {
                    return Center(
                      child: Text(
                        state.error,
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  }

                  return const Center(child: Text("Register or Fetch Users"));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
