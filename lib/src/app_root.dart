import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/models/get_all_tasks.dart';
import 'package:task_app/views/add_task_screen.dart';
import 'package:task_app/views/login_screen.dart';
import 'package:task_app/views/register_screen.dart';
import 'package:task_app/views/task_details.dart';
import 'package:task_app/views/view_tasks_with_state.dart';
import 'package:task_app/views/welcome_screen.dart';

import '../views/homeScreen.dart';


class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context , child) {
         return OnboardingScreen();
        }
        )
    );
  }
}
