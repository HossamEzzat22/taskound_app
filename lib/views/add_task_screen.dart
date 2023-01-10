
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:task_app/components/reusable_features/back_iconButton_with_title.dart';
import 'package:task_app/models/image.dart';
import 'package:task_app/services/sp_helper/sp_helper.dart';
import 'package:task_app/services/sp_helper/sp_keys.dart';
import 'package:task_app/src/app_colors.dart';
import 'package:task_app/utils/app_navigator.dart';
import 'package:task_app/views/homeScreen.dart';
import 'package:task_app/views/view_tasks_with_state.dart';
import '../components/start_and_end_date/start_and_end_date_add.dart';
import '../components/container_cards/view_type_card.dart';
import '../cubit/addTask_cubit/add_task_cubit.dart';
import '../models/View_type_item.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final recorder = FlutterSoundRecorder();
  bool isRecorderReady = false;
  File? audioFile;
  String ?audioPath;

  // late AddTaskCubit addTaskCubit;

  @override
  void initState(){
    super.initState();
    initRecorder();
    // addTaskCubit = AddTaskCubit();
    // AddTaskCubit.get(context).initRecorder();
  }


  @override
  void dispose(){
    super.dispose();
    recorder.closeRecorder();
    // AddTaskCubit.get(context).recorder.closeRecorder();
  }

  Future initRecorder() async {
    final status = await Permission.microphone.request();

    if (status != PermissionStatus.granted){
      throw 'Microphone Permission not granted';
    }
    await recorder.openRecorder();

    isRecorderReady = true;

    recorder.setSubscriptionDuration(
        Duration(milliseconds: 500)
    );
  }


  Future record() async{
    if (!isRecorderReady) return ;
    await recorder.startRecorder(toFile: 'audio');
  }


  Future stop() async{
    if (!isRecorderReady) return;

    final path = await recorder.stopRecorder();
    final audioFile = File(path!);

    SharedPrefrenceHelper.saveData(key: SharedPreferencesKeys.audioRecord, value: audioFile.path.toString());
    pathes.add(path);


    print(
        'Recorded audio : $audioFile'
    );
  }




  List pathes = [];
  bool isRecord = false;
  int ind = 1;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTaskCubit(),
      child: BlocConsumer<AddTaskCubit, AddTaskState>(
        listener: (context, state) {
          if (state is TaskAddSuccessState) {
            AppNavigator(context, false, ViewTasksWithState());
          }
          //AppNavigator(context, false, ViewTasksWithState());
        },
        builder: (context, state) {
          var cubit = AddTaskCubit.get(context);
          return SafeArea(
            child: Scaffold(
              backgroundColor: AppColors.KMainColor,
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 30.0,
                  ),
                  child: Column(
                    children: [
                      BackIconWithTitle(
                          title: 'New Taskound',
                          function: () {
                            AppNavigator(context, true, HomeScreen());
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        // height: 900,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50))),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20.0, left: 20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text('- Title',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.sp)),
                                    Icon(
                                      Icons.book,
                                      size: 20,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    textInputAction: TextInputAction.next,
                                    autofocus: true,
                                    focusNode: cubit.titleNode,
                                    onFieldSubmitted: (_) {
                                      FocusScope.of(context)
                                          .requestFocus(cubit.detailsNode);
                                    },
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide(
                                                color: AppColors.KMainColor,
                                                width: 100.0)),
                                        hintText: 'Title'),
                                    style: TextStyle(fontSize: 20.sp),
                                    controller: cubit.TitleController,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  children: [
                                    Text('- Describtion',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.sp)),
                                    Icon(
                                      Icons.edit,
                                      size: 20,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    textInputAction: TextInputAction.done,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide(
                                                color: AppColors.KMainColor,
                                                width: 100.0)),
                                        hintText: 'details'),
                                    focusNode: cubit.detailsNode,
                                    style: TextStyle(fontSize: 18.sp),
                                    controller: cubit.DetailController,
                                    maxLines: 5,
                                    minLines: 2,
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                Row(
                                  children: [
                                    Text('- Status',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.sp)),
                                    Icon(
                                      Icons.next_week,
                                      size: 20,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                                Container(
                                  height: 50.h,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              ind = index + 1;
                                              SharedPrefrenceHelper.saveData(
                                                  key: SharedPreferencesKeys
                                                      .ind,
                                                  value: ind);
                                            });
                                            // cubit.selectIndex(index+1);
                                          },
                                          child: ViewType(
                                            viewTYpeItem: viewType[index + 1],
                                            color: (index + 1) == ind
                                                ? AppColors.KMainColor
                                                : Colors.grey,
                                          ));
                                    },
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                      width: 10.w,
                                    ),
                                    itemCount: 4,
                                  ),
                                ),
                                Row(
                                  children: [
                                    TimeType(timeType: 'Start', date: cubit.startDate,),
                                    SizedBox(
                                      width: 50.w,
                                    ),
                                    TimeType(timeType: 'End', date: cubit.endDate,)
                                  ],
                                ),
                                SizedBox(height: 15.h),
                                Row(
                                  children: [
                                    Text('- Attach',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.sp)),
                                    Icon(
                                      Icons.attachment,
                                      size: 20,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            isRecord = true;
                                          });
                                        },
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.mic,
                                              size: 20,
                                              color: Colors.black,
                                            ),
                                            SizedBox(width: 10.w,),
                                            Text('Record Voice',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15.sp)),
                                          ],
                                        ),
                                      ),
                                      Visibility(
                                        visible: isRecord ? true :false ,
                                        child: Column(
                                          children: [
                                            StreamBuilder<RecordingDisposition>(
                                              stream: recorder.onProgress,
                                                builder: (context,snapshot){
                                                final duration = snapshot.hasData?
                                                    snapshot.data!.duration:
                                                    Duration.zero;
                                                // return Text('${duration.inSeconds}s');

                                                  String twoDigits (int n) => n.toString().padLeft(0);
                                                  final twoDigitMinutes =
                                                      twoDigits(duration.inMinutes.remainder(60));
                                                  final twoDigitSeconds =
                                                      twoDigits(duration.inSeconds.remainder(60));

                                                  return Text(
                                                    '$twoDigitMinutes:$twoDigitSeconds',
                                                    style: TextStyle(
                                                      fontSize: 20.sp,
                                                      fontWeight: FontWeight.bold
                                                    ),
                                                  );
                                                }),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                primary: AppColors.KMainColor,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(30),
                                                  )
                                              ),
                                                onPressed: ()async{
                                                setState(() async {
                                                  if(recorder.isRecording){
                                                    await stop();
                                                  }else{
                                                    await record();
                                                  }
                                                });

                                                },
                                                child: Icon(
                                                  Icons.mic,
                                                  color: Colors.white,
                                                )),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10.h,),
                                      GestureDetector(
                                        onTap: (){
                                          cubit.pickImage();
                                        },
                                        child: 
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.image,
                                              size: 20,
                                              color: Colors.black,
                                            ),
                                            SizedBox(width: 10.w,),
                                            Text('Add Image',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15.sp)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10.h,),
                                      if(cubit.imgFile != null )
                                      Card(
                                        elevation: 10,
                                        child: Container(
                                            height: 400.h,
                                            width: 400.w,
                                            child: Image.file(File(cubit.imgFile!.path))),
                                      )


                                    ],
                                  ),
                                ),
                              ]),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  cubit.addNewTask();
                  SharedPrefrenceHelper.saveData(key: SharedPreferencesKeys.titleController, value: cubit.TitleController);
                  SharedPrefrenceHelper.saveData(key: SharedPreferencesKeys.detailsController, value: cubit.DetailController);

                  AppNavigator(context, false, ViewTasksWithState());
                },
                backgroundColor: AppColors.KMainColor,
                child: Icon(
                  Icons.add,
                  size: 40,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
