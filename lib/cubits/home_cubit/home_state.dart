part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class AddTaskLoading extends HomeState {}
class AddTaskSuccess extends HomeState {}
class AddTaskFailure extends HomeState {
  final String errMessage ;
  AddTaskFailure(this.errMessage);
}
