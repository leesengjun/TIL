# Flutter 10강 TIL

## 오늘 배운 내용

오늘은 `Align` 위젯을 사용해서 자식 위젯의 위치를 정렬하는 방법을 배웠다.

`Align`은 자식 위젯을 부모 영역 안에서 원하는 위치에 배치할 때 사용한다.

이번 코드에서는 `Stack` 안에 여러 개의 `Align`을 넣고,  
각각 다른 위치에 `Container`를 배치해봤다.

## 핵심 개념

### Align

`Align`은 자식 위젯을 특정 위치에 정렬하는 위젯이다.

```dart
Align(
  alignment: Alignment.center,
  child: Container(
    width: 100,
    height: 100,
    color: Colors.green,
  ),
)
