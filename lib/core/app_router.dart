import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:help_lawyer/views/home/home_view.dart';
import 'package:help_lawyer/views/lawyer_name/name_of_lawyer_view.dart';
import 'package:help_lawyer/views/on_boarding/onboarding.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> navigatorState = GlobalKey<NavigatorState>();
  static String homeView = '/homeView';
  static String lawyerName = '/lawyerName';
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, GoRouterState state) {
          return const OnBoardingScreen();
        },
      ),
      GoRoute(
        path: lawyerName,
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
