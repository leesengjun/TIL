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
        child: Center(
          child: TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext con) {
                  return AlertDialog(
                    title: const Text('Dialog Title'),
                    content: Container(child: Text('Dialog Content')),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('yes'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('close'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text('Button'),
          ),
        ),
      ),
    );
  }
}
