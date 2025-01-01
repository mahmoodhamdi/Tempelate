import 'package:go_router/go_router.dart';

class AppRoutes {
  static const String home = '/';
  static const String profile = '/profile/:id';

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: home,
        //  builder: (context, state) => HomeScreen(),
      ),
      // GoRoute(
      //   path: profile,
      //   builder: (context, state) {
      //     final id = state.pathParameters['id'];
      //       return ProfileScreen(id: id!);
      //   },
      // ),
    ],
  );
}
