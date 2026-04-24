import 'package:flutter/material.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({super.key});

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  int currentIndex = 0;
  final controller = TextEditingController();

  List<String> items = [];

  void addItem() {
    if (controller.text.isNotEmpty) {
      setState(() {
        items.add(controller.text);
        controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 🔝 AppBar
      appBar: AppBar(
        title: const Text("Full Demo Page"),
        actions: [
          IconButton(
            onPressed: () {
              debugPrint("Search clicked");
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),

      // 📂 Drawer
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Text("Menu", style: TextStyle(color: Colors.white)),
            ),
            ListTile(title: Text("Home")),
            ListTile(title: Text("Profile")),
            ListTile(title: Text("Settings")),
          ],
        ),
      ),

      // 📱 Body
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 📝 Input
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: "Enter something",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            // 🔘 Button
            ElevatedButton(onPressed: addItem, child: const Text("Add Item")),

            const SizedBox(height: 10),

            // 📋 List
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Card(child: ListTile(title: Text(items[index])));
                },
              ),
            ),
          ],
        ),
      ),

      // ➕ Floating Button
      floatingActionButton: FloatingActionButton(
        onPressed: addItem,
        child: const Icon(Icons.add),
      ),

      // 🔻 Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
