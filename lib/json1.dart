import 'package:flutter/material.dart';

class JsonFormate extends StatefulWidget {
  JsonFormate({super.key});

  final List<Map<String, String>> myList = [
    {
      "name": "Badol Majumdar",
      "Mobile": "700141112706",
      "Email": "badol@gmail.com",
      "Password": "123",
      "Age": "20",
      "Image": "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d",
    },
    {
      "name": "Shomrat Biswas",
      "Mobile": "8001412706",
      "Email": "shomrat@gmail.com",
      "Password": "1234",
      "Age": "21",
      "Image": "https://images.unsplash.com/photo-1516117172878-fd2c41f4a759",
    },
    {
      "name": "Akash Biswas",
      "Mobile": "9001412706",
      "Email": "akash@gmail.com",
      "Password": "12345",
      "Age": "22",
      "Image": "https://images.unsplash.com/photo-1500530855697-b586d89ba3ee",
    },
    {
      "name": "Rudra Barmon",
      "Mobile": "2001412706",
      "Email": "rudra@gmail.com",
      "Password": "123456",
      "Age": "23",
      "Image": "https://images.unsplash.com/photo-1517841905240-472988babdf9",
    },
    {
      "name": "Chandhon Biswas",
      "Mobile": "3001412706",
      "Email": "chandhon@gmail.con",
      "Password": "1234567",
      "Age": "23",
      "Image": "https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91",
    },
    {
      "name": "Avi Biswas",
      "Mobile": "3001412706",
      "Email": "avi@gmail.com",
      "Password": "12345678",
      "Age": "26",
      "Image": "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde",
    },
    {
      "name": "Bappi Roy",
      "Mobile": "6001412706",
      "Email": "bappi@gmail.com",
      "Password": "28",
      "Age": "14",
      "Image": "https://images.unsplash.com/photo-1494790108377-be9c29b29330",
    },
    {
      "name": "Sajib Ray",
      "Mobile": "726392782",
      "Email": "sajib@gmail.com",
      "Password": "226",
      "Age": "23",
      "Image": "https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e",
    },
    {
      "name": "Piranto Gain",
      "Mobile": "847454656",
      "Email": "piranto@gmail.com",
      "Password": "26",
      "Age": "12",
      "Image": "https://images.unsplash.com/photo-1500648767791-00dcc994a43e",
    },
  ];

  @override
  State<JsonFormate> createState() => _JsonFormateState();
}

class _JsonFormateState extends State<JsonFormate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("JSON Format Example")),
      body: ListView.builder(
        itemCount: widget.myList.length,
        itemBuilder: (context, index) {
          var item = widget.myList[index];

          return GestureDetector(
            onTap: () {
              print(item["name"]);
            },
            child: Container(
              margin: EdgeInsets.all(10),
              height: 200,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      item["Image"]!,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),

                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Text(
                      item["name"]!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        backgroundColor: Colors.black54,
                      ),
                    ),
                  ),

                  Positioned(
                    top: 10,
                    right: 10,
                    child: Text(
                      "Age: ${item["Age"]!}",
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.black54,
                      ),
                    ),
                  ),

                  Positioned(
                    top: 10,
                    left: 10,
                    child: Text(
                      item["Mobile"]!,
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.black54,
                      ),
                    ),
                  ),

                  Positioned(
                    top: 30,
                    left: 10,
                    child: Text(
                      item["Email"]!,
                      style: TextStyle(color: Colors.blue, fontSize: 30),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
