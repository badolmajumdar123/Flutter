// import 'package:flutter/material.dart';

// class RegisterActivity extends StatelessWidget {
//   const RegisterActivity({super.key});

//   void mySnackBar(String message, BuildContext context) {
//     ScaffoldMessenger.of(
//       context,
//     ).showSnackBar(SnackBar(content: Text(message)));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         elevation: 9,
//         backgroundColor: Colors.red,
//         foregroundColor: Colors.white,
//         shape: const CircleBorder(),
//         child: const Icon(Icons.add),

//         onPressed: () {
//           mySnackBar("Button Clicked", context);
//         },
//       ),
//     );
//   }
// }

// class StatelessWidget {}

// class Homeactivity extends StatelessWidget {
//   const Homeactivity({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(
//           child: Text("App", style: TextStyle(color: Colors.red)),
//         ),
//       ),

//       drawerScrimColor: Colors.blue,
//       body: Center(
//         child: Text("Hello Dart", style: TextStyle(color: Colors.blue)),
//       ),

//       backgroundColor: Colors.brown,
//       drawer: Drawer(shadowColor: Colors.red),
//       // endDrawer: EndDrawerButton(),
//     );
//   }
// }

// class LoginActivity extends StatelessWidget {
//   const LoginActivity({super.key});

//   void mySnackBar(String message, BuildContext context) {
//     ScaffoldMessenger.of(
//       context,
//     ).showSnackBar(SnackBar(content: Text(message)));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("App", style: TextStyle(color: Colors.red)),
//         // titleSpacing: 180,
//         titleTextStyle: TextStyle(
//           color: Colors.blue,
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//         ),

//         //centerTitle: true,
//         backgroundColor: Colors.grey,
//         toolbarHeight: 50,
//         toolbarOpacity: 1,
//         elevation: 80,

//         actions: [
//           IconButton(
//             onPressed: () {
//               mySnackBar(" i am comments", context);
//             },
//             icon: Icon(Icons.search),
//           ),
//           IconButton(
//             onPressed: () {
//               mySnackBar(" i am settings", context);
//             },
//             icon: Icon(Icons.settings),
//           ),
//           IconButton(
//             onPressed: () {
//               mySnackBar(" i am email", context);
//             },
//             icon: Icon(Icons.email),
//           ),
//           IconButton(
//             onPressed: () {
//               mySnackBar(" i am account", context);
//             },
//             icon: Icon(Icons.account_circle),
//           ),
//         ],
//       ),
//     );
//   }
// }
