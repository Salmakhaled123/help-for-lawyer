import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_lawyer/cubits/lawyer_name/lawyer_cubit.dart';
import 'package:help_lawyer/views/lawyer_name/custom_radio_button.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LawyerCubit, LawyerState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<LawyerCubit>(context);
        return Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                  accountName: Text(
                    cubit.nameController.text,
                    style: TextStyle(fontSize: 21.sp),
                  ),
                  accountEmail: Text(
                    'Lawyer',
                    style: TextStyle(fontSize: 18.sp),
                  )),
              ExpansionTile(
                leading: const Icon(Icons.language),
                title: const Text('Language'),
                children: [
                  CustomRadioButton(
                      text: 'Arabic',
                      onChanged: (value) {
                        cubit.isChecked(value!);
                      }),
                  CustomRadioButton(
                    text: 'English',
                    onChanged: (value) {
                      cubit.isChecked(value!);
                    },
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
