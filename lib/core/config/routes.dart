import 'package:damta/presentation/view/pages/home/home_page.dart';
import 'package:damta/presentation/view/pages/meal/meal_page.dart';
import 'package:damta/presentation/view/pages/post/post_page.dart';
import 'package:damta/presentation/view/pages/post_detail/post_detail_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: "/", builder: (context, state) => MealPage()),
    GoRoute(
      path: "/post",
      builder: (context, state) => PostPage(),
      routes: [
        GoRoute(
          path: ":id",
          builder: (context, state) {
            final String id = state.pathParameters['id']!;
            return PostDetailPage(id: id);
          },
        ),
      ],
    ),
    GoRoute(path: "/splash", builder: (context, state) => HomePage()),
    GoRoute(path: "/school", builder: (context, state) => HomePage()),
    GoRoute(path: "/notification", builder: (context, state) => HomePage()),
    GoRoute(path: "/write", builder: (context, state) => HomePage()),
    GoRoute(path: "/table", builder: (context, state) => HomePage()),
    GoRoute(path: "/lunch", builder: (context, state) => HomePage()),
    GoRoute(path: "/calendar", builder: (context, state) => HomePage()),
    GoRoute(path: "/melon", builder: (context, state) => HomePage()),
  ],
);
