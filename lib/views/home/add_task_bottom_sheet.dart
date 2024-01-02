import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_lawyer/cubits/home_cubit/home_cubit.dart';
import 'package:help_lawyer/cubits/task_cubit/task_cubit.dart';
import 'package:help_lawyer/views/home/add_task_form.dart';


class AddTaskBottomSheet extends StatelessWidget {
   const AddTaskBottomSheet({super.key});


  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is AddTaskFailure){}
        if( state is AddTaskSuccess){
          Navigator.pop(context);
          BlocProvider.of<TaskCubit>(context).fetchTasks();
        }
      },
      builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is AddTaskLoading ? true : false ,
          child:   Padding(
            padding:  EdgeInsets.only(
                right: 16,
                left: 16,
                bottom:MediaQuery.of(context).viewInsets.bottom
            ),
            child: const SingleChildScrollView(child: AddTaskForm()),
          ),
        );
      },
    );
  }
}

