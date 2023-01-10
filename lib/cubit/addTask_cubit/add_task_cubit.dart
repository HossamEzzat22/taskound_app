import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import '../../models/add_task.dart';
import '../../services/dio_helper/dio_helper.dart';
import '../../services/sp_helper/sp_helper.dart';
import '../../services/sp_helper/sp_keys.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitial());

  static AddTaskCubit get(context) => BlocProvider.of(context);

  AddTask? addTask;
  File? imgFile;

  // final recorder = FlutterSoundRecorder();
  // bool isRecorderReady = false;
  // List pathes = [];

  // @override
  // void initState(){
  //   AddTaskCubit.get(context).initRecorder();
  // }
  //
  //
  // @override
  // void dispose(){
  //   AddTaskCubit.get(context).recorder.closeRecorder();
  // }














  TextEditingController TitleController = TextEditingController();
  TextEditingController DetailController = TextEditingController();
  TextEditingController StatrtDateController = TextEditingController();
  TextEditingController EndDateController = TextEditingController();
  DateTime startDate = DateTime(2022,12,31);
  DateTime endDate = DateTime(2022,12,31);
  FocusNode titleNode = FocusNode();
  FocusNode detailsNode = FocusNode();





  addNewTask() {
    emit(TaskAddLoadingState());
    print('Loading');
    DioHelper.postData(
        url: 'tasks',
        token: SharedPrefrenceHelper.getData(key: SharedPreferencesKeys.token),
        data: {
          "title": TitleController.text,
          "description": DetailController.text,
          // "start_date": startDate.toIso8601String(),
          // "end_date": endDate.toIso8601String(),
        }).then((value) {
      emit(TaskAddSuccessState());
      print(value.data);
      addTask = AddTask.fromJson(value.data);
      print(addTask!.response!.title);
    }).catchError((erorr) {
      emit(TaskAddErorrState());
      print(erorr);
    });
  }





  // Future initRecorder() async {
  //   final status = await Permission.microphone.request();
  //
  //   if (status != PermissionStatus.granted){
  //     throw 'Microphone Permission not granted';
  //   }
  //   await recorder.openRecorder();
  //
  //   isRecorderReady = true;
  //
  //   recorder.setSubscriptionDuration(
  //       Duration(milliseconds: 500)
  //   );
  // }
  //
  //
  // Future record() async{
  //   if (!isRecorderReady) return ;
  //   await recorder.startRecorder(toFile: 'audio');
  // }
  //
  //
  // Future stop() async{
  //   if (!isRecorderReady) return;
  //
  //   final path = await recorder.stopRecorder();
  //   // twoDigitMinutes ='0';
  //   // twoDigitSeconds='0';
  //
  //   final audioFile = File(path!);
  //
  //   pathes.add(path);
  //
  //
  //   print(
  //       'Recorded audio : $audioFile'
  //   );
  // }



  Future pickImage() async {
    try {
      emit(PickImageState());
      final pickedImage =await ImagePicker().pickImage(source: ImageSource.gallery);
      if(pickedImage != null) imgFile = File(pickedImage.path);
      SharedPrefrenceHelper.saveData(key: SharedPreferencesKeys.pickedImage, value: pickedImage!.path.toString());
      print(imgFile);

    } on PlatformException catch (e) {
      print('failed to pick image');
    }
  }
}
