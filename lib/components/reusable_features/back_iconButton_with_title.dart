import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../src/app_colors.dart';

class BackIconWithTitle extends StatelessWidget {

  final title;
  final function;


  BackIconWithTitle({required this.title,required this.function});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        children: [
          IconButton(
              onPressed:function,
              icon:Icon(Icons.arrow_back_ios,
                size: 35,
                color: Colors.white,
              )),
          Text(
            title,
            style: TextStyle(
                color: Colors.white,
                fontSize: 32.sp,
              fontWeight: FontWeight.bold
            ),
          )

        ],
      ),
    );
  }
}
