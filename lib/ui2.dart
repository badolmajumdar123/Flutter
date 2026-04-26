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

class _UserScreenState extends State<UserScreen>
    with SingleTickerProviderStateMixin {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  late AnimationController _controller;
  late Animation<double> _fade;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Widget buildInputCard() {
    return FadeTransition(
      opacity: _fade,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.deepPurpleAccent],
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              blurRadius: 15,
              color: Colors.black26,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Name",
                hintStyle: TextStyle(color: Colors.white70),
                prefixIcon: Icon(Icons.person, color: Colors.white),
                border: InputBorder.none,
              ),
            ),
            Divider(color: Colors.white30),
            TextField(
              controller: passwordController,
              obscureText: true,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: TextStyle(color: Colors.white70),
                prefixIcon: Icon(Icons.lock, color: Colors.white),
                border: InputBorder.none,
              ),
            ),
            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<PostBloc>().add(
                        SubmitFormEvent(
                          name: nameController.text,
                          password: passwordController.text,
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
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
                    ),
                    child: const Text("Fetch"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildUserList(dynamic data) {
    final users = data['users'];

    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];

        return TweenAnimationBuilder(
          duration: Duration(milliseconds: 500 + (index * 100)),
          tween: Tween<double>(begin: 0, end: 1),
          builder: (context, value, child) {
            return Transform.translate(
              offset: Offset(0, 50 * (1 - value)),
              child: Opacity(opacity: value, child: child),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black12)],
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.deepPurple,
                  child: Text(
                    user['name'][0].toUpperCase(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user['name'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(user['email'] ?? ""),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff667eea), Color(0xff764ba2)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Text(
                  "User Dashboard",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),

                buildInputCard(),

                const SizedBox(height: 20),

                Expanded(
                  child: BlocBuilder<PostBloc, PostState>(
                    builder: (context, state) {
                      if (state is PostLoading) {
                        return const Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        );
                      }

                      if (state is PostSuccess) {
                        if (state.data is String) {
                          return Center(
                            child: Text(
                              state.data,
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }
                        return buildUserList(state.data);
                      }

                      if (state is PostError) {
                        return Center(
                          child: Text(
                            state.error,
                            style: TextStyle(color: Colors.red),
                          ),
                        );
                      }

                      return const Center(
                        child: Text(
                          "Start by Registering",
                          style: TextStyle(color: Colors.white70),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
