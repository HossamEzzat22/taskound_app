import 'package:flutter/material.dart';

 greetings(){
  final hour = TimeOfDay.now().hour;

  if(hour <= 12){
    return 'Morning';
  } else if (hour <= 17){
    return 'Afternoon';
  }
  return 'Evening';
}