import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:help_lawyer/constants.dart';
import 'package:help_lawyer/views/home/add_task_bottom_sheet.dart';
import 'package:help_lawyer/views/home/home_view.dart';
import 'package:help_lawyer/views/lawyer_name/name_of_lawyer_view.dart';
import 'package:help_lawyer/views/on_boarding/onboarding.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> navigatorState =
      GlobalKey<NavigatorState>();
  static String homeView = '/homeView';
  static String lawyerName = '/lawyerName';
  static String addTask = '/addTask';
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
          path: '/',
          builder: (context, state) {
            if (name != null && name!.isNotEmpty) {
              return const HomeView();
            }
            return const OnBoardingScreen();
          }),
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
      GoRoute(
        path: addTask,
        builder: (context, GoRouterState state) {
          return const AddTaskBottomSheet();
        },
      )
    ],
  );
}
