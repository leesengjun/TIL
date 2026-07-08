import 'package:flutter/material.dart'; // Flutter 기본 디자인 위젯 사용

void main() {
  // 앱이 처음 실행될 때 가장 먼저 호출되는 함수
  runApp(const MyApp());
}

// 앱 전체 설정을 담당하는 위젯
// StatelessWidget은 상태가 변하지 않는 정적인 위젯
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter Demo', // 앱 이름 설정
      theme: ThemeData(primarySwatch: Colors.blue), // 앱 기본 테마 색상 설정
      home: const MyHomepage(), // 앱이 처음 보여줄 화면
    );
  }
}

// 화면 상태가 변할 수 있는 위젯
// StatefulWidget은 setState를 사용해서 화면을 다시 그릴 수 있음
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
      // Scaffold는 앱 화면의 기본 구조를 만들어주는 위젯
      // appBar, body, drawer, floatingActionButton 등을 넣을 수 있음

      appBar: AppBar(
        title: const Text('Test title'), // 상단 앱바 제목
      ),

      body: ListView(
        // ListView는 여러 위젯을 스크롤해서 보여주는 위젯

        scrollDirection: Axis.horizontal,
        // 스크롤 방향을 가로로 설정
        // 기본값은 세로 스크롤인데, Axis.horizontal을 주면 좌우로 스크롤됨

        children: [
          // postContainer 함수를 사용해서 반복되는 UI를 생성
          // title은 글자 내용, colorData는 박스 색깔을 의미함

          postContainer(title: 'title 1', colorData: Colors.yellow),
          postContainer(title: 'title 2', colorData: Colors.green),
          postContainer(title: 'title 3', colorData: Colors.pink),
          postContainer(title: 'title 4', colorData: Colors.orange),
          postContainer(title: 'title 5', colorData: Colors.white),
        ],
      ),
    );
  }

  // 반복되는 UI를 함수로 만든 것
  // title과 colorData 값을 받아서 서로 다른 화면 요소를 만들 수 있음
  Widget postContainer({
    String title = '', // 제목 기본값
    Color colorData = Colors.blue, // 색상 기본값
  }) {
    return Column(
      // Column은 자식 위젯들을 세로 방향으로 배치함

      crossAxisAlignment: CrossAxisAlignment.start,
      // Column의 가로 방향 정렬을 왼쪽으로 맞춤

      children: [
        Container(
          padding: const EdgeInsets.all(10),
          // Container 안쪽 여백을 모든 방향으로 10만큼 줌

          width: MediaQuery.of(context).size.width,
          // 현재 화면의 전체 너비만큼 Container 너비 설정

          child: Text(
            title,
            // 함수에서 받은 title 값을 화면에 출력

            style: const TextStyle(
              fontSize: 16, // 글자 크기
              fontWeight: FontWeight.bold, // 글자 굵게
            ),
          ),
        ),

        Container(
          width: MediaQuery.of(context).size.width,
          // 화면 너비만큼 박스 너비 설정

          height: 200,
          // 박스 높이를 200으로 설정

          color: colorData,
          // 함수에서 받은 colorData 값으로 박스 색상 설정
        ),
      ],
    );
  }
}
