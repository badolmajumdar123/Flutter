import 'package:flutter/material.dart';

class UniquePage extends StatefulWidget {
  const UniquePage({super.key});

  @override
  State<UniquePage> createState() => _UniquePageState();
}

class _UniquePageState extends State<UniquePage> {
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
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: const Text("My Dashboard"),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Colors.blue, Colors.purple]),
          ),
        ),
      ),

      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Colors.blue, Colors.purple]),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: Row(
              children: const [
                CircleAvatar(radius: 30, child: Icon(Icons.person, size: 30)),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Badol",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      "Flutter Developer",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 15),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller,
                        decoration: const InputDecoration(
                          hintText: "Add something...",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: addItem,
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                      ),
                      child: const Text("Add"),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 5,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(blurRadius: 5, color: Colors.black12),
                      ],
                    ),
                    child: ListTile(
                      leading: const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ),
                      title: Text(items[index]),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            items.removeAt(index);
                          });
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      // ➕ Floating Button
      floatingActionButton: FloatingActionButton(
        onPressed: addItem,
        child: const Icon(Icons.add),
      ),
    );
  }
}
