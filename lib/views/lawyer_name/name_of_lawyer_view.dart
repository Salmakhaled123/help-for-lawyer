import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:help_lawyer/constants.dart';
import 'package:help_lawyer/core/app_router.dart';
import 'package:help_lawyer/cubits/lawyer_name/lawyer_cubit.dart';
import 'package:help_lawyer/views/lawyer_name/widgets/custom_button.dart';
import 'package:help_lawyer/views/lawyer_name/widgets/custom_text_form_field.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TakeNameOfLawyerView extends StatelessWidget {
  const TakeNameOfLawyerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
          title: const Text(
            'Lawyer Companion',
            style: TextStyle(color: Colors.white),
          )),
      body: BlocBuilder<LawyerCubit, LawyerState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<LawyerCubit>(context);

          return Form(
            key: cubit.formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextFormField(
                        controller: cubit.nameController,
                        hintText: 'enter the lawyer name',
                        onChanged: (value) async {},
                        prefix: Icons.person,
                        obscureText: false,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'please enter your name';
                          }
                          return null;
                        },
                        type: TextInputType.name),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomButton(
                        text: 'Start',
                        onPressed: () {
                          if (cubit.formKey.currentState!.validate()) {
                            Box box = Hive.box<String>(nameBox);
                            box.put('lawyerName', cubit.nameController.text);
                            log(box.get('lawyerName'));
                            GoRouter.of(context)
                                .pushReplacement(AppRouter.homeView);
                          }
                        })
                  ]),
            ),
          );
        },
      ),
    );
  }
}
