# Flutter TabController와 하단 탭 메뉴

## 오늘 배운 내용

오늘은 `TabController`와 `TabBar`를 사용해 화면 아래에 탭 메뉴를 만들었다.

사용자가 탭을 누르면 다음 요소가 변경되도록 구현했다.

- 현재 화면의 배경색
- 화면 가운데 표시되는 글자
- 선택된 탭의 아이콘
- 현재 선택된 탭 번호

---

## 1. 완성 화면의 구조

이번 실습에서는 총 3개의 탭을 만들었다.

```text
Friends
Home
Settings
```

각 탭을 누르면 화면의 내용과 배경색이 변경된다.

```text
Friends 탭
→ 남색 배경
→ friends tab 출력

Home 탭
→ 주황색 배경
→ home tab 출력

Settings 탭
→ 파란색 배경
→ settings tab 출력
```

---

## 2. StatefulWidget 사용

```dart
class MyHomepage extends StatefulWidget {
  const MyHomepage({super.key});

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}
```

탭을 누르면 선택된 탭 번호와 화면이 변경되어야 한다.

화면의 상태가 변하기 때문에 `StatelessWidget`이 아니라 `StatefulWidget`을 사용했다.

---

## 3. SingleTickerProviderStateMixin

```dart
class _MyHomepageState extends State<MyHomepage>
    with SingleTickerProviderStateMixin {
```

`TabController`는 탭이 변경될 때 애니메이션을 실행한다.

애니메이션의 시간을 관리하기 위해 `vsync`가 필요하고, 이를 제공하기 위해 다음 코드를 사용한다.

```dart
with SingleTickerProviderStateMixin
```

`SingleTickerProviderStateMixin`은 하나의 애니메이션 컨트롤러를 사용할 때 주로 사용한다.

이번 코드에서는 하나의 `TabController`만 사용하므로 알맞다.

---

## 4. TabController 선언

```dart
late final TabController _tabController;
```

`TabController`는 탭의 개수와 현재 선택된 탭을 관리한다.

### `late`

변수를 선언할 때 바로 값을 넣지 않고, `initState()`에서 나중에 초기화한다는 의미이다.

### `final`

한 번 `TabController` 객체를 넣은 뒤 다른 객체로 변경하지 않는다는 의미이다.

---

## 5. 선택된 탭 번호

```dart
int _selectedIndex = 0;
```

현재 선택된 탭의 번호를 저장한다.

탭의 번호는 0부터 시작한다.

```text
Friends  → 0
Home     → 1
Settings → 2
```

처음 값이 `0`이므로 앱을 실행하면 Friends 탭이 선택된다.

---

## 6. TabController 초기화

```dart
@override
void initState() {
  super.initState();

  _tabController = TabController(
    length: 3,
    vsync: this,
  );
}
```

`initState()`는 화면이 처음 생성될 때 한 번 실행된다.

이곳에서 `TabController`를 생성한다.

### `length`

```dart
length: 3
```

전체 탭의 개수를 설정한다.

현재 Friends, Home, Settings 탭이 있으므로 `3`을 사용했다.

탭의 실제 개수와 `length` 값이 다르면 오류가 발생할 수 있다.

### `vsync`

```dart
vsync: this
```

탭 전환 애니메이션을 효율적으로 관리하기 위해 사용한다.

현재 클래스가 `SingleTickerProviderStateMixin`을 사용하므로 `this`를 전달할 수 있다.

---

## 7. 탭 변경 감지하기

```dart
_tabController.addListener(() {
  setState(() {
    _selectedIndex = _tabController.index;
  });
});
```

`addListener()`는 `TabController`의 상태가 변경되는 것을 감지한다.

사용자가 탭을 누르면 현재 선택된 탭 번호를 가져온다.

```dart
_tabController.index
```

가져온 번호를 `_selectedIndex`에 저장한다.

```dart
_selectedIndex = _tabController.index;
```

`setState()`를 사용했기 때문에 값이 바뀐 뒤 화면이 다시 그려진다.

실행 흐름은 다음과 같다.

```text
탭 클릭
↓
TabController의 index 변경
↓
addListener 실행
↓
_selectedIndex 변경
↓
setState 실행
↓
build 함수 다시 실행
↓
화면과 아이콘 변경
```

---

## 8. TabController 정리하기

```dart
@override
void dispose() {
  _tabController.dispose();
  super.dispose();
}
```

화면이 사라질 때 `TabController`를 정리한다.

```dart
_tabController.dispose();
```

사용이 끝난 컨트롤러가 메모리에 남는 것을 방지한다.

컨트롤러를 사용했다면 `dispose()`에서 정리하는 습관이 중요하다.

---

## 9. 선택된 탭에 따라 화면 변경하기

