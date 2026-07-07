# Flutter 1강 TIL

## 오늘 한 것
Flutter 기본 화면을 만들고 `Scaffold`, `AppBar`, `Drawer`, `FloatingActionButton`을 사용해봤다.

## 오늘 만든 화면
- 상단에 제목이 있는 AppBar 만들기
- 왼쪽에서 열리는 Drawer 메뉴 만들기
- 화면 가운데에 `hello world` 출력하기
- 오른쪽 아래에 FloatingActionButton 추가하기
- 버튼을 누르면 콘솔에 `click` 출력하기

## 배운 위젯

### MaterialApp
앱의 전체 설정을 담당하는 위젯이다.

### Scaffold
앱 화면의 기본 구조를 만들어주는 위젯이다.  
`appBar`, `drawer`, `body`, `floatingActionButton` 같은 속성을 넣을 수 있다.

### AppBar
화면 위쪽에 제목을 보여주는 영역이다.

### Drawer
왼쪽에서 열리는 사이드 메뉴를 만들 때 사용한다.

### FloatingActionButton
화면 오른쪽 아래에 떠 있는 버튼을 만들 때 사용한다.

## 핵심 코드

```dart
Scaffold(
  appBar: AppBar(title: const Text('Test title')),
  drawer: Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(color: Colors.blue),
          child: Text('Drawer Header Part'),
        ),
        ListTile(title: Text('Menu 1')),
      ],
    ),
  ),
  body: const Center(child: Text('hello world')),
  floatingActionButton: FloatingActionButton(
    onPressed: () => print('click'),
    child: Icon(Icons.mouse),
  ),
)
