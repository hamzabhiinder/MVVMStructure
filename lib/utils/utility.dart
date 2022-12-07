
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Utils {
  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
    );
  }

  static flushbarErrorMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: message,
          icon: const Icon(
            Icons.error,
            size: 30,
          ),
          borderRadius: BorderRadius.circular(20),
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.all(10),
          forwardAnimationCurve: Curves.decelerate,
          duration: const Duration(seconds: 3),
          positionOffset: 20,
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: Colors.red,
        )..show(context));
  }

  static void fieldFocus(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
