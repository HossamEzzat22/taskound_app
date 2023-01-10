import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../src/app_colors.dart';

class MyRaisedButton extends StatelessWidget {

  final text;
  final function;


  MyRaisedButton({required this.text,required this.function});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Container(
        width: 200.w,
        child: RaisedButton(
          onPressed:function,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          padding: EdgeInsets.all(12),
          color: AppColors.KMainColor,
          child: Text(text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.sp
              )
          ),
        ),
      ),
    );
  }
}