```dart
body: _selectedIndex == 0
    ? _buildTabContent(
        Colors.indigo,
        'friends tab',
      )
    : _selectedIndex == 1
        ? _buildTabContent(
            Colors.amber.shade600,
            'home tab',
          )
        : _buildTabContent(
            Colors.blue,
            'settings tab',
          ),
```

삼항 연산자를 사용해 선택된 탭에 따라 다른 화면을 출력한다.

삼항 연산자의 기본 구조는 다음과 같다.

```dart
조건 ? 조건이 참일 때 : 조건이 거짓일 때
```

첫 번째 조건:

```dart
_selectedIndex == 0
```

현재 선택된 탭이 Friends이면 남색 화면을 보여 준다.

두 번째 조건:

```dart
_selectedIndex == 1
```

현재 선택된 탭이 Home이면 주황색 화면을 보여 준다.

두 조건이 모두 아니면 Settings 탭이므로 파란색 화면을 보여 준다.

---

## 10. Colors.amber.shade600

```dart
Colors.amber.shade600
```

`Colors.amber`의 여러 색상 단계 중 600단계 색상을 사용한다.

다음과 같이 작성할 수도 있지만

```dart
Colors.amber[600]
```

결과 타입이 `Color?`이기 때문에 null 가능성이 있다.

따라서 다음 방식이 더 간단하다.

```dart
Colors.amber.shade600
```

---

## 11. bottomNavigationBar

```dart
bottomNavigationBar: SizedBox(
  height: 100,
  child: TabBar(
    controller: _tabController,
    labelColor: Colors.black,
    unselectedLabelColor: Colors.grey,
    tabs: [
      // 탭 목록
    ],
  ),
),
```

`bottomNavigationBar`는 화면 아래에 메뉴를 배치할 때 사용한다.

이번 코드에서는 `TabBar`를 화면 아래에 넣었다.

---

## 12. SizedBox

```dart
SizedBox(
  height: 100,
)
```

하단 탭 메뉴의 높이를 100으로 지정한다.

`SizedBox`는 위젯의 너비나 높이를 정할 때 사용한다.

---

## 13. TabBar

```dart
TabBar(
  controller: _tabController,
  labelColor: Colors.black,
  unselectedLabelColor: Colors.grey,
)
```

`TabBar`는 사용자가 선택할 수 있는 탭 메뉴를 만든다.

### controller

```dart
controller: _tabController
```

`TabBar`와 앞에서 만든 `TabController`를 연결한다.

### labelColor

```dart
labelColor: Colors.black
```

선택된 탭의 아이콘과 글자 색상을 검은색으로 설정한다.

### unselectedLabelColor

```dart
unselectedLabelColor: Colors.grey
```

선택되지 않은 탭의 아이콘과 글자 색상을 회색으로 설정한다.

---

## 14. Friends 탭

```dart
Tab(
  icon: Icon(
    _selectedIndex == 0
        ? Icons.person
        : Icons.person_outline,
  ),
  text: 'Friends',
)
```

Friends 탭의 번호는 `0`이다.

현재 탭이 선택되었다면 채워진 사람 아이콘을 사용한다.

```dart
Icons.person
```

선택되지 않았다면 테두리만 있는 아이콘을 사용한다.

```dart
Icons.person_outline
```

---

## 15. Home 탭

```dart
Tab(
  icon: Icon(
    _selectedIndex == 1
        ? Icons.home
        : Icons.home_outlined,
  ),
  text: 'Home',
)
```

Home 탭의 번호는 `1`이다.

선택된 경우:

```dart
Icons.home
```

선택되지 않은 경우:

```dart
Icons.home_outlined
```

---

## 16. Settings 탭

```dart
Tab(
  icon: Icon(
    _selectedIndex == 2
        ? Icons.settings
        : Icons.settings_outlined,
  ),
  text: 'Settings',
)
```

Settings 탭의 번호는 `2`이다.

선택된 경우 진한 설정 아이콘을 표시하고, 선택되지 않은 경우 외곽선 아이콘을 표시한다.

---

## 17. 탭 화면을 만드는 함수

```dart
Widget _buildTabContent(
  Color tabColor,
  String tabText,
) {
  return SizedBox.expand(
    child: ColoredBox(
      color: tabColor,
      child: Center(
        child: Text(
          tabText,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}
```

각 탭에서 공통으로 사용하는 화면을 함수로 분리했다.

탭마다 화면 구조는 같고 배경색과 글자만 다르기 때문에 하나의 함수로 만들었다.

---

## 18. 함수의 매개변수

```dart
Color tabColor
```

화면의 배경색을 전달받는다.

```dart
String tabText
```

화면 가운데 출력할 글자를 전달받는다.

함수를 사용할 때는 다음과 같이 색상과 문장을 전달한다.

```dart
_buildTabContent(
  Colors.indigo,
  'friends tab',
)
```

---

## 19. 함수 이름 앞의 `_`

