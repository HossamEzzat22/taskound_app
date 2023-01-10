import 'package:flutter/material.dart';
import 'package:task_app/services/dio_helper/dio_helper.dart';
import 'package:task_app/services/sp_helper/sp_helper.dart';
import 'package:task_app/src/app_root.dart';



void main()
{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPrefrenceHelper.init();
  DioHelper.init();

  runApp(AppRoot());
}

