import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/components/reusable_features/back_iconButton_with_title.dart';
import 'package:task_app/components/start_and_end_date/start_and_end_date_details.dart';
import 'package:task_app/services/sp_helper/sp_helper.dart';
import 'package:task_app/services/sp_helper/sp_keys.dart';
import 'package:task_app/src/app_colors.dart';

import '../components/container_cards/view_type_card.dart';
import '../models/View_type_item.dart';

class TaskDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.KMainColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    BackIconWithTitle(title: '${SharedPrefrenceHelper.getData(key: SharedPreferencesKeys.titleController)}', function: () {}),
                    SizedBox(width: 150.w,),
                    IconButton(onPressed: (){}, icon: Icon(Icons.edit,color: Colors.white,size: 30,))
                  ],
                ),
                SizedBox(height: 30.h),
                Container(
                  // height: 1000.h,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 30.0, left: 20, right: 20),
                    child: Column(
                      children: [
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
                        Text(
                            '${SharedPrefrenceHelper.getData(key: SharedPreferencesKeys.detailsController)}'),
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
                              return ViewType(
                                viewTYpeItem: viewType[index + 1],
                                color: (index + 1) ==
                                        SharedPrefrenceHelper.getData(
                                            key: SharedPreferencesKeys.ind)
                                    ? AppColors.KMainColor
                                    : Colors.grey,
                              );
                            },
                            separatorBuilder: (context, index) => SizedBox(
                              width: 10.w,
                            ),
                            itemCount: 4,
                          ),
                        ),
                        Row(
                          children: [
                            TimeTypeForDetails(
                                timeType: 'Start',
                                date:
                                '${SharedPrefrenceHelper.getData(key: SharedPreferencesKeys.startDateController)}'),
                            SizedBox(
                              width: 50.w,
                            ),
                            TimeTypeForDetails(
                                timeType: 'End',
                                date:
                                    '${SharedPrefrenceHelper.getData(key: SharedPreferencesKeys.endDateController)}'),
                          ],
                        ),
                        SizedBox(height: 15.h),
                        Row(
                          children: [
                            Text('- Voice Note',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.sp)),
                            Icon(
                              Icons.mic,
                              size: 20,
                              color: Colors.black,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        Row(
                          children: [
                            Text('- Image',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.sp)),
                            Icon(
                              Icons.image,
                              size: 20,
                              color: Colors.black,
                            )
                          ],
                        ),
                        SizedBox(height: 15.h),
                        Container(
                          height: 400.h,
                            width: 400.w,
                            child: Image.file(SharedPrefrenceHelper.getData(key: SharedPreferencesKeys.pickedImage)))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
