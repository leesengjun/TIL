import 'package:flutter/material.dart'; // Flutter의 기본 디자인 위젯들을 사용하기 위해 import

void main() {
  // 앱이 처음 실행될 때 가장 먼저 호출되는 함수
  runApp(const MyApp()); // MyApp 위젯을 실행해서 화면에 보여줌
}

// 앱 전체 설정을 담당하는 위젯
// StatelessWidget: 내부 값이 바뀌지 않는 정적인 위젯
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter Demo', // 앱 이름 설정
      theme: ThemeData(primarySwatch: Colors.blue), // 앱 기본 색상 테마 설정
      home: const MyHomepage(), // 앱이 처음 시작될 때 보여줄 화면
    );
  }
}

// 화면 상태가 변할 수 있는 위젯
// StatefulWidget: 나중에 setState로 화면을 바꿀 수 있음
class MyHomepage extends StatefulWidget {
  const MyHomepage({super.key});

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

// MyHomepage의 실제 화면을 만드는 클래스
class _MyHomepageState extends State<MyHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold는 앱 화면의 기본 뼈대를 만들어주는 위젯
      // appBar, body, drawer, floatingActionButton 등을 넣을 수 있음
      appBar: AppBar(
        title: const Text('Test title'), // 상단 앱바에 들어가는 제목
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => print('GestureDetector used'),
          child: Container(width: 200, height: 200, color: Colors.amber),
        ),
      ),
    );
  }
}
