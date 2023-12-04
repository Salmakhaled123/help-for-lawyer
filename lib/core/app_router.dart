import 'package:go_router/go_router.dart';
import 'package:help_lawyer/features/home/presentation/view/home_view.dart';

import '../features/take_name_of_lawyer/presentation/views/name_of_lawyer_view.dart';

class AppRouter {
  static String homeView = '/homeView';
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, GoRouterState state) {
          return const TakeNameOfLawyerView();
        },
      ),
      GoRoute(
        path: homeView,
        builder: (context, GoRouterState state) {
          return const HomeView();
        },
      ),
    ],
  );
}
