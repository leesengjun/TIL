# Flutter 9강 TIL

## 오늘 배운 내용

오늘은 `SingleChildScrollView`를 사용해서 화면 전체를 스크롤하는 방법을 배웠다.

이번 코드에서는 `Column` 안에 여러 개의 `Container`를 세로로 배치하고,  
그 `Column`을 `SingleChildScrollView`로 감싸서 스크롤이 가능하게 만들었다.

## 내가 작성한 코드 구조

```dart
body: SingleChildScrollView(
  child: Column(
    children: [
      Container(height: 300, color: Colors.green),
      Container(height: 300, color: Colors.red),
      Container(height: 300, color: Colors.yellow),
    ],
  ),
),


## `ListView`와 ``SingleChildScrollView``의 차이점
리스트뷰는 전체 화면을 자동으로 스크롤 할수있는건데
싱글차일드스크롤뷰는 자식위젯을 스크롤 할수있게해주는거다 
