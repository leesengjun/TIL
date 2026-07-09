# Flutter 6강 TIL

## 오늘 한 것
Flutter에서 `ListView.builder`를 사용해서 데이터 리스트를 반복 출력해봤다.

## 배운 내용

### ListView.builder
`ListView.builder`는 데이터 개수만큼 자동으로 위젯을 만들어주는 위젯이다.

```dart
ListView.builder(
  itemCount: postList.length,
  itemBuilder: (BuildContext con, int index) {
    return postContainer();
  },
)
