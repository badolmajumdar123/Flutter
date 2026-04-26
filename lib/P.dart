import 'package:flutter/material.dart';

class P extends StatefulWidget {
  const P({super.key});

  @override
  State<P> createState() => _PracticeTextState();
}

class _PracticeTextState extends State<P> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("App")),
        backgroundColor: Colors.brown,
      ),

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
              onTap: () {},
            ),

            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  child: Center(
                    child: Text(
                      "1",
                      style: TextStyle(
                        color: Colors.brown,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                Container(
                  height: 70,
                  width: 70,
                  child: Center(
                    child: Text(
                      "1",
                      style: TextStyle(
                        color: Colors.brown,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                Container(
                  height: 70,
                  width: 70,
                  child: Center(
                    child: Text(
                      "1",
                      style: TextStyle(
                        color: Colors.brown,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  child: Center(
                    child: Text(
                      "1",
                      style: TextStyle(
                        color: Colors.brown,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                Container(
                  height: 70,
                  width: 70,
                  child: Center(
                    child: Text(
                      "1",
                      style: TextStyle(
                        color: Colors.brown,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                Container(
                  height: 70,
                  width: 70,
                  child: Center(
                    child: Text(
                      "1",
                      style: TextStyle(
                        color: Colors.brown,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Login"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("FAB clicked");
        },
        backgroundColor: Colors.yellow,
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: Icon(Icons.add, color: Colors.red),
      ),
    );
  }
}
