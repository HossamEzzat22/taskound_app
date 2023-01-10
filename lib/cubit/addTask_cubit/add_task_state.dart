part of 'add_task_cubit.dart';

@immutable
abstract class AddTaskState {}

class AddTaskInitial extends AddTaskState {}

class TaskAddLoadingState extends AddTaskState {}
class TaskAddSuccessState extends AddTaskState {}
class TaskAddErorrState extends AddTaskState {}

class PickImageState extends AddTaskState {}



