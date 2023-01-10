import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/auth.dart';
import '../../services/dio_helper/dio_helper.dart';
import '../../services/sp_helper/sp_helper.dart';
import '../../services/sp_helper/sp_keys.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context)=>BlocProvider.of(context);


  Authentication? authentication;

  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();

  login(){
    emit(TaskLoginLoadingState());
    print('loading');
    DioHelper.postData(url: 'login',
        data:{
          "email": EmailController.text,
          "password":PasswordController.text,
        }).then((value)
    {
      emit(TaskLoginSuccessState());
      print(value.data);
      authentication = Authentication.fromJson(value.data);
      SharedPrefrenceHelper.saveData(key: SharedPreferencesKeys.token, value: authentication!.authorisation!.token);
      print(authentication!.user!.name);
      SharedPrefrenceHelper.saveData(key: SharedPreferencesKeys.userName, value:authentication!.user!.name);
    }
    ).catchError((erorr){
      emit(TaskLoginErorrState());
      print(erorr);
    });
  }
}
