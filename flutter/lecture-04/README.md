# Flutter 4강 TIL

## 오늘 한 것
Flutter에서 `GestureDetector`를 사용해서 일반 위젯에 클릭 이벤트를 추가해봤다.

## 배운 내용

### GestureDetector
`GestureDetector`는 사용자의 터치나 클릭 같은 동작을 감지하는 위젯이다.

버튼이 아닌 `Container` 같은 일반 위젯에도 클릭 이벤트를 줄 수 있다.

```dart
GestureDetector(
  onTap: () => print('GestureDetector used'),
  child: Container(
    width: 200,
    height: 200,
    color: Colors.amber,
  ),
)
