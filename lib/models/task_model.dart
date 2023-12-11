import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)

class TaskModel extends HiveObject{
  @HiveField(0)
  final String title ;
  @HiveField(1)
  final String discription ;
  @HiveField(2)
  final String date ;

  TaskModel({required this.title, required this.discription, required this.date});
}