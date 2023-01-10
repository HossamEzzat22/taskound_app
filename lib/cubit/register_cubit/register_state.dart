part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class TaskRegisterLoadingState extends RegisterState {}
class TaskRegisterSuccessState extends RegisterState {}
class TaskRegisterErorrState extends RegisterState {}

