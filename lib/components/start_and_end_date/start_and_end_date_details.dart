import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../src/app_colors.dart';

class TimeTypeForDetails extends StatelessWidget {
  final timeType;
  final date;


  TimeTypeForDetails({required this.timeType,required this.date});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('- ${timeType} Date',style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20
            )),
            Icon(Icons.calendar_today_outlined,size: 20,color: Colors.black,),
          ],
        ),
        SizedBox(height: 10.h,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 118.w,
            height: 50.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20)
            ),
            child: Text(date),
          ),
        ),
      ],
    );
  }
}
