import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SisToast {
  SisToast._();

  static showToast(String message, {bool isError = false}) {
    Fluttertoast.showToast(
      msg: message,
      textColor: isError ? Colors.white : Colors.black,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 2,
      webPosition: "center",
      webBgColor: isError ? '#EC4646' : '#B26941',
      backgroundColor: isError ? Colors.red : Colors.white,
      fontSize: 12,
    );
  }
}
