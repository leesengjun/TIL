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
        child: Column(
          children: [
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  textStyle: TextStyle(fontSize: 20),
                ),
                onPressed: () => print('ElevatedButton'),
                child: const Text('ElevatedButton'),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () => print('TextButton'),
                child: const Text('TextButton'),
              ),
            ),
            Center(
              child: OutlinedButton(
                onPressed: () => print('OutlinedButton'),
                child: const Text('OutlinedButton'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
