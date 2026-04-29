import 'package:flutter/material.dart';

class JsonFormate extends StatelessWidget {
  const JsonFormate({super.key});

  final List<Map<String, String>> myList = const [
    {
      "name": "Badol Majumdar",
      "Mobile": "700141112706",
      "Email": "badol@gmail.com",
      "Age": "20",
      "Image": "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d",
    },
    {
      "name": "Shomrat Biswas",
      "Mobile": "8001412706",
      "Email": "shomrat@gmail.com",
      "Age": "21",
      "Image": "https://images.unsplash.com/photo-1516117172878-fd2c41f4a759",
    },
    {
      "name": "Akash Biswas",
      "Mobile": "9001412706",
      "Email": "akash@gmail.com",
      "Age": "22",
      "Image": "https://images.unsplash.com/photo-1500530855697-b586d89ba3ee",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text("Users"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: myList.length,
        itemBuilder: (context, index) {
          final item = myList[index];

          return AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
            margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            height: 240,
            child: Material(
              elevation: 6,
              borderRadius: BorderRadius.circular(22),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 500),
                      pageBuilder: (_, __, ___) => DetailPage(data: item),
                      transitionsBuilder: (_, animation, __, child) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                    ),
                  );
                },
                child: Stack(
                  children: [
                    Hero(
                      tag: item["Image"]!,
                      child: Image.network(
                        item["Image"]!,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.9),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),

                    Positioned(
                      bottom: 16,
                      left: 16,
                      right: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item["name"]!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            item["Email"]!,
                            style: const TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),

                    Positioned(
                      top: 16,
                      left: 16,
                      child: _chip(item["Mobile"]!),
                    ),
                    Positioned(
                      top: 16,
                      right: 16,
                      child: _chip("Age ${item["Age"]!}"),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _chip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black45,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white24),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final Map<String, String> data;

  const DetailPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: data["Image"]!,
                child: Image.network(
                  data["Image"]!,
                  width: double.infinity,
                  height: 320,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 40,
                left: 10,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            data["name"]!,
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text("📧 ${data["Email"]}"),
          Text("📱 ${data["Mobile"]}"),
          Text("🎂 Age: ${data["Age"]}"),
        ],
      ),
    );
  }
}
