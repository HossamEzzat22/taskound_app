import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../src/app_colors.dart';

class MyAction extends StatelessWidget {
  final text;
  IconData icon;
  double size;
  final function;
  final color;


  MyAction({required this.text,required this.icon,required this.size,required this.function,required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        width: 155.w,
        height: 90.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(icon,size: 40,color: Colors.white,),
              SizedBox(width: 8,),
              Container(
                width:90 ,
                child: Text(text,
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: size,
                  ),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
