import 'package:flutter/material.dart';

class Practicepage extends StatelessWidget {
  const Practicepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: Text("Social App"),
        centerTitle: false,
        backgroundColor: Colors.blueAccent,
        actions: [Icon(Icons.message), SizedBox(width: 15)],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              padding: EdgeInsets.all(10),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(6, (index) {
                  return buildStory("User $index");
                }),
              ),
            ),

            buildPost(),
            buildPost(),
            buildPost(),
          ],
        ),
      ),
    );
  }

  Widget buildStory(String name) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Column(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.blueAccent,
            child: Icon(Icons.person, color: Colors.white),
          ),
          SizedBox(height: 5),
          Text(name, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget buildPost() {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              CircleAvatar(child: Icon(Icons.person)),
              SizedBox(width: 10),
              Text("User Name", style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),

          SizedBox(height: 10),

          // Post image placeholder
          Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(child: Text("Post Image")),
          ),

          SizedBox(height: 10),

          // Actions
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.favorite_border),
              Icon(Icons.comment),
              Icon(Icons.share),
            ],
          ),
        ],
      ),
    );
  }
}
