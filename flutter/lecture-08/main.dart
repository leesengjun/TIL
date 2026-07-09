import 'package:flutter/material.dart';

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
  final postList = [
    {'number': '1', 'color': Colors.amber},
    {'number': '2', 'color': Colors.blue},
    {'number': '3', 'color': Colors.red},
    {'number': '4', 'color': Colors.orange},
    {'number': '5', 'color': Colors.green},
    {'number': '6', 'color': Colors.pink},
    {'number': '7', 'color': Colors.lightBlueAccent},
    {'number': '8', 'color': Colors.indigoAccent},
    {'number': '9', 'color': Colors.white},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test Title')),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15.0,
          mainAxisSpacing: 12.0,
        ),
        itemCount: postList.length,
        itemBuilder: (BuildContext con, int index) {
          return postContainer(
            number: postList[index]['number'] as String,
            ColorData: postList[index]['color'] as Color,
          );
        },
      ),
    );
  }

  Widget postContainer({String number = '0', ColorData = Colors.amber}) {
    return Container(
      height: 200,
      color: ColorData,
      padding: EdgeInsets.all(20),
      child: Center(
        child: Text(
          'box $number',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
