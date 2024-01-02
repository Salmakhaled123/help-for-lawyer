import 'package:flutter/material.dart';
import 'package:help_lawyer/models/task_model.dart';
import 'package:help_lawyer/views/edit_task/widgets/edit_task_view_body.dart';

class EditTaskView extends StatelessWidget {
  const EditTaskView({Key? key, required this.taskModel}) : super(key: key);
  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit task')),
      body: EditTaskViewBody(taskModel: taskModel),
    );
  }
}
