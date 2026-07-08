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

      body: Container(
        // Container는 박스 형태의 위젯
        // 크기, 색상, 여백, 정렬 등을 설정할 수 있음
        alignment: Alignment.topCenter,

        // Container 안의 자식 위젯을 위쪽 가운데로 정렬
        // 단, Column이 화면 전체 높이를 차지하면 효과가 크게 안 보일 수도 있음
        child: Column(
          // Column은 자식 위젯들을 세로 방향으로 배치하는 위젯
          mainAxisAlignment: MainAxisAlignment.center,

          // Column의 주축은 세로 방향
          // 그래서 mainAxisAlignment는 세로축 정렬을 의미함
          // center는 자식들을 세로 가운데에 배치
          children: [
            Row(
              // Row는 자식 위젯들을 가로 방향으로 배치하는 위젯
              mainAxisAlignment: MainAxisAlignment.center,

              // Row의 주축은 가로 방향
              // center는 자식들을 가로 가운데에 배치
              children: [
                Container(
                  width: 200,
                  height: 200,
                  color: Colors.red,
                  // 가로 200, 세로 200 크기의 빨간색 박스
                ),
                Container(
                  width: 200,
                  height: 200,
                  color: Colors.blue,
                  // 가로 200, 세로 200 크기의 파란색 박스
                ),
              ],
            ),

            Row(
              // 두 번째 줄도 가로 방향으로 박스들을 배치
              mainAxisAlignment: MainAxisAlignment.center,

              // 자식 위젯들을 가로 가운데로 정렬
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2,

                  // MediaQuery는 현재 화면 크기 정보를 가져올 때 사용
                  // 현재 화면 전체 너비의 절반만큼 Container 너비를 설정
                  height: 200,
                  color: Colors.amber,
                  // 높이 200의 노란색 박스
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2,

                  // 화면 너비의 나머지 절반을 차지하는 Container
                  height: 200,
                  color: Colors.deepPurpleAccent,
                  // 높이 200의 보라색 박스
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

