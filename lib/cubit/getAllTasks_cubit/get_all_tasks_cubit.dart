import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/get_all_tasks.dart';
import '../../services/dio_helper/dio_helper.dart';
import '../../services/sp_helper/sp_helper.dart';
import '../../services/sp_helper/sp_keys.dart';

part 'get_all_tasks_state.dart';

class GetAllTasksCubit extends Cubit<GetAllTasksState> {
  GetAllTasksCubit() : super(GetAllTasksInitial());

  static GetAllTasksCubit get(context)=>BlocProvider.of(context);

  GetAllTasks? getAllTasks;


  getMyAllTasks(){
    emit(TaskGetAllLoadingState());
    print('Loding');
    DioHelper.getData(
      url: 'tasks',
      token: SharedPrefrenceHelper.getData(key: SharedPreferencesKeys.token),
    ).then((value){
      emit(TaskGetAllSuccessState());
      print(value.data);
      getAllTasks =GetAllTasks.fromJson(value.data);
      print(getAllTasks!.response![0].title);
    }).catchError((erorr){
      emit(TaskGetAllErorrState());
      print(erorr);
    } );
  }






}
