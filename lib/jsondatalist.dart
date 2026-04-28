import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class MyListPage extends StatefulWidget {
  const MyListPage({super.key});

  @override
  State<MyListPage> createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {
  List users = [];

  @override
  void initState() {
    super.initState();
    loadJson();
  }

  Future<void> loadJson() async {
    String jsonString = await rootBundle.loadString('assets/file.json');
    print(jsonString);

    List data = jsonDecode(jsonString);

    setState(() {
      users = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("JSON Data")),
      body: users.isEmpty
          ? Center(child: CircularProgressIndicator()) // 👈 loading
          : SingleChildScrollView(
              child: Column(
                children: users.map((user) {
                  return ListTile(
                    title: Text(user['name']),
                    subtitle: Text(user['Email']),
                  );
                }).toList(),
              ),
            ),
    );
  }
}
