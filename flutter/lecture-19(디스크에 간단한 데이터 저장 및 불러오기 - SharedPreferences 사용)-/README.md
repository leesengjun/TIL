# Flutter SharedPreferences 실습

## 오늘 배운 내용

오늘은 Flutter의 `shared_preferences` 패키지를 사용해서 사용자가 입력한 이름을 기기에 저장하고, 앱을 다시 실행했을 때 저장된 이름을 불러오는 방법을 배웠다.

이번 실습에서 배운 주요 내용은 다음과 같다.

- `shared_preferences` 패키지 사용하기
- `TextEditingController`로 입력값 가져오기
- `SharedPreferences`에 문자열 저장하기
- 저장된 문자열 불러오기
- `setState()`로 화면 갱신하기
- `initState()`에서 초기 데이터 불러오기

---

## 1. SharedPreferences란?

`SharedPreferences`는 간단한 데이터를 기기 내부에 저장할 때 사용하는 기능이다.

앱이 종료되거나 다시 실행되어도 저장한 값이 유지된다.

주로 다음과 같은 간단한 데이터를 저장할 때 사용한다.

- 사용자 이름
- 로그인 여부
- 다크 모드 설정
- 알림 설정
- 처음 실행 여부

복잡하거나 많은 데이터를 저장하는 용도보다는 간단한 설정값을 저장할 때 적합하다.

---

## 2. 패키지 설치

`SharedPreferences`는 Flutter의 기본 기능이 아니기 때문에 패키지를 추가해야 한다.

터미널에서 다음 명령어를 실행한다.

```bash
flutter pub add shared_preferences
```

설치가 완료되면 `pubspec.yaml`의 `dependencies`에 패키지가 추가된다.

```yaml
dependencies:
  flutter:
    sdk: flutter
  shared_preferences: ^버전
```

---

## 3. 패키지 불러오기

```dart
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
```

### Flutter Material

```dart
import 'package:flutter/material.dart';
```

`MaterialApp`, `Scaffold`, `TextField`, `TextButton` 등의 Flutter 위젯을 사용하기 위해 불러온다.

### SharedPreferences

```dart
import 'package:shared_preferences/shared_preferences.dart';
```

기기에 데이터를 저장하고 불러오는 `SharedPreferences` 클래스를 사용하기 위해 불러온다.

---

## 4. SharedPreferences 변수 선언

```dart
late SharedPreferences _prefs;
```

`SharedPreferences` 객체를 저장할 변수이다.

### `late`

`late`는 변수를 선언할 때 바로 값을 넣지 않고, 나중에 값을 넣겠다는 의미이다.

```dart
late SharedPreferences _prefs;
```

현재 선언할 때는 값이 없지만, 이후 `_getUsername()` 함수에서 값을 넣는다.

```dart
_prefs = await SharedPreferences.getInstance();
```

`late` 변수를 초기화하기 전에 사용하면 `LateInitializationError`가 발생할 수 있으므로 주의해야 한다.

---

## 5. 사용자 이름 변수

```dart
String _username = '';
```

현재 저장된 사용자 이름을 보관하는 변수이다.

처음에는 저장된 이름을 불러오기 전이므로 빈 문자열을 넣었다.

```dart
''
```

저장된 이름을 불러오면 `_username` 값이 변경되고 화면에도 표시된다.

```dart
Text('현재 사용자 이름: $_username')
```

---

## 6. TextEditingController

```dart
final TextEditingController _usernameController =
    TextEditingController();
```

`TextField`에 사용자가 입력한 내용을 가져오기 위해 사용하는 컨트롤러이다.

`TextField`의 `controller`에 연결한다.

```dart
TextField(
  controller: _usernameController,
)
```

사용자가 입력한 문자열은 다음과 같이 가져온다.

```dart
_usernameController.text
```

예를 들어 사용자가 `Anna`를 입력했다면 다음 값이 나온다.

```text
Anna
```

---

## 7. initState()

```dart
@override
void initState() {
  super.initState();
  _getUsername();
}
```

`initState()`는 `StatefulWidget`이 처음 생성될 때 한 번 실행되는 함수이다.

화면이 처음 열릴 때 저장된 사용자 이름을 불러오기 위해 `_getUsername()`을 실행한다.

```dart
_getUsername();
```

실행 순서는 다음과 같다.

```text
화면 실행
↓
initState() 실행
↓
_getUsername() 실행
↓
저장된 사용자 이름 불러오기
↓
화면에 사용자 이름 표시
```

`super.initState()`는 부모 클래스의 초기화 기능을 먼저 실행한다.

```dart
super.initState();
```

보통 `initState()`의 가장 위에서 호출한다.

---

## 8. 사용자 이름 저장하기

```dart
void _saveUsername() {
  setState(() {
    _username = _usernameController.text;
    _prefs.setString('currentUsername', _username);
  });
}
```

이 함수는 입력창에 작성한 사용자 이름을 저장한다.

