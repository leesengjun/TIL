# Flutter 14강 TIL

## 오늘 배운 내용

오늘은 `RadialGradient`를 사용해서 원형 그라데이션 배경을 만드는 방법을 배웠다.

이전에는 `LinearGradient`를 사용해서 위에서 아래, 왼쪽에서 오른쪽처럼 직선 방향으로 색이 변하는 배경을 만들었다.  
이번에는 `RadialGradient`를 사용해서 중심에서 바깥쪽으로 색이 퍼지는 배경을 만들어봤다.

## 내가 작성한 코드 핵심

```dart
body: Container(
  width: MediaQuery.of(context).size.width,
  height: MediaQuery.of(context).size.height,
  decoration: BoxDecoration(
    gradient: RadialGradient(
      colors: [
        Colors.blue[100] as Color,
        Colors.blue[300] as Color,
        Colors.blue[500] as Color,
      ],
      stops: const [0.1, 0.5, 0.7],
      radius: 1.0,
    ),
  ),
),
