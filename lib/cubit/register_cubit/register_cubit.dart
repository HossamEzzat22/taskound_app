import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/auth.dart';
import '../../services/dio_helper/dio_helper.dart';
import '../../services/sp_helper/sp_helper.dart';
import '../../services/sp_helper/sp_keys.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context)=>BlocProvider.of(context);


  Authentication? authentication;

  TextEditingController NameController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();






  register() {
    emit(TaskRegisterLoadingState());
    print('loading');
    DioHelper.postData(url: 'register', data:
    {
      "name": NameController.text,
      "email": EmailController.text,
      "password":PasswordController.text,
    }
    ).then((value) {
      emit(TaskRegisterSuccessState());
      print(value.data);
      authentication = Authentication.fromJson(value.data);
      SharedPrefrenceHelper.saveData(key: SharedPreferencesKeys.token, value: authentication!.authorisation!.token);
      print(authentication!.user!.name);

    }).catchError((erorr){
      emit(TaskRegisterErorrState());
      print(erorr);
    }
    );
  }
}
