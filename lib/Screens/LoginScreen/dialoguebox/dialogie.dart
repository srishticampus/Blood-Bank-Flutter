import 'package:blood_bank_application/Colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

import 'package:flutter/material.dart';

class MyCustomAlertDialog {
  showCustomAlertdialog({
    required BuildContext context,
    required String title,
    required String subtitle,
    bool button = false,
    required Function() onTapOkButt,
    Function()? onTapCancelButt,
  }) async {
    return Platform.isIOS
        ? showCupertinoDialog(
          barrierDismissible: false,
            context: context,
            builder: (context) => CupertinoAlertDialog(
              title: Text(title),
              content: Text(subtitle),
              actions: <Widget>[
                if (button == true)
                  CupertinoDialogAction(
                    child: const Text('Cancel'),
                    onPressed: () => onTapCancelButt!(),
                  ),
                CupertinoDialogAction(
                  child: const Text('Ok'),
                  onPressed: () => onTapOkButt(),
                ),
              ],
            ),
          )
        : showDialog(
         
          barrierDismissible: false,
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: appColor,
                  title: Text(title,style: TextStyle(color: Colors.white,fontSize: 16),),
                  content: Text(subtitle,style: TextStyle(color: Colors.white,fontSize: 13),),
                  actions: <Widget>[
                    if (button == true)
                      ElevatedButton(
                        child: const Text('Cancel',style: TextStyle(color: Colors.white),),
                        onPressed: () => onTapCancelButt!(),
                      ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.white,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                      child:  Text('Ok',style: TextStyle(color: appColor,fontWeight: FontWeight.bold),),
                      onPressed: () => onTapOkButt(),
                    ),
                  ]);
            });
  }
}
