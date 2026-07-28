import 'package:shared_preferences/shared_preferences.dart';
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
  late SharedPreferences _prefs;
  String _username = '';
  final TextEditingController _usernameController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _getUsername();
  }

  void _saveUsername() {
    setState(() {
      _username = _usernameController.text;
      _prefs.setString('currentUsername', _username);
    });
  }

  Future<void> _getUsername() async {
    _prefs = await SharedPreferences.getInstance();

    setState(() {
      _username = _prefs.getString('currentUsername') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test Title')),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsetsGeometry.all(15),
              child: Text('현재 사용자 이름: $_username'),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: TextField(
                controller: _usernameController,
                textAlign: TextAlign.left,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Input your username',
                ),
              ),
            ),
            TextButton(onPressed: () => _saveUsername(), child: Text('저장')),
          ],
        ),
      ),
    );
  }
}
