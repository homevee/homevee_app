import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:progress_dialog/progress_dialog.dart';

class CustomProgressDialog extends ProgressDialog{
  String title;

  CustomProgressDialog(BuildContext context, this.title) : super(context){
    this.style(
        message: title,
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: new Padding(
            padding: new EdgeInsets.all(15),
            child: CircularProgressIndicator()
        ),
        elevation: 5.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: TextStyle(
            color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.w400),
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.w400)
    );
  }


}