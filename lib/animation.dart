import 'package:flutter/material.dart';

class SuperUIAnimation extends StatefulWidget {
  const SuperUIAnimation({super.key});

  @override
  State<SuperUIAnimation> createState() => _SuperUIAnimationState();
}

class _SuperUIAnimationState extends State<SuperUIAnimation> {
  int currentIndex = 0;
  int selectedCategory = 0;

  List<String> categories = ["All", "Work", "Study", "Personal"];
  List<String> tasks = ["Design UI", "Study Flutter", "API Integration"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f6fb),

      appBar: AppBar(title: const Text("Super App"), centerTitle: true),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  bool isSelected = selectedCategory == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.blue : Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          categories[index],
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 15),

            Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  buildAnimatedCard("Users", Icons.people, Colors.blue),
                  buildAnimatedCard("Messages", Icons.message, Colors.green),
                  buildAnimatedCard(
                    "Analytics",
                    Icons.bar_chart,
                    Colors.orange,
                  ),
                  buildAnimatedCard("Settings", Icons.settings, Colors.purple),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Tasks",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            ListView.builder(
              itemCount: tasks.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 5,
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    ),
                    title: Text(tasks[index]),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 14),
                  ),
                );
              },
            ),
          ],
        ),
      ),

      // ➕ Floating Button (Animated)
      floatingActionButton: GestureDetector(
        onTapDown: (_) => setState(() => currentIndex = 1),
        onTapUp: (_) => setState(() => currentIndex = 0),
        child: AnimatedScale(
          duration: const Duration(milliseconds: 100),
          scale: currentIndex == 1 ? 0.9 : 1,
          child: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) {
          setState(() {
            currentIndex = i;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }

  Widget buildAnimatedCard(String title, IconData icon, Color color) {
    double scale = 1.0;

    return StatefulBuilder(
      builder: (context, setInnerState) {
        return GestureDetector(
          onTapDown: (_) => setInnerState(() => scale = 0.9),
          onTapUp: (_) => setInnerState(() => scale = 1.0),
          child: AnimatedScale(
            duration: const Duration(milliseconds: 100),
            scale: scale,
            child: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon, color: Colors.white, size: 30),
                    const SizedBox(height: 10),
                    Text(title, style: const TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
