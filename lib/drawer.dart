import 'package:flutter/material.dart';

class Containerr extends StatefulWidget {
  const Containerr({super.key});

  @override
  State<Containerr> createState() => _ContainerrState();
}

class _ContainerrState extends State<Containerr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 30, color: Colors.blue),
              ),
              accountName: Text("Badol Majumdar"),
              accountEmail: Text("badol@email.com"),
            ),

            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {},
            ),

            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: () {},
            ),

            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {},
            ),

            Divider(), // line

            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () {},
            ),
          ],
        ),
      ),

      body: Center(child: Text("Main Screen")),
    );
  }
}
