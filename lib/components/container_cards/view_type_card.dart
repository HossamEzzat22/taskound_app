import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/models/View_type_item.dart';

class ViewType extends StatelessWidget {
  Color color;

 ViewTYpeItem viewTYpeItem;


  ViewType({required this.viewTYpeItem,required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30)
      ),
      child: Center(
        child: Text(
          viewTYpeItem.title,
          style: TextStyle(
              color: color,
            fontSize: 16
          ),),
      ),
    );
  }
}
