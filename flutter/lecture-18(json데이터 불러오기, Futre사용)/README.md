# Flutter JSON 데이터 불러오기

## 오늘 배운 내용

오늘은 Flutter 프로젝트 내부에 있는 JSON 파일을 불러와 사용자 목록을 화면에 출력하는 방법을 배웠다.

주요 학습 내용은 다음과 같다.

- JSON 파일 작성하기
- `pubspec.yaml`에 assets 등록하기
- `rootBundle.loadString()`으로 파일 읽기
- `jsonDecode()`로 JSON 데이터 변환하기
- `FutureBuilder`로 비동기 데이터 처리하기
- `ListView.builder`로 목록 출력하기

---

## 1. JSON이란?

JSON은 데이터를 저장하거나 전달할 때 사용하는 형식이다.

키와 값으로 데이터를 표현하며, Flutter에서는 서버 응답이나 로컬 파일 데이터를 다룰 때 자주 사용한다.

이번에 사용한 `users.json` 파일은 다음과 같다.

```json
{
  "users": [
    {
      "id": 1,
      "username": "Anna",
      "email": "anna@gmail.com"
    },
    {
      "id": 2,
      "username": "Daniel",
      "email": "daniel@gmail.com"
    },
    {
      "id": 3,
      "username": "Esther",
      "email": "esther@gmail.com"
    },
    {
      "id": 4,
      "username": "Wendy",
      "email": "wendy@gmail.com"
    },
    {
      "id": 5,
      "username": "Paul",
      "email": "paul@gmail.com"
    }
  ]
}
```

`users`라는 키 안에 여러 명의 사용자 데이터가 배열 형태로 들어 있다.

각 사용자는 다음 정보를 가지고 있다.

- `id`: 사용자의 번호
- `username`: 사용자의 이름
- `email`: 사용자의 이메일

---

## 2. 프로젝트 구조

이번 프로젝트에서는 JSON 파일을 다음 위치에 저장했다.

```text
my_first_app/
├─ lib/
│  ├─ assets/
│  │  └─ users.json
│  └─ main.dart
└─ pubspec.yaml
```

JSON 파일의 실제 경로는 다음과 같다.

```text
lib/assets/users.json
```

파일 경로는 `pubspec.yaml`과 Dart 코드에서 똑같이 작성해야 한다.

---

## 3. pubspec.yaml에 JSON 파일 등록하기

Flutter에서 이미지나 JSON 같은 프로젝트 내부 파일을 사용하려면 `pubspec.yaml`의 `assets`에 등록해야 한다.

```yaml
flutter:
  uses-material-design: true

  assets:
    - lib/assets/users.json
```

### 주의할 점

YAML 파일은 들여쓰기가 매우 중요하다.

`assets:`는 `flutter:` 안에 포함되어야 하므로 공백 두 칸을 사용한다.

```yaml
flutter:
  assets:
    - lib/assets/users.json
```

파일 경로가 실제 위치와 다르면 다음과 같은 오류가 발생한다.

```text
No file or variants found for asset
```

이 오류가 발생하면 다음 내용을 확인해야 한다.

1. JSON 파일이 실제 경로에 존재하는지 확인한다.
2. 파일 이름이 `users.json`으로 정확한지 확인한다.
3. `pubspec.yaml`의 경로가 올바른지 확인한다.
4. 파일을 저장했는지 확인한다.

---

## 4. 필요한 패키지 불러오기

```dart
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
```

### `dart:convert`

JSON 문자열을 Dart에서 사용할 수 있는 데이터로 변환하기 위해 사용한다.

```dart
import 'dart:convert';
```

주로 다음 함수를 사용한다.

```dart
jsonDecode(response);
```

### `flutter/services.dart`

Flutter 프로젝트 내부에 등록된 파일을 불러오기 위해 사용한다.

```dart
import 'package:flutter/services.dart';
```

이 패키지에 포함된 `rootBundle`을 사용해 JSON 파일을 읽을 수 있다.

---

## 5. JSON 파일 불러오기

```dart
static Future loadJson() async {
  final String response = await rootBundle.loadString(
    'lib/assets/users.json',
  );

  final data = jsonDecode(response);

  return data['users'];
}
```

### `Future`

파일을 불러오는 작업은 바로 끝나지 않을 수 있다.

따라서 작업이 완료된 후 결과를 전달하는 `Future`를 사용한다.

```dart
static Future loadJson()
```

`Future`는 미래에 결과가 전달된다는 의미이다.

---

### `async`

함수 안에서 비동기 작업을 사용한다는 것을 나타낸다.

