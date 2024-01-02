import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_lawyer/cubits/task_cubit/task_cubit.dart';
import 'package:help_lawyer/models/task_model.dart';
import 'package:help_lawyer/views/edit_task/edit_task_view.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key, required this.task});
  final TaskModel task;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                task.title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                task.description,
                style: const TextStyle(color: Colors.white),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return EditTaskView(
                          taskModel: task,
                        );
                      }));
                    },
                    color: Colors.white,
                    icon: const Icon(Icons.edit),
                  ),
                  IconButton(
                    onPressed: () {
                      BlocProvider.of<TaskCubit>(context).deleteTask(task);
                    },
                    color: Colors.white,
                    icon: const Icon(Icons.delete),
                  )
                ],
              ),
            ),
            Text(
              task.date,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
