import 'package:flutter/material.dart';

class DERAW extends StatefulWidget {
  const DERAW({super.key});

  @override
  State<DERAW> createState() => RowContainer();
}

class RowContainer extends State<DERAW> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 65, 33, 22),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print("Search clicked");
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              print("Notification clicked");
            },
          ),
        ],
        title: Center(
          child: Text(
            "App",
            style: TextStyle(color: const Color.fromARGB(255, 235, 90, 37)),
          ),
        ),
      ),
      body: Text("hello world"),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                "Menu",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
