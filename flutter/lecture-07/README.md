# 7강

## 오늘 배운 것

### GridView
`GridView란`  위젯들을 격자 모양으로 배치해서 보여주는 위젯

### 배운내용
'crossAxisCount` GridView속성에서 쓰이는 속성이며 한줄에 몇 개씩 보여줄지 정하는 값이다
``crossAxisSpacing`` 은 가로 칸 사이 간격을 정하는 속성

### 코드 

```dart
 body: GridView(
        //scrollDirection: Axis.horizontal, //가로로 스크롤
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, //GridView에서 쓰는 속성이며 한줄에 몇개씩 보여줄지 정하는 값
          crossAxisSpacing: 15.0, //GridView에서 가로 칸 사이 간격을 정하는 속성
          mainAxisSpacing: 12.0,
        ),
