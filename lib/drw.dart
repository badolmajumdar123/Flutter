import 'package:flutter/material.dart';

class AllInOneUI extends StatelessWidget {
  const AllInOneUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),

      drawer: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(right: Radius.circular(30)),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(16, 60, 16, 20),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.indigo],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 32, color: Colors.blue),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Badol Majumdar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "badol@email.com",
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            _buildItem(Icons.home, "Home", context),
            _buildItem(Icons.person, "Profile", context),
            _buildItem(Icons.settings, "Settings", context),

            const Spacer(),

            const Divider(),

            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text("Logout", style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),

      body: const Center(
        child: Text("Main Screen", style: TextStyle(fontSize: 20)),
      ),
    );
  }

  Widget _buildItem(IconData icon, String title, BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
