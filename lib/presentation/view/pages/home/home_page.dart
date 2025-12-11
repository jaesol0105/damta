import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:damta/core/config/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:damta/presentation/view/pages/home/widgets/weather_bar.dart';
import 'package:damta/presentation/view/pages/home/widgets/noti_button.dart';

class UserProfile {
  final String schoolName;

  UserProfile({required this.schoolName});

  factory UserProfile.fromFirestore(Map<String, dynamic> data) {
    // 'schoolName' 필드가 없거나 null이면 기본값
    final schoolName = data['schoolName'] as String? ?? '학교 미지정';

    return UserProfile(schoolName: schoolName);
  }
}

final userProfileProvider = StreamProvider<UserProfile>((ref) {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  final user = auth.currentUser;
  if (user == null) {
    return Stream.value(UserProfile(schoolName: '로그인 필요'));
  }

  final userDocRef = firestore.collection('users').doc(user.uid);

  return userDocRef.snapshots().map((snapshot) {
    if (!snapshot.exists || snapshot.data() == null) {
      return UserProfile(schoolName: '학교 미지정');
    }

    return UserProfile.fromFirestore(snapshot.data()!);
  });
});

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfileAsyncValue = ref.watch(userProfileProvider);

    final schoolName = userProfileAsyncValue.when(
      data: (profile) => profile.schoolName, // 데이터 로드 성공 시
      loading: () => '학교 이름 로딩 중...',
      error: (e, st) {
        // print('!!! 학교 프로필 로드 오류 !!!: $e'); // 주석 처리
        return '오류 발생'; // 오류 발생 시
      },
    );

    return Scaffold(
      // schoolName => AppBar에 전달
      appBar: _buildAppBar(context, schoolName),
      body: SafeArea(
        child: Column(
          children: [
            // 최상단에 날씨 위젯 호출
            const WeatherBar(),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, // 세로 중앙 정렬
                  children: [
                    const SizedBox(height: 120),
                    _buildServiceButtonsGrid(context),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context, String schoolName) {
    return AppBar(
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset("assets/images/logo.png", height: 28, width: 28),
          const SizedBox(width: 8),
          Text(
            schoolName,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ],
      ),
      centerTitle: false,
      actions: [
        // 노티 위젯 호출
        const NotiButton(),
        // 설정 아이콘(미구현)
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            // 설정 페이지로 이동 (미구현)
            context.go('/settings');
          },
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  // 버튼 2x2 그리드로
  Widget _buildServiceButtonsGrid(BuildContext context) {
    // 서비스 목록
    final services = [
      {'label': "익명 게시판", 'route': "/post"},
      {'label': "학사 일정", 'route': "/schedule"},
      {'label': "급식표", 'route': "/meal"},
      {'label': "시간표", 'route': "/timetable"},
    ];

    // 중앙 정렬
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // 첫 번째 줄 (익게, 학사 일정)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(child: _buildServiceButton(context, data: services[0])),
            const SizedBox(width: 20),
            Expanded(child: _buildServiceButton(context, data: services[1])),
          ],
        ),
        const SizedBox(height: 20),
        // 두 번째 줄 (급식표, 시간표)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(child: _buildServiceButton(context, data: services[2])),
            const SizedBox(width: 20),
            Expanded(child: _buildServiceButton(context, data: services[3])),
          ],
        ),
      ],
    );
  }

  // 에셋 이미지를 버튼 아이콘으로
  Widget _getAssetIconOrPlaceholder(String label) {
    String assetPath;

    switch (label) {
      case "익명 게시판":
        assetPath = 'assets/images/post.png';
        break;
      case "학사 일정":
        assetPath = 'assets/images/schedule.png';
        break;
      case "급식표":
        assetPath = 'assets/images/meal.png';
        break;
      case "시간표":
        assetPath = 'assets/images/time_table.png';
        break;
      default:
        return const Icon(
          // 주석처리 해도 됨
          Icons.menu_book,
          size: 55,
          color: Colors.grey,
        );
    }

    // Image.asset 위젯
    return Image.asset(
      assetPath,
      width: 75, // 아이콘 크기
      height: 75,
    );
  }

  Widget _buildServiceButton(
    BuildContext context, {
    required Map<String, String> data,
  }) {
    final label = data['label']!;
    final route = data['route']!;

    return InkWell(
      onTap: () => context.go(route),
      child: Material(
        elevation: 4.0,
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        shadowColor: Colors.blue.withOpacity(0.4), // 그림자 색상
        child: AspectRatio(
          aspectRatio: 1, // 정사각형 1ㄷ1
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              // 테두리 두께
              border: Border.all(color: Colors.blue.shade400, width: 5.0),
            ),
            // 아이콘, 텍스트 Column 중앙 배치
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _getAssetIconOrPlaceholder(label),
                const SizedBox(height: 30),
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold, // 텍스트
                    fontSize: 18,
                    color: Colors.blueGrey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