```dart
_buildTabContent
```

Dart에서는 이름 앞에 `_`를 붙이면 현재 파일 안에서만 사용할 수 있는 비공개 함수가 된다.

이 함수는 해당 화면 내부에서만 사용하므로 `_`를 붙였다.

기존에 `tabController`라는 이름을 사용할 수도 있지만, 이미 `TabController` 클래스가 있기 때문에 헷갈릴 수 있다.

화면을 만드는 함수라는 의미가 잘 드러나도록 다음 이름을 사용했다.

```dart
_buildTabContent
```

---

## 20. SizedBox.expand

```dart
SizedBox.expand(
```

부모 위젯에서 사용할 수 있는 공간을 최대한 채운다.

기존에는 다음과 같이 화면 크기를 직접 가져왔다.

```dart
width: MediaQuery.of(context).size.width,
height: MediaQuery.of(context).size.height,
```

하지만 `SizedBox.expand()`를 사용하면 현재 가능한 공간을 자동으로 채울 수 있다.

---

## 21. ColoredBox

```dart
ColoredBox(
  color: tabColor,
)
```

해당 영역의 배경색을 설정한다.

전달받은 `tabColor`에 따라 탭마다 다른 배경색이 적용된다.

---

## 22. Center와 Text

```dart
Center(
  child: Text(
    tabText,
    style: const TextStyle(
      color: Colors.white,
    ),
  ),
)
```

`Center`는 자식 위젯을 화면 가운데에 배치한다.

`Text`는 전달받은 `tabText`를 출력한다.

```dart
color: Colors.white
```

글자 색상을 흰색으로 지정한다.

---

## 23. 전체 코드

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomepage(),
    );
  }
}

class MyHomepage extends StatefulWidget {
  const MyHomepage({super.key});

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: 3,
      vsync: this,
    );

    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Title'),
      ),
      body: _selectedIndex == 0
          ? _buildTabContent(
              Colors.indigo,
              'friends tab',
            )
          : _selectedIndex == 1
              ? _buildTabContent(
                  Colors.amber.shade600,
                  'home tab',
                )
              : _buildTabContent(
                  Colors.blue,
                  'settings tab',
                ),
      bottomNavigationBar: SizedBox(
        height: 100,
        child: TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          tabs: [
            Tab(
              icon: Icon(
                _selectedIndex == 0
                    ? Icons.person
                    : Icons.person_outline,
              ),
              text: 'Friends',
            ),
            Tab(
              icon: Icon(
                _selectedIndex == 1
                    ? Icons.home
                    : Icons.home_outlined,
              ),
              text: 'Home',
            ),
            Tab(
              icon: Icon(
                _selectedIndex == 2
                    ? Icons.settings
                    : Icons.settings_outlined,
              ),
              text: 'Settings',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent(
    Color tabColor,
    String tabText,
  ) {
    return SizedBox.expand(
      child: ColoredBox(
        color: tabColor,
        child: Center(
          child: Text(
            tabText,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
```

---

## 24. 실습하면서 수정한 부분

### 오타 수정

기존 코드:

```dart
'firends tab'
```

수정한 코드:

```dart
'friends tab'
```

---

### Amber 색상 수정

기존 코드:

```dart
Colors.amber[600] as Color
```

수정한 코드:

```dart
Colors.amber.shade600
```

강제 형 변환 없이 더 안전하고 간단하게 색상을 사용할 수 있다.

---

### 선택된 아이콘 수정

기존에는 모든 탭이 선택되었을 때 사람 아이콘을 사용했다.

```dart
_selectedIndex == 1
    ? Icons.person
    : Icons.chat_outlined
```

각 탭의 의미에 맞는 아이콘으로 변경했다.

```dart
_selectedIndex == 1
    ? Icons.home
    : Icons.home_outlined
```

---

### 화면 생성 함수 이름 수정

기존 함수 이름:

```dart
tabController
```

수정한 함수 이름:

```dart
_buildTabContent
```

`TabController` 클래스와 이름이 비슷해 헷갈릴 수 있으므로 함수의 역할이 잘 드러나는 이름으로 변경했다.

---

## 오늘 배운 내용 정리

이번 실습에서는 `TabController`와 `TabBar`를 사용해 화면 아래에 탭 메뉴를 만들었다.

`TabController`의 `index`를 이용해 현재 선택된 탭 번호를 확인하고, `addListener()`와 `setState()`를 사용해 화면과 아이콘을 변경했다.

또한 반복되는 탭 화면을 `_buildTabContent()` 함수로 분리해 같은 UI 코드를 여러 번 작성하지 않고 재사용하는 방법을 배웠다.

컨트롤러를 사용한 뒤에는 `dispose()`에서 정리해야 하며, `TabController`의 탭 개수와 실제 `Tab`의 개수를 동일하게 설정해야 한다.