```dart
static Future loadJson() async
```

`async`가 붙은 함수 안에서는 `await`를 사용할 수 있다.

---

### `await`

비동기 작업이 끝날 때까지 기다린 후 다음 코드를 실행한다.

```dart
final String response = await rootBundle.loadString(
  'lib/assets/users.json',
);
```

JSON 파일을 모두 읽을 때까지 기다린 후 파일 내용을 `response`에 저장한다.

---

### `rootBundle.loadString()`

Flutter 프로젝트 내부에 등록된 파일을 문자열로 불러온다.

```dart
rootBundle.loadString('lib/assets/users.json');
```

`users.json` 파일의 내용이 문자열 형태로 반환된다.

예를 들어 JSON 파일을 불러와도 처음에는 다음과 같은 문자열 상태이다.

```text
{"users":[{"id":1,"username":"Anna"}]}
```

이 문자열은 바로 리스트처럼 사용할 수 없기 때문에 `jsonDecode()`가 필요하다.

---

## 6. JSON 문자열 변환하기

```dart
final data = jsonDecode(response);
```

`jsonDecode()`는 JSON 형식의 문자열을 Dart에서 사용할 수 있는 데이터로 변환한다.

JSON 객체는 Dart의 `Map` 형태로 변환되고, JSON 배열은 Dart의 `List` 형태로 변환된다.

```json
{
  "users": []
}
```

위 JSON 구조는 Dart에서 다음과 비슷한 형태가 된다.

```dart
Map<String, dynamic>
```

`users` 안의 배열은 다음 형태가 된다.

```dart
List<dynamic>
```

사용자 목록만 반환하기 위해 다음 코드를 사용했다.

```dart
return data['users'];
```

---

## 7. JSON 데이터를 저장할 Future 만들기

```dart
Future userList = loadJson();
```

`loadJson()` 함수를 실행한 결과를 `userList` 변수에 저장한다.

아직 파일 읽기가 완료되지 않았기 때문에 실제 사용자 목록이 아니라 `Future`가 저장된다.

이 `Future`의 상태를 확인하고 화면에 표시하기 위해 `FutureBuilder`를 사용한다.

---

## 8. FutureBuilder

```dart
FutureBuilder(
  future: userList,
  builder: (context, snapshot) {
    // 상태에 따른 화면 작성
  },
)
```

`FutureBuilder`는 비동기 작업의 상태에 따라 다른 화면을 보여주는 위젯이다.

예를 들어 JSON 파일을 불러오는 동안에는 로딩 화면을 보여주고, 데이터가 준비되면 사용자 목록을 보여줄 수 있다.

### `future`

어떤 비동기 작업을 기다릴 것인지 설정한다.

```dart
future: userList,
```

### `builder`

비동기 작업의 현재 상태에 맞는 위젯을 반환한다.

```dart
builder: (context, snapshot) {
  // 위젯 반환
}
```

`snapshot`에는 비동기 작업의 데이터와 상태가 들어 있다.

---

## 9. snapshot.hasData

```dart
if (snapshot.hasData) {
  // 데이터를 불러오는 데 성공했을 때
}
```

`snapshot.hasData`는 데이터가 정상적으로 준비되었는지 확인한다.

데이터가 있다면 `snapshot.data`를 통해 JSON 사용자 목록에 접근할 수 있다.

```dart
snapshot.data
```

사용자 한 명의 정보는 다음과 같이 가져올 수 있다.

```dart
snapshot.data[index]['id']
snapshot.data[index]['username']
snapshot.data[index]['email']
```

---

## 10. snapshot.hasError

```dart
else if (snapshot.hasError) {
  return const Center(
    child: Text('error'),
  );
}
```

JSON 파일을 찾을 수 없거나 데이터를 읽는 과정에서 문제가 발생하면 오류 화면을 보여준다.

오류가 발생하는 대표적인 원인은 다음과 같다.

- JSON 파일 경로가 잘못된 경우
- `pubspec.yaml`에 assets가 등록되지 않은 경우
- JSON 문법이 잘못된 경우
- 파일 이름이 다른 경우

---

## 11. CircularProgressIndicator

```dart
return const Center(
  child: CircularProgressIndicator(
    strokeWidth: 2,
  ),
);
```

데이터를 불러오는 동안 원형 로딩 표시를 보여준다.

`strokeWidth`는 로딩 원의 선 두께를 설정한다.

```dart
strokeWidth: 2
```

`FutureBuilder`의 상태를 정리하면 다음과 같다.

