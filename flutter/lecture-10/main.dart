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
      body: Container(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.amber,
                child: Text('hello'),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.green,
                child: Text('hello'),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: Text('hello'),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.amber,
                child: Text('hello'),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.green,
                child: Text('hello'),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: Text('hello'),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.amber,
                child: Text('hello'),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.green,
                child: Text('hello'),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: Text('hello'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
