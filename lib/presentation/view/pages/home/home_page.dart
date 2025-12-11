import 'package:damta/core/config/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final userProfileAsyncValue = ref.watch(userProfileProvider);
    // final schoolName = userProfileAsyncValue.when(
    //   data: (profile) => profile.schoolName,
    //   loading: () => '학교 이름 로딩 중...',
    //   error: (e, st) => '오류 발생',
    // );
    return Scaffold(
      // appBar: _buildAppBar(context, schoolName),
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildWeatherWidgetPlaceholder(),
            const SizedBox(height: 20),
            _buildBulletinBoardPreview(context),
            const SizedBox(height: 30),
            _buildNavigationButtons(context),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context, String schoolName) {
    return AppBar(
      // 학교 이름을 왼쪽에 배치
      title: Text(
        schoolName,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      centerTitle: false,
      actions: [
        // 알림 아이콘
        IconButton(
          icon: const Icon(Icons.notifications_none),
          onPressed: () {
            // 알림 페이지로 이동
            context.push('/notification');
          },
        ),
        // 설정 아이콘
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            // 설정 페이지로 이동 (현재는 /home으로 임시 이동)
            context.push('/home');
          },
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  // 날씨 위젯 Placeholder
  Widget _buildWeatherWidgetPlaceholder() {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.blue.shade200),
      ),
      alignment: Alignment.center,
      child: const Text(
        '날씨 위젯 배치 공간 (데이터 연동 예정)',
        style: TextStyle(
          color: Colors.blueGrey,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // 익명 게시판 미리보기
  Widget _buildBulletinBoardPreview(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '우리 학교 익명 게시판',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () => context.push('/post'),
              child: const Text('더보기 >'),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '** 여기에 Firestore DB에서 실시간 최신글 3개가 스트림으로 표시됩니다. **',
                style: TextStyle(color: Colors.red),
              ),
              const Divider(height: 20, color: Colors.grey),
              _buildPostItem(title: '익명글 제목 1', content: '게시글 내용 미리보기...'),
              _buildPostItem(title: '익명글 제목 2', content: '또 다른 게시글 내용...'),
              _buildPostItem(title: '익명글 제목 3', content: '세 번째 게시글 내용...'),
              /*
              StreamBuilder<List<Post>>(
                stream: ref.watch(postStreamProvider),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return const Text('게시글 로딩 오류');
                  }
                  final posts = snapshot.data ?? [];
                  if (posts.isEmpty) {
                    return const Text('아직 게시글이 없습니다. 첫 글을 작성해보세요!');
                  }
                  return Column(
                    children: posts.take(3).map((post) => _buildPostItem(
                      title: post.title,
                      content: post.content,
                      onTap: () => context.go('/post/${post.id}'),
                    )).toList(),
                  );
                },
              )
              */
            ],
          ),
          // ----------------------------------------------------
        ),
      ],
    );
  }

  // 게시글 미리보기 단일 항목 위젯
  Widget _buildPostItem({
    required String title,
    required String content,
    VoidCallback? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: GestureDetector(
        onTap: onTap ?? () => {}, // /post 라우트로 이동
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w600),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              content,
              style: const TextStyle(color: Colors.grey, fontSize: 13),
              overflow: TextOverflow.ellipsis,
            ),
            const Divider(height: 10),
          ],
        ),
      ),
    );
  }

  // 네비게이션 버튼 (급식, 시간표, 학사일정)
  Widget _buildNavigationButtons(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '주요 서비스',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildServiceButton(
              context,
              iconPath: "assets/images/meal.png", // 급식표 에셋 이미지
              label: "급식표",
              route: "/meal",
            ),
            _buildServiceButton(
              context,
              iconPath: "assets/images/timetable.png", // 시간표 에셋 이미지
              label: "시간표",
              route: "/timetable",
            ),
            _buildServiceButton(
              context,
              iconPath: "assets/images/schedule.png", // 학사일정 에셋 이미지
              label: "학사일정",
              route: "/schedule",
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildServiceButton(
    BuildContext context, {
    required String iconPath,
    required String label,
    required String route,
  }) {
    return Column(
      children: [
        InkWell(
          onTap: () => context.push(route),
          child: Container(
            width: 80,
            height: 80,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(
              _getIconForLabel(label),
              size: 40,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
      ],
    );
  }

  IconData _getIconForLabel(String label) {
    switch (label) {
      case "급식표":
        return Icons.restaurant_menu;
      case "시간표":
        return Icons.schedule;
      case "학사일정":
        return Icons.calendar_month;
      default:
        return Icons.menu_book;
    }
  }
}