| 상태 | 화면 |
|---|---|
| 데이터를 기다리는 중 | `CircularProgressIndicator` |
| 데이터 불러오기 성공 | 사용자 목록 |
| 데이터 불러오기 실패 | 오류 문구 |

---

## 12. ListView.builder

```dart
ListView.builder(
  itemCount: snapshot.data.length,
  itemBuilder: (context, index) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Text(
        '${snapshot.data[index]['id']}: '
        '${snapshot.data[index]['username']}',
      ),
    );
  },
)
```

`ListView.builder`는 데이터 개수에 맞게 목록을 자동으로 만들어 주는 위젯이다.

사용자가 5명이면 아이템을 5개 만들고, 사용자가 100명이면 아이템을 100개 만든다.

---

### `itemCount`

목록에 표시할 아이템 개수를 설정한다.

```dart
itemCount: snapshot.data.length,
```

`snapshot.data.length`는 JSON에 들어 있는 사용자 수이다.

현재 JSON에는 사용자가 5명 있으므로 아이템도 5개 생성된다.

---

### `itemBuilder`

각 목록 아이템의 화면을 만든다.

```dart
itemBuilder: (context, index) {
  // 각 아이템 반환
}
```

`index`는 현재 몇 번째 사용자 데이터를 출력하고 있는지를 나타낸다.

첫 번째 아이템은 `index`가 0이고, 두 번째 아이템은 `index`가 1이다.

```dart
snapshot.data[index]
```

현재 순서에 맞는 사용자 한 명의 데이터를 가져온다.

---

## 13. 문자열 보간법

```dart
'${snapshot.data[index]['id']}: ${snapshot.data[index]['username']}'
```

문자열 안에 변수나 값을 넣기 위해 `${}`를 사용한다.

예를 들어 첫 번째 사용자 데이터가 다음과 같다면

```json
{
  "id": 1,
  "username": "Anna"
}
```

화면에는 다음과 같이 출력된다.

```text
1: Anna
```

---

## 14. 전체 코드

```dart
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  static Future loadJson() async {
    final String response = await rootBundle.loadString(
      'lib/assets/users.json',
    );

    final data = jsonDecode(response);

    return data['users'];
  }

  Future userList = loadJson();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Title'),
      ),
      body: FutureBuilder(
        future: userList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    '${snapshot.data[index]['id']}: '
                    '${snapshot.data[index]['username']}',
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('error'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          }
        },
      ),
    );
  }
}
```

---

## 15. 코드 실행 순서

프로그램은 다음 순서로 실행된다.

```text
앱 실행
  ↓
loadJson() 호출
  ↓
rootBundle.loadString()으로 users.json 읽기
  ↓
jsonDecode()로 JSON 문자열 변환
  ↓
users 배열 반환
  ↓
FutureBuilder가 데이터 상태 확인
  ↓
데이터가 준비되면 ListView.builder 실행
  ↓
사용자 목록 화면에 출력
```

화면에는 다음과 같은 내용이 표시된다.

```text
1: Anna
2: Daniel
3: Esther
4: Wendy
5: Paul
```

---

## 16. 오류 해결 과정

처음에는 `pubspec.yaml`에 다음과 같이 작성했다.

```yaml
assets:
  - lib/users.json
```

하지만 실제 JSON 파일은 다음 위치에 있었다.

```text
lib/assets/users.json
```

파일의 실제 위치와 등록한 경로가 달라서 오류가 발생했다.

다음과 같이 실제 경로에 맞게 수정하여 해결했다.

```yaml
assets:
  - lib/assets/users.json
```

Dart 코드에서도 같은 경로를 사용했다.

```dart
rootBundle.loadString('lib/assets/users.json');
```

이를 통해 assets 파일을 사용할 때는 실제 파일 위치와 등록 경로를 정확히 맞춰야 한다는 것을 알게 되었다.

---

## 오늘 배운 내용 정리

이번 실습에서는 프로젝트 내부의 JSON 파일을 불러와 화면에 출력하는 방법을 배웠다.

`rootBundle.loadString()`으로 JSON 파일을 문자열로 읽고, `jsonDecode()`로 Dart에서 사용할 수 있는 데이터로 변환했다.

또한 `FutureBuilder`를 사용해 로딩, 성공, 오류 상태를 구분하고, `ListView.builder`를 이용해 사용자 데이터를 목록 형태로 출력했다.

JSON 파일을 사용할 때는 파일의 실제 위치와 `pubspec.yaml`, Dart 코드의 경로를 모두 동일하게 작성해야 한다.
