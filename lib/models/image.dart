import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/services/sp_helper/sp_helper.dart';
import 'package:task_app/services/sp_helper/sp_keys.dart';

class ImageShow extends StatelessWidget {

  final image;


  ImageShow({required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
            child:Image(image:image))
      ],
    );
  }
}
