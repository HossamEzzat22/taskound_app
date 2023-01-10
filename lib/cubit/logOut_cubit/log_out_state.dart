part of 'log_out_cubit.dart';

@immutable
abstract class LogOutState {}

class LogOutInitial extends LogOutState {}


class TaskLogoutLoadingState extends LogOutState {}
class TaskLogoutSuccessState extends LogOutState {}
class TaskLogoutErorrState extends LogOutState {}
