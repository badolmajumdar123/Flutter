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
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Users"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: widget.myList.length,
        itemBuilder: (context, index) {
          var item = widget.myList[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => DetailPage(data: item)),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              height: 230,
              child: Stack(
                children: [
                  Hero(
                    tag: item["Image"]!,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        item["Image"]!,
                        width: double.infinity,
                        height: 230,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, progress) {
                          if (progress == null) return child;
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                    ),
                  ),

                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
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

                  Positioned(top: 15, left: 15, child: _badge(item["Mobile"]!)),
                  Positioned(
                    top: 15,
                    right: 15,
                    child: _badge("Age ${item["Age"]!}"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _badge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.black54,
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
          Text(data["name"]!, style: const TextStyle(fontSize: 22)),
          Text(data["Email"]!),
          Text("Mobile: ${data["Mobile"]}"),
          Text("Age: ${data["Age"]}"),
        ],
      ),
    );
  }
}
