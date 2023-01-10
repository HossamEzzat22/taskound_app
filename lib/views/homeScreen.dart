import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/components/container_cards/my_action_container.dart';
import 'package:task_app/cubit/getAllTasks_cubit/get_all_tasks_cubit.dart';
import 'package:task_app/cubit/logOut_cubit/log_out_cubit.dart';
import 'package:task_app/models/auth.dart';
import 'package:task_app/models/time.dart';
import 'package:task_app/services/sp_helper/sp_helper.dart';
import 'package:task_app/services/sp_helper/sp_keys.dart';
import 'package:task_app/src/app_colors.dart';
import 'package:task_app/utils/app_navigator.dart';
import 'package:task_app/views/add_task_screen.dart';
import 'package:task_app/views/login_screen.dart';
import 'package:task_app/views/view_tasks_with_state.dart';

class HomeScreen extends StatefulWidget {


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {


    return BlocProvider(
      create: (context) => LogOutCubit(),
      child: BlocConsumer<LogOutCubit, LogOutState>(
        listener: (context, state) {
          if (state is TaskLogoutSuccessState) {
            AppNavigator(context, true, LoginScreen());
          }
        },
        builder: (context, state) {
          var cubit = LogOutCubit.get(context);
          return BlocProvider(
            create: (context) => GetAllTasksCubit(),


            child: BlocConsumer<GetAllTasksCubit,GetAllTasksState>(
              listener: (context, state) {},
              builder: (context, state) {
                var mainCubit = GetAllTasksCubit.get(context);

                return


                  Scaffold(
                    body: Padding(
                      padding: const EdgeInsets.only(
                          top: 40, right: 20, left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(greetings(), style: TextStyle(
                                fontSize: 25.sp,
                                color: AppColors.KMainColor,
                              ),),
                              Text(', ${SharedPrefrenceHelper.getData(key: SharedPreferencesKeys.userName)}', style: TextStyle(
                                fontSize: 25.sp,
                                color: Colors.black,
                              ),), SizedBox(width: 20.h,),
                              const CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://img.freepik.com/free-photo/bohemian-man-with-his-arms-crossed_1368-3542.jpg'),
                                radius: 30,
                              )
                            ],
                          ),
                          const SizedBox(height: 20,),
                          const Text('- My Control Panel', style: TextStyle(
                              color: Colors.black,
                              fontSize: 20
                          )),
                          SizedBox(height: 30.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyAction(text: 'New Taskound',
                                icon: Icons.add_box_rounded,
                                size: 18,
                                function: () {
                                AppNavigator(context, false, AddTaskScreen());
                                }, color: AppColors.KMainColor,),
                              MyAction(text: 'View Taskounds With State ',
                                  icon: Icons.pageview_rounded,
                                  size: 18,
                                  function: () {
                                    mainCubit.getMyAllTasks();
                                    AppNavigator(
                                        context, false, ViewTasksWithState());
                                  }, color: AppColors.KMainColor,),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MyAction(text: 'Logout',
                                  icon: Icons.logout,
                                  size: 18,
                                  function: () {
                                    cubit.logout();
                                    AppNavigator(context, true, LoginScreen());
                                  }, color: Colors.red,),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ;
              }
            ),
          );
        },
      ),
    );
  }
}
