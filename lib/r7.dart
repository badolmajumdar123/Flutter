import 'package:flutter/material.dart';

class Practicepage extends StatelessWidget {
  const Practicepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),

      body: Column(
        children: [
          SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey[300],
                child: Icon(Icons.person, size: 40),
              ),

              buildStat("Posts", "10"),
              buildStat("Followers", "120"),
              buildStat("Following", "80"),
            ],
          ),

          SizedBox(height: 15),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Badol Developer",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("Flutter & Backend Developer 🚀"),
              ],
            ),
          ),

          SizedBox(height: 15),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {},
                child: Text("Edit Profile"),
              ),
            ),
          ),

          SizedBox(height: 10),

          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemCount: 9,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.grey[300],
                  child: Icon(Icons.image, size: 40),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildStat(String title, String value) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Text(title),
      ],
    );
  }
}
