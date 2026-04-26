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

class _UserScreenState extends State<UserScreen> with TickerProviderStateMixin {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  late AnimationController _cardAnim;
  late AnimationController _listAnim;

  @override
  void initState() {
    super.initState();

    _cardAnim = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..forward();

    _listAnim = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
  }

  @override
  void dispose() {
    _cardAnim.dispose();
    _listAnim.dispose();
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Widget buildForm() {
    return FadeTransition(
      opacity: _cardAnim,
      child: ScaleTransition(
        scale: CurvedAnimation(parent: _cardAnim, curve: Curves.easeOutBack),
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [BoxShadow(blurRadius: 20, color: Colors.black12)],
          ),
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Name",
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  prefixIcon: Icon(Icons.lock),
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
                      child: const Text("Register"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        context.read<PostBloc>().add(FetchUsersEvent());
                        _listAnim.forward(from: 0);
                      },
                      child: const Text("Fetch"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildList(dynamic data) {
    final users = data['users'] ?? [];

    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];

        return AnimatedBuilder(
          animation: _listAnim,
          builder: (context, child) {
            final value = Curves.easeOut.transform(
              (_listAnim.value - (index * 0.1)).clamp(0.0, 1.0),
            );

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
              boxShadow: const [
                BoxShadow(blurRadius: 10, color: Colors.black12),
              ],
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.indigo,
                  child: Text(user['name'][0].toUpperCase()),
                ),
                const SizedBox(width: 12),
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
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // subtle gradient (not overkill)
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffe3f2fd), Color(0xfffce4ec)],
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
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),

                buildForm(),

                const SizedBox(height: 20),

                Expanded(
                  child: BlocBuilder<PostBloc, PostState>(
                    builder: (context, state) {
                      if (state is PostLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (state is PostSuccess) {
                        if (state.data is String) {
                          return Center(child: Text(state.data));
                        }
                        return buildList(state.data);
                      }

                      if (state is PostError) {
                        return Center(
                          child: Text(
                            state.error,
                            style: const TextStyle(color: Colors.red),
                          ),
                        );
                      }

                      return const Center(child: Text("Start using the app"));
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
