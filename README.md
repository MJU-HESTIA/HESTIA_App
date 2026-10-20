# HESTIA_App — 스마트홈 제어 Flutter 앱 UI

HESTIA 사용자용 모바일 앱의 **UI 화면** 저장소입니다(Flutter). 로그인, 홈(즐겨찾기), IoT 가전 on/off 화면(조명·선풍기·에어컨·공기청정기·TV), 대화 기록, 설정·FAQ 화면으로 구성됩니다.

> **English summary** — Flutter UI mock-up for the HESTIA companion app: login, home with favourites, IoT on/off screens (light, fan, air conditioner, air purifier, TV), conversation history, settings and FAQ. Screens are static UI; there is no backend / device connection in this repository.

## 현재 상태
- 화면 전환 중심의 **UI 구현**이며, Jetson(HESTIA_SW)·ESP32와의 통신 코드는 없습니다.
- 로그인 화면의 사용자 목록은 예시 데이터입니다.

## 화면 (`lib/pages/`)
| 분류 | 파일 |
|---|---|
| 시작/로그인 | `intro.dart`, `login.dart`, `new_user_login.dart`, `new_user_in.dart`, `ex_user_one/two/three.dart`, `logout.dart` |
| 홈 | `home.dart`, `home_bookmark.dart`, `home_bookmark_done.dart` |
| 가전 제어 | `iot.dart`, `light_on/off.dart`, `fan_on/off.dart`, `aircon_on/off.dart`, `airclean_on/off.dart`, `tv.dart` |
| 기타 | `conversation.dart`, `setting.dart`, `edit_profile.dart`, `faq.dart` |

## 실행
```bash
flutter pub get      # SDK >= 3.3.3
flutter run
```
의존성: `google_fonts`, `flutter_svg`.

## My role
<!-- 앱 UI 기여 범위 확인 후 작성 예정 (전체 시스템 통합: 이승석 — HESTIA_SW 참고) -->
