part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class TaskLoginLoadingState extends LoginState {}
class TaskLoginSuccessState extends LoginState {}
class TaskLoginErorrState extends LoginState {}
