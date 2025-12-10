import 'package:damta/presentation/view/pages/home/home_page.dart';
import 'package:damta/presentation/view/pages/login/login_page.dart';
import 'package:damta/presentation/view/pages/meal/meal_page.dart';
import 'package:damta/presentation/view/pages/post/post_page.dart';
import 'package:damta/presentation/view/pages/post_detail/post_detail_page.dart';
import 'package:damta/presentation/view/pages/schedule/schedule_page.dart';
import 'package:damta/presentation/view/pages/school/school_input_page.dart';
import 'package:damta/presentation/view/pages/splash/splash_page.dart';
import 'package:damta/presentation/view/pages/time_table/time_table_page.dart';
import 'package:damta/presentation/view/pages/write_post/write_post_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: "/post",

  routes: [
    GoRoute(path: "/", builder: (context, state) => const LoginPage()),

    GoRoute(path: "/splash", builder: (context, state) => const SplashPage()),

    GoRoute(
      path: "/school",
      builder: (context, state) {
        final String? kakaoId = state.extra as String?;

        if (kakaoId == null) {
          // 비정상 접근 방지 (로그인 페이지로 이동)
          return const LoginPage();
        }

        return SchoolInputPage(kakaoId: kakaoId);
      },
    ),

    GoRoute(path: "/home", builder: (context, state) => const HomePage()),
    GoRoute(
      path: "/post",
      builder: (context, state) => PostPage(),
      routes: [
        GoRoute(
          path: ":id",
          builder: (context, state) {
            final String? pId = state.pathParameters['id'];
            if (pId == null) {
              // 예외처리: id 파라미터가 없을 경우
              return HomePage();
            }
            return PostDetailPage(pId: pId);
          },
        ),
      ],
    ),
    GoRoute(path: "/notification", builder: (context, state) => HomePage()),
    GoRoute(path: "/writepost", builder: (context, state) => WritePostPage()),
    GoRoute(path: "/timetable", builder: (context, state) => TimeTablePage()),
    GoRoute(path: "/meal", builder: (context, state) => MealPage()),
    GoRoute(path: "/schedule", builder: (context, state) => SchedulePage()),
    GoRoute(path: "/melon", builder: (context, state) => HomePage()),
  ],
);
