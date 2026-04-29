import 'package:flutter/material.dart';

class JsonFormate extends StatefulWidget {
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
  State<JsonFormate> createState() => _JsonFormateState();
}

class _JsonFormateState extends State<JsonFormate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text("User Profiles"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: widget.myList.length,
        itemBuilder: (context, index) {
          var item = widget.myList[index];

          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            height: 230,
            child: Material(
              borderRadius: BorderRadius.circular(20),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => DetailPage(data: item)),
                  );
                },
                child: Stack(
                  children: [
                    Hero(
                      tag: item["Image"]!,
                      child: AnimatedOpacity(
                        opacity: 1,
                        duration: const Duration(milliseconds: 500),
                        child: Image.network(
                          item["Image"]!,
                          width: double.infinity,
                          height: 230,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.85),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),

                    Positioned(
                      bottom: 15,
                      left: 15,
                      right: 15,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item["name"]!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item["Email"]!,
                            style: const TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),

                    Positioned(
                      top: 15,
                      left: 15,
                      child: _glassBadge(item["Mobile"]!),
                    ),
                    Positioned(
                      top: 15,
                      right: 15,
                      child: _glassBadge("Age ${item["Age"]!}"),
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

  Widget _glassBadge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
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
      appBar: AppBar(title: Text(data["name"]!)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: data["Image"]!,
            child: Image.network(
              data["Image"]!,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data["name"]!,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text("📧 ${data["Email"]}"),
                Text("📱 ${data["Mobile"]}"),
                Text("🎂 Age: ${data["Age"]}"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
