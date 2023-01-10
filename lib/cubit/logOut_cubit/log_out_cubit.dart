import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/auth.dart';
import '../../services/dio_helper/dio_helper.dart';
import '../../services/sp_helper/sp_helper.dart';
import '../../services/sp_helper/sp_keys.dart';

part 'log_out_state.dart';

class LogOutCubit extends Cubit<LogOutState> {
  LogOutCubit() : super(LogOutInitial());

  static LogOutCubit get(context)=>BlocProvider.of(context);
  Authentication? authentication;


  logout(){
    emit(TaskLogoutLoadingState());
    DioHelper.postData(url: 'logout',
        data:{}
        ).then((value){
      emit(TaskLogoutSuccessState());
      authentication = Authentication.fromJson(value.data);
      SharedPrefrenceHelper.removeData(key: SharedPreferencesKeys.token);
    }).catchError((erorr){
      emit(TaskLogoutErorrState());
      print(erorr);
    });
  }




}
