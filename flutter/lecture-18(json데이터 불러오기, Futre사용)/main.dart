import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomepage(),
    );
  }
}

class MyHomepage extends StatefulWidget {
  const MyHomepage({super.key});

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  static Future loadJson() async {
    final String response = await rootBundle.loadString(
      'lib/assets/users.json',
    );
    final data = await json.decode(response);
    return data['users'];
  }

  Future userList = loadJson();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test Title')),
      body: Container(
        child: FutureBuilder(
          future: userList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      '${snapshot.data[index]['id']}: ${snapshot.data[index]['username']}',
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return const Center(child: Text('error'));
            } else {
              return const Center(
                child: CircularProgressIndicator(strokeWidth: 2),
              );
            }
          },
        ),
      ),
    );
  }
}

