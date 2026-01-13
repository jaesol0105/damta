import 'package:damta/domain/entity/post_entity.dart';
import 'package:damta/presentation/home/view/home_page.dart';
import 'package:damta/presentation/login/view/login_page.dart';
import 'package:damta/presentation/meal/view/meal_page.dart';
import 'package:damta/presentation/notification/view/notification_page.dart';
import 'package:damta/presentation/post/view/post_page.dart';
import 'package:damta/presentation/post_detail/view/post_detail_page.dart';
import 'package:damta/presentation/schedule/view/schedule_page.dart';
import 'package:damta/presentation/school/view/school_input_page.dart';
import 'package:damta/presentation/splash/view/splash_page.dart';
import 'package:damta/presentation/time_table/view/time_table_page.dart';
import 'package:damta/presentation/post_editor/view/post_editor_page.dart';
import 'package:go_router/go_router.dart';

class AppRoutePath {
  // 인증 / 초기
  static const login = '/';
  static const splash = '/splash';
  static const school = '/school';
  // 메인
  static const home = '/home';
  // 게시글
  static const post = '/post';
  static const postEditor = '/posteditor';
  // 알림
  static const notification = '/notification/:uId';
  // 시간표 급식 학사일정 등
  static const timetable = '/timetable';
  static const meal = '/meal';
  static const schedule = '/schedule';
  static const melon = '/melon';
}

final GoRouter router = GoRouter(
  initialLocation: AppRoutePath.splash,

  routes: [
    GoRoute(
      path: AppRoutePath.login,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: AppRoutePath.splash,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: AppRoutePath.school,
      builder: (context, state) {
        // 인자로 넘긴 kakaoId 값
        final String? kakaoId = state.extra as String?;
        if (kakaoId == null) {
          return const LoginPage();
        }
        return SchoolInputPage();
      },
    ),

    GoRoute(
      path: AppRoutePath.home,
      builder: (context, state) => const HomePage(),
    ),

    GoRoute(
      path: AppRoutePath.post,
      builder: (context, state) => PostPage(),
      routes: [
        GoRoute(
          path: ":id",
          builder: (context, state) {
            final String? pId = state.pathParameters['id'];
            if (pId == null) {
              return PostPage();
            }
            return PostDetailPage(pId: pId);
          },
        ),
      ],
    ),

    // 포스트 작성: extra 없이 push
    // 포스트 수정: PostEntity를 extra로 넘겨서 push
    GoRoute(
      path: AppRoutePath.postEditor,
      builder: (context, state) {
        final PostEntity initialPost =
            state.extra as PostEntity? ??
            PostEntity(
              uId: '',
              pTitle: '',
              pContent: '',
              pWriter: '',
              pCreatedAt: DateTime.now(),
            );

        return PostEditorPage(post: initialPost);
      },
    ),

    GoRoute(
      path: "/notification/:uId",
      builder: (context, state) {
        final uId = state.pathParameters['uId']!;
        return NotificationPage(uId: uId);
      },
    ),

    GoRoute(
      path: AppRoutePath.timetable,
      builder: (context, state) => TimeTablePage(),
    ),
    GoRoute(path: AppRoutePath.meal, builder: (context, state) => MealPage()),
    GoRoute(
      path: AppRoutePath.schedule,
      builder: (context, state) => SchedulePage(),
    ),
    GoRoute(path: AppRoutePath.melon, builder: (context, state) => HomePage()),
  ],
);
