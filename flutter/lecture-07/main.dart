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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test Title')),
      body: GridView(
        //scrollDirection: Axis.horizontal, //가로로 스크롤
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, //GridView에서 쓰는 속성이며 한줄에 몇개씩 보여줄지 정하는 값
          crossAxisSpacing: 15.0, //GridView에서 가로 칸 사이 간격을 정하는 속성
          mainAxisSpacing: 12.0,
        ),
        children: [
          postContainer(number: '0', ColorData: Colors.amber),
          postContainer(number: '1', ColorData: Colors.blue),
          postContainer(number: '2', ColorData: Colors.red),
          postContainer(number: '0', ColorData: Colors.amber),
          postContainer(number: '1', ColorData: Colors.blue),
          postContainer(number: '2', ColorData: Colors.red),
          postContainer(number: '0', ColorData: Colors.amber),
          postContainer(number: '1', ColorData: Colors.blue),
          postContainer(number: '2', ColorData: Colors.red),
          postContainer(number: '0', ColorData: Colors.amber),
          postContainer(number: '1', ColorData: Colors.blue),
          postContainer(number: '2', ColorData: Colors.red),
        ],
      ),
    );
  }

  Container postContainer({String number = '0', ColorData = Colors.amber}) {
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
