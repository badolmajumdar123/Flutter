// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'Bloc/post_bloc.dart';
// import 'Bloc/post_event.dart';
// import 'Bloc/post_state.dart';

// class InputBox extends StatefulWidget {
//   const InputBox({super.key});

//   @override
//   State<InputBox> createState() => _InputBoxState();
// }

// class _InputBoxState extends State<InputBox> {
//   final firstName = TextEditingController();
//   final lastName = TextEditingController();
//   final email = TextEditingController();
//   final password = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Register")),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             TextField(
//               controller: firstName,
//               decoration: const InputDecoration(labelText: "First Name"),
//             ),
//             const SizedBox(height: 10),

//             TextField(
//               controller: lastName,
//               decoration: const InputDecoration(labelText: "Last Name"),
//             ),
//             const SizedBox(height: 10),

//             TextField(
//               controller: email,
//               decoration: const InputDecoration(labelText: "Email"),
//             ),
//             const SizedBox(height: 10),

//             TextField(
//               controller: password,
//               obscureText: true,
//               decoration: const InputDecoration(labelText: "Password"),
//             ),

//             const SizedBox(height: 20),

//             ElevatedButton(
//               onPressed: () {
//                 print(firstName.text);
//                 print(lastName.text);
//                 print(email.text);
//                 print(password.text);

//                 context.read<PostBloc>().add(
//                   SubmitFormEvent(
//                     firstName: firstName.text,
//                     lastName: lastName.text,
//                     email: email.text,
//                     password: password.text,
//                   ),
//                 );
//               },
//               child: const Text("Submit"),
//             ),

//             const SizedBox(height: 20),

//             BlocBuilder<PostBloc, PostState>(
//               builder: (context, state) {
//                 if (state is PostLoading) {
//                   return const CircularProgressIndicator();
//                 }

//                 if (state is PostSuccess) {
//                   return Text(state.message);
//                 }

//                 if (state is PostError) {
//                   return Text(
//                     state.error,
//                     style: const TextStyle(color: Colors.red),
//                   );
//                 }

//                 return const SizedBox();
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
