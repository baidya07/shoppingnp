
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';


class CustomFlushBar{

  static void success(BuildContext context, String message, {String? title,Color? color, Widget? icon}){
    Flushbar(
      title: title ?? "Successful!!",
      message: message,
      icon: icon ?? const Icon(Icons.check_circle),
      duration: const Duration(seconds: 3),
      backgroundColor: color??Colors.green,
    ).show(context);
  }
  static void error(BuildContext context, String message, {String? title,Color? color}){
    Flushbar(
      title: title ?? "Oops!",
      message: message,
      icon: const Icon(Icons.warning,color: Colors.white,),
      duration: const Duration(seconds: 3),
      backgroundColor: color?? Colors.red,
    ).show(context);
  }

}


