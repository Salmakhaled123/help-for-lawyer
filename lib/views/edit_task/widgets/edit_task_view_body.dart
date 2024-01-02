import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_lawyer/cubits/task_cubit/task_cubit.dart';
import 'package:help_lawyer/models/task_model.dart';
import 'package:help_lawyer/views/lawyer_name/widgets/custom_button.dart';
import 'package:help_lawyer/views/lawyer_name/widgets/custom_text_form_field.dart';

class EditTaskViewBody extends StatefulWidget {
  const EditTaskViewBody({Key? key, required this.taskModel}) : super(key: key);
  final TaskModel taskModel;

  @override
  State<EditTaskViewBody> createState() => _EditTaskViewBodyState();
}

class _EditTaskViewBodyState extends State<EditTaskViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Column(
        children: [
          CustomTextFormField(
            hintText: 'edit title',
            obscureText: false,
            onChanged: (value) {
              setState(() {
                widget.taskModel.title = value;
              });
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomTextFormField(
            hintText: 'edit description',
            obscureText: false,
            maxLines: 5,
            onChanged: (value) {
              setState(() {
                widget.taskModel.description = value;
              });
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          BlocListener<TaskCubit, TaskState>(
            listener: (context, state) {
              if (state is TaskSuccess) {
                Navigator.pop(context);
              }
            },
            child: CustomButton(
                text: 'Edit',
                onPressed: () {
                  widget.taskModel.save();
                  BlocProvider.of<TaskCubit>(context).fetchTasks();
                }),
          )
        ],
      ),
    );
  }
}
