# Flutter 14강 TIL

## 오늘 배운 내용

오늘은 Flutter에서 `Container`에 그라데이션 배경을 넣는 방법을 배웠다.

`BoxDecoration`과 `LinearGradient`를 사용하면 단색 배경이 아니라 여러 색이 자연스럽게 이어지는 배경을 만들 수 있다.
``LinearGradient``은 직선방향으로 색이 자연스럽게 변하게 만드는 기능이다 
## 내가 작성한 코드 핵심

```dart
body: Container(
  width: MediaQuery.of(context).size.width,
  height: MediaQuery.of(context).size.height,
  decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Colors.blue[100] as Color,
        Colors.blue[300] as Color,
        Colors.blue[500] as Color,
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: const [0.1, 0.4, 0.9],
    ),
  ),
),
