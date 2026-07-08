# Flutter 3강 TIL

## 오늘 한 것
Flutter에서 `Stack` 위젯을 사용해서 여러 개의 Container를 겹쳐서 배치해봤다.

## 배운 내용

### Stack
`Stack`은 위젯들을 겹쳐서 배치할 때 사용하는 위젯이다.  
`children`에 들어간 순서대로 아래에서 위로 쌓인다.

```dart
Stack(
  children: [
    Container(color: Colors.red),
    Container(color: Colors.blue),
  ],
)
