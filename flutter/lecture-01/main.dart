import 'package:flutter/material.dart'; // Flutter의 기본 디자인 위젯들을 사용하기 위해 import

void main() {
  // 앱이 처음 시작될 때 실행되는 함수
  runApp(const MyApp()); // MyApp 위젯을 화면에 실행
}

// 앱의 전체 구조를 담당하는 위젯
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter Demo', // 앱의 이름
      theme: ThemeData(primarySwatch: Colors.blue), // 앱의 기본 테마 색상 설정
      home: const MyHomepage(), // 앱이 처음 보여줄 화면
    );
  }
}

// 상태가 변할 수 있는 화면 위젯
class MyHomepage extends StatefulWidget {
  const MyHomepage({super.key});

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

// MyHomepage의 실제 화면과 상태를 관리하는 클래스
class _MyHomepageState extends State<MyHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 기본적인 앱 화면 구조를 만들어주는 위젯
      appBar: AppBar(
        title: const Text('Test title'), // 상단 앱바에 표시될 제목
      ),

      // 왼쪽에서 열리는 사이드 메뉴
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero, // 리스트의 기본 여백 제거
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue), // Drawer 헤더 배경색
              child: Text('Drawer Header Part'), // Drawer 헤더에 들어갈 글자
            ),
            ListTile(
              title: Text('Menu 1'), // Drawer 안에 들어가는 메뉴 항목
            ),
          ],
        ),
      ),

      // 화면 가운데에 hello world 글자를 보여줌
      body: const Center(child: Text('hello world')),

      // 화면 오른쪽 아래에 떠 있는 버튼
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('click'), // 버튼을 누르면 콘솔에 click 출력
        child: Icon(Icons.mouse), // 버튼 안에 들어갈 아이콘
      ),
    );
  }
}
