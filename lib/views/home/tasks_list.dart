import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_lawyer/cubits/task_cubit/task_cubit.dart';
import 'package:help_lawyer/models/task_model.dart';
import 'package:help_lawyer/views/home/task_item.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        List<TaskModel> tasks = BlocProvider.of<TaskCubit>(context).tasks! ;
        return ListView.builder(
          itemCount: tasks.length,
            itemBuilder: (context, index) {
          return  Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: TaskItem(task: tasks[index],),
          );
        }
        );
      },
    );
  }
}
