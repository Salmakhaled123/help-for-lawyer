import 'package:bloc/bloc.dart';
import 'package:help_lawyer/constants.dart';
import 'package:help_lawyer/models/task_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  addTask(TaskModel task) async {
    emit(AddTaskLoading());
    try {
      var taskBox = Hive.box<TaskModel>(kTasksBox);
      await taskBox.add(task);
      emit(AddTaskSuccess());
    } on Exception catch (e) {
      emit(AddTaskFailure(e.toString()));
    }
  }
}
