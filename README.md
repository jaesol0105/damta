<h1 align="center">
Damso Time
</h1>
<p align="center">
  <img alt="mockup" src="./assets/readme_mockup.gif"/>
</p>

<br/>

## 🔖 프로젝트 개요
### “Damso Time(담타)" 는 중고등학생을 위한 익명 SNS 커뮤니티 앱 입니다.

#### "Damso Time(담타)" 는 다음과 같은 분들을 위해 탄생되었습니다.

> 학교를 지정하여 자신과 같은 학교 친구들과 자유롭게 소통하고 싶은 분
> 

> 학교 생활과 관련된 정보를 편리하게 확인하고 싶은 분
> 

> 익명 게시글, 댓글, 반응을 통해 즐거운 소통을 원하시는 분
> 

<br/>     

## 🎨 앱 디자인 설계
<p align="center">
  <img alt="design" src="./assets/readme_design.webp"/>
</p>

<br/>

## 📌 주요 기능
1. 학교 지정 및 정보 제공
- 사용자가 다니는 학교 선택
- 시간표 확인: 지정한 날짜와 반의 수업 시간표 확인
- 학사일정 확인: 월별 시험, 공휴일 등 주요 일정 조회
- 급식정보 확인: 지정한 날의 급식 메뉴 확인

2. 익명 SNS 커뮤니티
- 게시글 작성 및 댓글 작성
- 익명으로 소통하여 학생들의 자유로운 의견 공유 가능
- 다양한 이모지로 게시글에 반응을 남기는 기능

3. 사용자 편의 기능
- 간편한 로그인 및 회원가입
- 알림 기능으로 내 게시글의 댓글, 반응 손쉽게 확인 

<br/>

## 🛠️ 기술 스택

| 구분                          | 사용 기술                      |
| --------------------------- | -------------------------- |
| Flutter                     | 크로스플랫폼 앱 프레임워크             |
| Dart                        | 프로그래밍 언어                   |
| Material                    | UI 디자인 시스템                 |
| Cupertino                   | iOS 스타일 UI 구성 요소           |
| GoRouter                    | 선언적 라우팅                    |
| RiverPod                    | 상태 관리 (Notifier, Provider) |
| Firebase Core               | Firebase 플랫폼 기반            |
| Firestore                   | NoSQL 실시간 데이터베이스           |
| Firebase Auth               | 인증 기능                      |
| Firebase Messaging          | 푸시 알림                      |
| Cloud Functions             | 서버리스 함수                    |
| Flutter Local Notifications | 로컬 알림 표시                   |
| Clean Architecture          | 의존성 역전, 도메인 중심 설계          |
| Dio                         | HTTP 클라이언트                 |
| Geolocator                  | 위치 정보                      |
| Sqflite & Path              | 로컬 DB 관리                   |
| Intl                        | 날짜, 시간, 지역화 처리             |
| Shimmer                     | 로딩 UI 효과                   |
| Kakao Flutter SDK           | 카카오 로그인/소셜 연동              |


<br/>

## 📖 라이브러리

### Firebase / Backend 관련
- firebase_core: ^4.2.1
- cloud_firestore: ^6.1.0
- firebase_auth: ^6.1.2
- firebase_messaging: ^16.0.4
- cloud_functions: ^6.0.4
- flutter_local_notifications: ^19.5.0
### State Management / Architecture
- freezed_annotation: ^3.1.0
- flutter_hooks: ^0.21.3+1
- hooks_riverpod: ^3.0.3
- riverpod_annotation: ^3.0.3
- flutter_riverpod: ^3.0.3
- build_runner: ^2.7.1
- freezed: ^3.2.3
- json_annotation: ^4.9.0
- json_serializable: ^6.11.2
- riverpod_generator: ^3.0.3
### Routing / UI / Utilities
- go_router: ^17.0.0
- cupertino_icons: ^1.0.8
- shimmer: ^3.0.0
- dio: ^5.9.0
- geolocator: ^14.0.2
- intl: ^0.20.2
- kakao_flutter_sdk_user: ^1.10.0
- sqflite: ^2.4.2
- path: ^1.9.1

<br/>

## 📂 프로젝트 구조
<pre>
lib/
 ㄴ main                               
 ㄴ core/
     ㄴ config/   
     ㄴ di/               
     ㄴ services/               
     ㄴ theme/                                  
 ㄴ data/
     ㄴ data_source/      
         ㄴ local/
         ㄴ remote/                 
     ㄴ data_source_impl/  
         ㄴ local/
         ㄴ remote/   
     ㄴ database/         
     ㄴ dto/           
         ㄴ local_cache_dto/               
     ㄴ mapper/                        
     ㄴ repository_impl/   
     ㄴ util/     
         ㄴ extension/       
 ㄴ domain/
     ㄴ entity/   
     ㄴ enum/                    
     ㄴ repository/                   
     ㄴ usecase/                        
 ㄴ presentation/
     ㄴ core/util/                      
     ㄴ view_model/                  
     ㄴ view/                          
         ㄴ pages/
             ㄴ home/   
             ㄴ login/            
             ㄴ meal/               
             ㄴ notification/           
             ㄴ post/
             ㄴ post_detail/
             ㄴ schedule/
             ㄴ school/
             ㄴ splash/
             ㄴ time_table/
             ㄴ write_post/
         ㄴ widgets/ 
             
test/      
assets/     
README.md  
</pre>

<br/>

## 📝 커밋 컨벤션

- feat: 새로운 기능 추가
- fix: 버그 수정
- docs: 문서 수정
- style: 코드 포맷팅, 세미콜론 누락 등
- refactor: 코드 리팩터링
- design: 사용자 UI 디자인 변경
- test: 테스트 코드 추가
- chore: 빌드, 패키지 매니저 등 환경 설정
