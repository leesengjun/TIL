import 'package:flutter/material.dart'; // Flutter의 기본 디자인(Material) 위젯들을 사용하기 위한 패키지 가져오기

// 1. StatefulWidget 정의: 화면 내에서 상태 변화가 필요할 때 사용하는 위젯입니다.
class SecondView extends StatefulWidget {
  const SecondView({super.key});

  @override
  State<SecondView> createState() => _SecondViewState();
}

// 2. 위 위젯의 실제 화면과 상태(State)를 관리하는 클래스입니다.
class _SecondViewState extends State<SecondView> {
  @override
  Widget build(BuildContext context) {
    // Scaffold: 상단 앱바, 본문 등 모바일 화면의 기본 뼈대를 제공합니다.
    return Scaffold(
      // AppBar: 화면 상단의 타이틀 영역입니다.
      appBar: AppBar(
        // leading: 앱바 좌측에 위치할 위젯 (주로 뒤로 가기 버튼에 사용)
        leading: IconButton(
          // onPressed: 버튼이 클릭되었을 때 실행할 코드
          // Navigator.of(context).pop()를 실행하여 현재 화면을 끄고 이전 화면으로 돌아갑니다.
          onPressed: () => Navigator.of(context).pop(), 
          // iOS 스타일의 왼쪽 화살표 아이콘 모양(<)을 설정합니다.
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text('Test Title'), // 앱바 중앙/좌측에 표시될 텍스트 타이틀
      ),
      // body: 앱바 아래의 메인 본문 영역
      body: Center(
        // Center: 자식 위젯을 화면 정중앙에 배치합니다.
        child: GestureDetector(
          // GestureDetector: 제스처를 감지하는 위젯입니다. 여기서는 클릭(탭) 이벤트를 감지합니다.
          onTap: () => Navigator.push(
            context,
            // MaterialPageRoute: 머티리얼 디자인 스타일의 부드러운 화면 전환 효과를 제공합니다.
            // 클릭 시 다시 'SecondView()'를 생성하여 화면 위에 새로운 SecondView를 또 쌓아 올립니다. (무한 중첩 가능)
            MaterialPageRoute(builder: (_) => const SecondView()),
          ),
          // child: 클릭 이벤트를 감지할 실제 화면 대상 (파란색 상자)
          child: Container(
            padding: const EdgeInsets.all(15), // 상자 안쪽 사방에 15만큼의 여백(패딩)을 줍니다.
            color: Colors.blue,               // 상자의 배경색을 파란색으로 지정합니다.
            child: const Text('This is second view'), // 상자 안에 들어갈 안내 텍스트
          ),
        ),
      ),
    );
  }
}
