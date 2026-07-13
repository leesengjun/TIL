# Flutter 10강 TIL

## 오늘 배운 내용

오늘은 Flutter에서 `showDialog`와 `AlertDialog`를 사용해서 팝업창을 띄우는 방법을 배웠다.

버튼을 클릭하면 Dialog가 화면 위에 나타나고,  
Dialog 안에 제목, 내용, 버튼을 넣을 수 있다.

## 핵심 개념

### showDialog

`showDialog`는 화면 위에 Dialog를 띄울 때 사용하는 함수이다.

```dart
showDialog(
  context: context,
  builder: (BuildContext con) {
    return AlertDialog();
  },
);
