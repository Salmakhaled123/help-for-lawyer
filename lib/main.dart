import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_lawyer/core/app_router.dart';
import 'package:help_lawyer/features/take_name_of_lawyer/presentation/view_model/lawyer_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LawyerCubit(),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp.router(
            theme: ThemeData(primarySwatch: Colors.purple),
            routerConfig: AppRouter.router,
            debugShowCheckedModeBanner: false,
            title: 'Lawyer Companion',
          );
        },
      ),
    );
  }
}
