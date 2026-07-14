import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Colors.blue[100] as Color,
              Colors.blue[300] as Color,
              Colors.blue[500] as Color,
            ],
            stops: const [0.1, 0.5, 0.7],
            radius: 1.0,
          ),
        ),
      ),
    );
  }
}
