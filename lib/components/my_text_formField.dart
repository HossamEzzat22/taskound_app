import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {


  final name;
  final controller;
  bool isPassword = false;


  MyTextFormField({required this.name,required this.controller, required this.isPassword});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      keyboardType: TextInputType.emailAddress,
      obscureText: isPassword,
      autofocus: true,
      controller:controller ,
      decoration: InputDecoration(
        hintText: name,
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),

        border:
        OutlineInputBorder(

            borderRadius: BorderRadius.circular(32.0),

        //   borderSide: BorderSide(width: 2, color: Colors.amber,
        //
        // ),
        ),
      ),
    );
  }
}
