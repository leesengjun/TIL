# 📱 Flutter Basic Navigation Demo

이 프로젝트는 Flutter에서 화면 간 이동(Navigation)을 구현하는 가장 기초적이고 핵심적인 방법을 다루는 데모 애플리케이션입니다. `Navigator.push`와 `Navigator.pop`을 활용한 **스택(Stack) 기반의 화면 전환 메커니즘**을 이해하기 쉽게 구현했습니다.

---

## 🚀 주요 기능 및 핵심 개념

* **화면 전환 (Push):** 첫 번째 화면(`MyHomepage`)에서 버튼을 누르면 `MaterialPageRoute`를 통해 두 번째 화면(`SecondView`)이 부드러운 애니메이션과 함께 위에 쌓입니다.
* **이전 화면 복귀 (Pop):** 두 번째 화면의 상단 앱바(AppBar) 좌측에 위치한 뒤로 가기 버튼을 누르면 현재 화면이 제거되며 이전 화면으로 돌아갑니다.
* **제스처 감지:** 일반 위젯(`Container`)에 `GestureDetector`를 결합하여 터치 이벤트를 처리합니다.
