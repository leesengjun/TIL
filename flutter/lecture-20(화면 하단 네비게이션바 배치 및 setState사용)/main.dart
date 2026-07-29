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

class _MyHomepageState extends State<MyHomepage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(
      () => setState(() => _selectedIndex = _tabController.index),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test Title')),
      body: _selectedIndex == 0
          ? tabController(context, Colors.indigo, 'firends tab')
          : _selectedIndex == 1
          ? tabController(context, Colors.amber[600] as Color, 'home tab')
          : tabController(context, Colors.blue, 'setting'),
      bottomNavigationBar: SizedBox(
        height: 100,
        child: TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          tabs: [
            Tab(
              icon: Icon(
                _selectedIndex == 0 ? Icons.person : Icons.person_2_outlined,
              ),
              text: 'Friends',
            ),
            Tab(
              icon: Icon(
                _selectedIndex == 1 ? Icons.person : Icons.chat_outlined,
              ),
              text: 'home',
            ),
            Tab(
              icon: Icon(
                _selectedIndex == 2
                    ? Icons.person
                    : Icons.settings_outlined, // 선택된 아이콘들만 진하게 표시
              ),
              text: 'settings',
            ),
          ],
        ),
      ),
    );
  }

  Widget tabController(BuildContext con, Color tabColor, String tabText) {
    return Container(
      width: MediaQuery.of(con).size.width,
      height: MediaQuery.of(con).size.height,
      color: tabColor,
      child: Center(
        child: Text(tabText, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
