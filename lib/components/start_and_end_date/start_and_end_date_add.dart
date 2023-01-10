import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../src/app_colors.dart';

class TimeType extends StatefulWidget {
  final timeType;
  late final date;



  TimeType({required this.timeType,required this.date});

  @override
  State<TimeType> createState() => _TimeTypeState();
}

class _TimeTypeState extends State<TimeType> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('- ${widget.timeType} Date', style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20
            )),
            Icon(Icons.calendar_today_outlined, size: 20, color: Colors.black,),
          ],
        ),
        SizedBox(height: 10.h,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 118.w,
            height: 35.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.KMainColor)
            ),
            child: GestureDetector(
              onTap: () async {
                DateTime? newDate = await
                showDatePicker(
                    context: context,
                    lastDate: DateTime(2100),
                    firstDate: DateTime(1900),
                    initialDate:widget.date ,
                    builder:(context, child)
                {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: const ColorScheme.light(
                        primary: AppColors.KMainColor,
                        onPrimary: Colors.white,
                        onSurface: Colors.black,
                      ),
                    ), child: child!,)
                });
                if (newDate == null) return;
                setState(() {
                widget.date = newDate;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 118.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child:
                  Text('${widget.date.year}/${widget.date.month}/${widget.date.day}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18.sp
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),

      ],
    );
  }
}
