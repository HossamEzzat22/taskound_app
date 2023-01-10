part of 'get_all_tasks_cubit.dart';

@immutable
abstract class GetAllTasksState {}

class GetAllTasksInitial extends GetAllTasksState {}

class TaskGetAllLoadingState extends GetAllTasksState {}
class TaskGetAllSuccessState extends GetAllTasksState {}
class TaskGetAllErorrState extends GetAllTasksState {}
