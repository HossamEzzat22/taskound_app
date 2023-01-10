import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/components/container_cards/taskCard.dart';
import 'package:task_app/components/container_cards/view_type_card.dart';
import 'package:task_app/cubit/getAllTasks_cubit/get_all_tasks_cubit.dart';
import 'package:task_app/models/View_type_item.dart';
import 'package:task_app/src/app_colors.dart';
import 'package:task_app/utils/app_navigator.dart';
import 'package:task_app/views/homeScreen.dart';

import '../components/reusable_features/back_iconButton_with_title.dart';

class ViewTasksWithState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetAllTasksCubit(),
      child: BlocConsumer<GetAllTasksCubit, GetAllTasksState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          var cubit = GetAllTasksCubit.get(context);
          return Scaffold(
            backgroundColor: AppColors.KMainColor,
            body: Padding(
              padding: const EdgeInsets.only(
                top: 30.0,
              ),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      BackIconWithTitle(
                        title: 'Your Taskounds',
                        function: () {
                          AppNavigator(context, false, HomeScreen());
                        },
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Container(
                        height: 900,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50))),
                        child: Column(
                          children: [
                            cubit.getAllTasks == null
                                ? Expanded(
                                    child: Center(
                                      child: GestureDetector(
                                        onTap: (){cubit.getMyAllTasks();},
                                        child: Text(
                                          'ADD Tasks +...',
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(
                                    height: 400.h,
                                    child: ListView.builder(
                                        itemCount:
                                            cubit.getAllTasks!.response!.length,
                                        shrinkWrap: true,
                                        itemBuilder: (BuildContext context, int index) =>
                                            MyTaskCard(
                                                function: 'function',
                                                title: cubit.getAllTasks!
                                                    .response![0].title,
                                                describtion: cubit.getAllTasks!
                                                    .response![0].description,
                                                startDate: cubit.getAllTasks!
                                                    .response![0].startDate,
                                                endDate: cubit.getAllTasks!
                                                    .response![0].endDate,
                                                status: cubit.getAllTasks!
                                                    .response![0].status)),
                                  )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