### 입력값 가져오기

```dart
_username = _usernameController.text;
```

`TextField`에 사용자가 입력한 내용을 가져와 `_username`에 저장한다.

예를 들어 입력창에 다음과 같이 입력했다면

```text
Daniel
```

`_username`의 값도 `Daniel`이 된다.

### SharedPreferences에 저장하기

```dart
_prefs.setString('currentUsername', _username);
```

문자열 데이터를 기기에 저장한다.

`setString()`은 문자열을 저장할 때 사용한다.

```dart
setString('키', 저장할 값)
```

현재 코드에서는 다음과 같다.

```dart
'currentUsername'
```

저장된 값을 구분하기 위한 키이다.

```dart
_username
```

실제로 저장할 사용자 이름이다.

쉽게 표현하면 다음과 같다.

```text
currentUsername이라는 이름으로 사용자 이름을 저장
```

---

## 9. setState()

```dart
setState(() {
  _username = _usernameController.text;
});
```

`setState()`는 상태가 변경되었다는 것을 Flutter에 알려 주는 함수이다.

`_username`의 값만 바꾸면 변수의 값은 변경되지만 화면이 바로 다시 그려지지 않을 수 있다.

따라서 화면에 표시되는 값을 변경할 때 `setState()`를 사용한다.

```dart
setState(() {
  _username = 새로운 값;
});
```

`setState()`가 실행되면 `build()` 함수가 다시 호출되고 변경된 사용자 이름이 화면에 나타난다.

```text
사용자 이름 변경
↓
setState() 실행
↓
build() 다시 실행
↓
변경된 이름 화면에 표시
```

---

## 10. 저장된 이름 불러오기

```dart
Future<void> _getUsername() async {
  _prefs = await SharedPreferences.getInstance();

  setState(() {
    _username = _prefs.getString('currentUsername') ?? '';
  });
}
```

기기에 저장된 사용자 이름을 불러오는 함수이다.

### Future

```dart
Future<void>
```

`SharedPreferences` 객체를 가져오는 작업이 바로 끝나지 않을 수 있기 때문에 `Future`를 사용한다.

`void`는 함수가 별도의 값을 반환하지 않는다는 의미이다.

### async

```dart
async
```

함수 안에서 `await`를 사용할 수 있도록 한다.

### SharedPreferences 객체 가져오기

```dart
_prefs = await SharedPreferences.getInstance();
```

현재 앱에서 사용할 수 있는 `SharedPreferences` 객체를 가져온다.

`await`는 객체를 가져오는 작업이 끝날 때까지 기다린다.

### 문자열 불러오기

```dart
_prefs.getString('currentUsername')
```

`currentUsername`이라는 키로 저장된 문자열을 가져온다.

저장할 때 사용한 키와 불러올 때 사용하는 키는 반드시 같아야 한다.

저장:

```dart
_prefs.setString('currentUsername', _username);
```

불러오기:

```dart
_prefs.getString('currentUsername');
```

키 이름이 다르면 저장된 값을 찾을 수 없다.

---

## 11. Null 처리

```dart
_username = _prefs.getString('currentUsername') ?? '';
```

처음 앱을 실행하면 아직 저장된 사용자 이름이 없을 수 있다.

이 경우 `getString()`의 결과가 `null`이 된다.

```dart
_prefs.getString('currentUsername')
```

값이 없을 때 발생하는 `null` 문제를 막기 위해 `??` 연산자를 사용한다.

```dart
?? ''
```

왼쪽 값이 `null`이면 오른쪽 값을 사용한다는 의미이다.

따라서 다음 코드는

```dart
_username = _prefs.getString('currentUsername') ?? '';
```

다음과 같은 의미이다.

```text
저장된 이름이 있으면 그 이름 사용
저장된 이름이 없으면 빈 문자열 사용
```

---

## 12. 저장된 사용자 이름 출력

```dart
Text('현재 사용자 이름: $_username')
```

현재 `_username` 변수에 들어 있는 값을 화면에 출력한다.

문자열 안에 변수 값을 넣기 위해 `$`를 사용했다.

```dart
$_username
```

예를 들어 `_username`이 `Anna`라면 화면에는 다음과 같이 나온다.

```text
현재 사용자 이름: Anna
```

---

## 13. Padding

```dart
Padding(
  padding: const EdgeInsets.all(15),
  child: Text('현재 사용자 이름: $_username'),
)
```

위젯 주변에 여백을 추가한다.

```dart
EdgeInsets.all(15)
```

상하좌우 모든 방향에 15만큼 여백을 넣는다.

처음에는 다음과 같이 작성해서 오류가 발생했다.

```dart
EdgeInsetsGeometry.all(15)
```

`EdgeInsetsGeometry`에는 `all()` 생성자가 없기 때문에 `EdgeInsets`를 사용해야 한다.

정상 코드:

```dart
EdgeInsets.all(15)
```

---

## 14. TextField

