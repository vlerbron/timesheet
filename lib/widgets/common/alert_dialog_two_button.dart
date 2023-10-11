import 'package:flutter/material.dart';

class AlertDialogTwoButton {
  AlertDialogTwoButton(
      {this.leftText = 'Cancel',
      this.rightText = 'Continue',
      this.title = 'AlertDialog',
      this.content = 'Are you sure ?',
      required this.onRightTap});
  String leftText;
  String rightText;
  String title;
  String content;
  final void Function() onRightTap;

  void showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      onPressed: () => Navigator.of(context).pop(),
      child: Text(leftText),
    );
    Widget continueButton = TextButton(
      onPressed: onRightTap,
      child: Text(rightText),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
