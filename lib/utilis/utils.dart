import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class Utils {
  static showFlushbarerror(BuildContext context, String title, String message) {
    Flushbar(
      title: title,
      message: message,
      backgroundColor: Colors.black87,
      titleColor: Colors.red,
      messageColor: Colors.white,
      icon: const Icon(
        Icons.error,
        color: Colors.red,
      ),
      leftBarIndicatorColor: Colors.red,
      duration: const Duration(seconds: 3),
      animationDuration: const Duration(milliseconds: 500),
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      isDismissible: true,
      borderRadius: BorderRadius.circular(8),
      margin: const EdgeInsets.all(10),
      boxShadows: const [
        BoxShadow(
          color: Colors.black45,
          offset: Offset(0, 2),
          blurRadius: 3.0,
        ),
      ],
      forwardAnimationCurve: Curves.easeOut,
      reverseAnimationCurve: Curves.easeIn,
    ).show(context);
  }

  static showFlushbar(BuildContext context, String title, String message) {
    Flushbar(
      title: title,
      message: message,
      backgroundColor: Colors.green.shade500,
      titleColor: Colors.red,
      messageColor: Colors.white,
      icon: const Icon(
        Icons.done,
        color: Colors.red,
      ),
      leftBarIndicatorColor: Colors.red,
      duration: const Duration(seconds: 3),
      animationDuration: const Duration(milliseconds: 500),
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      isDismissible: true,
      borderRadius: BorderRadius.circular(8),
      margin: const EdgeInsets.all(10),
      boxShadows: const [
        BoxShadow(
          color: Colors.black45,
          offset: Offset(0, 2),
          blurRadius: 3.0,
        ),
      ],
    ).show(context);
  }
}
