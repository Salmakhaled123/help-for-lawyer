part of 'task_cubit.dart';

@immutable
abstract class TaskState {}

class TaskInitial extends TaskState {}

class TaskSuccess extends TaskState {}

class DeletedTaskSuccessfully extends TaskState {}
