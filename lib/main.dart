import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_lawyer/constants.dart';
import 'package:help_lawyer/core/app_router.dart';
import 'package:help_lawyer/cubits/bloc_observer.dart';
import 'package:help_lawyer/cubits/home_cubit/home_cubit.dart';
import 'package:help_lawyer/cubits/lawyer_name/lawyer_cubit.dart';
import 'package:help_lawyer/cubits/on_boarding/onboarding_cubit.dart';
import 'package:help_lawyer/cubits/task_cubit/task_cubit.dart';
import 'package:help_lawyer/models/task_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>(kTasksBox);
  await Hive.openBox<String>(nameBox);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LawyerCubit()),
        BlocProvider(create: (context) => OnboardingCubit()),
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => TaskCubit()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp.router(
            theme: ThemeData(
                useMaterial3: false, primarySwatch: Colors.deepPurple),
            routerConfig: AppRouter.router,
            debugShowCheckedModeBanner: false,
            title: 'Lawyer Companion',
          );
        },
      ),
    );
  }
}
