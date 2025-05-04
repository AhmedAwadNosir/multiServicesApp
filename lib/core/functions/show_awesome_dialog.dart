import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

showAwesomeDialog({
  required BuildContext context,
  required DialogType dialogType,
  required String dialogTitle,
  required String dialogDesc,
  @required String? btnOkName,
  @required Color? btnOkColor,
  @required String? btnCancelName,
  @required Color? btnCancelColor,
  @required Function()? btnOkOnPress,
  @required Function()? btnCancelOnPress,
}) {
  AwesomeDialog(
    context: context,
    dialogType: dialogType,
    animType: AnimType.rightSlide,
    title: dialogTitle,
    desc: dialogDesc,
    btnOkText: btnOkName,
    btnOkColor: btnOkColor,
    btnCancelText: btnCancelName,
    btnCancelColor: btnCancelColor,
    btnCancelOnPress: btnCancelOnPress,
    btnOkOnPress: btnOkOnPress,
  ).show();
}