```dart
TextField(
  controller: _usernameController,
  textAlign: TextAlign.left,
  decoration: const InputDecoration(
    border: InputBorder.none,
    hintText: 'Input your username',
  ),
)
```

사용자 이름을 입력할 수 있는 입력창이다.

### controller

```dart
controller: _usernameController
```

입력창과 `_usernameController`를 연결한다.

이를 통해 입력값을 다음과 같이 가져올 수 있다.

```dart
_usernameController.text
```

### textAlign

```dart
textAlign: TextAlign.left
```

입력한 글자를 왼쪽에 정렬한다.

### InputDecoration

```dart
decoration: const InputDecoration(
  border: InputBorder.none,
  hintText: 'Input your username',
)
```

입력창의 디자인을 설정한다.

```dart
border: InputBorder.none
```

입력창의 기본 테두리를 제거한다.

```dart
hintText: 'Input your username'
```

사용자가 아무것도 입력하지 않았을 때 안내 문장을 표시한다.

---

## 15. 저장 버튼

```dart
TextButton(
  onPressed: () => _saveUsername(),
  child: const Text('저장'),
)
```

사용자가 버튼을 누르면 `_saveUsername()` 함수가 실행된다.

```dart
onPressed: () => _saveUsername()
```

버튼에 표시되는 글자는 다음과 같다.

```dart
child: const Text('저장')
```

함수 이름만 직접 전달해도 같은 결과가 나온다.

```dart
onPressed: _saveUsername
```

---

## 16. 전체 코드

```dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

class _MyHomepageState extends State<MyHomepage> {
  late SharedPreferences _prefs;

  String _username = '';

  final TextEditingController _usernameController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _getUsername();
  }

  Future<void> _saveUsername() async {
    final username = _usernameController.text;

    await _prefs.setString(
      'currentUsername',
      username,
    );

    if (!mounted) return;

    setState(() {
      _username = username;
    });
  }

  Future<void> _getUsername() async {
    _prefs = await SharedPreferences.getInstance();

    if (!mounted) return;

    setState(() {
      _username = _prefs.getString('currentUsername') ?? '';
      _usernameController.text = _username;
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Title'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              '현재 사용자 이름: $_username',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              controller: _usernameController,
              textAlign: TextAlign.left,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Input your username',
              ),
            ),
          ),
          TextButton(
            onPressed: _saveUsername,
            child: const Text('저장'),
          ),
        ],
      ),
    );
  }
}
```

---

## 17. dispose()

```dart
@override
void dispose() {
  _usernameController.dispose();
  super.dispose();
}
```

`TextEditingController`는 화면이 사라질 때 정리해 주는 것이 좋다.

```dart
_usernameController.dispose();
```

사용이 끝난 컨트롤러가 메모리에 계속 남는 것을 방지한다.

```dart
super.dispose();
```

부모 클래스의 종료 작업도 실행한다.

---

## 18. 전체 실행 과정

```text
앱 실행
↓
initState() 실행
↓
_getUsername() 호출
↓
SharedPreferences 객체 가져오기
↓
currentUsername 키로 저장된 값 확인
↓
저장된 값이 있으면 _username에 저장
↓
화면에 현재 사용자 이름 출력
↓
사용자가 TextField에 이름 입력
↓
저장 버튼 클릭
↓
_saveUsername() 실행
↓
입력값을 SharedPreferences에 저장
↓
setState() 실행
↓
화면에 새로운 사용자 이름 출력
```

---

## 19. 실습 중 발생한 오류

### setState 문법 오류

잘못된 코드:

```dart
setState() {
  _username = _usernameController.text;
}
```

`setState()` 안에는 콜백 함수를 전달해야 한다.

정상 코드:

```dart
setState(() {
  _username = _usernameController.text;
});
```

### EdgeInsetsGeometry 오류

잘못된 코드:

```dart
EdgeInsetsGeometry.all(15)
```

정상 코드:

```dart
EdgeInsets.all(15)
```

### SharedPreferences 초기화

`late`로 선언한 `_prefs`는 사용하기 전에 반드시 초기화해야 한다.

```dart
_prefs = await SharedPreferences.getInstance();
```

초기화하지 않은 상태에서 사용하면 `LateInitializationError`가 발생할 수 있다.

---

## 오늘 배운 내용 정리

이번 실습에서는 `SharedPreferences`를 사용해 간단한 문자열 데이터를 기기에 저장하고 불러오는 방법을 배웠다.

`TextEditingController`로 사용자가 입력한 이름을 가져오고, `setString()`으로 이름을 저장했다. 앱이 실행될 때는 `initState()`에서 저장된 이름을 불러오고, `getString()`으로 값을 가져왔다.

또한 `setState()`를 사용해 사용자 이름이 변경되었을 때 화면을 다시 그리는 방법과 `??` 연산자를 사용해 저장된 값이 없을 때 `null`을 처리하는 방법을 배웠다.
