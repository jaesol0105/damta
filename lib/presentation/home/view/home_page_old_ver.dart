import 'package:damta/core/theme/app_theme.dart';
import 'package:damta/presentation/home/provider/user_profile_provider.dart';
import 'package:damta/presentation/home/view/edit_animated_card.dart';
import 'package:damta/presentation/home/view/home_app_bar.dart';
import 'package:damta/presentation/home/view/module_builder.dart';
import 'package:damta/presentation/home/view/widgets/noti_button.dart';
import 'package:damta/presentation/home/view/widgets/weather_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reorderables/reorderables.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfileAsyncValue = ref.watch(userProfileProvider);

    final schoolName = userProfileAsyncValue.when(
      data: (profile) => profile.schoolName,
      loading: () => '학교 정보 로딩 중...',
      error: (e, st) {
        return '오류 발생';
      },
    );

    return Scaffold(
      appBar: _homeAppBar(context, schoolName),
      body: SafeArea(
        child: Column(
          children: [
            // 날씨 위젯
            const WeatherBar(),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, // 세로 중앙정렬
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

  /// 앱 바
  AppBar _homeAppBar(BuildContext context, String schoolName) {
    return AppBar(
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 로고
          Image.asset(
            "assets/images/app_logo_ver_2.png",
            height: 26,
            width: 26,
          ),
          const SizedBox(width: 12),
          // 학교 이름
          Text(
            schoolName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: vrc(context).labelText,
              fontSize: 18.5,
            ),
          ),
        ],
      ),
      centerTitle: false,
      actions: [
        // 알림 아이콘
        const NotiButton(),
        // 설정 아이콘
        IconButton(
          icon: HugeIcon(
            icon: HugeIcons.strokeRoundedSettings01,
            size: 24,
            color: vrc(context).labelText,
            strokeWidth: 2,
          ),
          onPressed: () {
            // TODO : 설정 페이지로 이동
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
    final extra = data['extra'];

    return InkWell(
      onTap: () => context.push(route, extra: extra),
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
                    fontSize: 16,
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
