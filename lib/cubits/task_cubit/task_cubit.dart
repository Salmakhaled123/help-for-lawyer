import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:help_lawyer/constants.dart';
import 'package:help_lawyer/models/task_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());

  List<TaskModel>? tasks;
  fetchTasks() {
    var taskBox = Hive.box<TaskModel>(kTasksBox);
    tasks = taskBox.values.toList();
    emit(TaskSuccess());
  }

  deleteTask(TaskModel model) async {
    model.delete();
    tasks?.remove(model);
    emit(DeletedTaskSuccessfully());
  }
}
