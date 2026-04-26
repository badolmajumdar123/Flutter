import 'package:flutter/material.dart';

class Navigationdrawer extends StatefulWidget {
  const Navigationdrawer({super.key});

  @override
  State<Navigationdrawer> createState() => _NavigationdrawerState();
}

class _NavigationdrawerState extends State<Navigationdrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigation Drawer"),
        backgroundColor: Colors.blue,
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              accountName: Text("Badol Majumdar"),
              accountEmail: Text("badol@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 40),
              ),
            ),

            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Profile"),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      body: Center(
        child: CircleAvatar(
          radius: 90,
          backgroundImage: NetworkImage("lib/IMG_20240328_113701516_MFNR.jpg"),
        ),
      ),
      //
    );
  }
}
