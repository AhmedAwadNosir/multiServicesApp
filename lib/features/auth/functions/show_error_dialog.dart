import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/widgets.dart';
import 'package:multiservices_app/core/functions/show_awesome_dialog.dart';

showErrorDialog({required BuildContext context, required String errorMessage}) {
  showAwesomeDialog(
    context: context,
    dialogType: DialogType.error,
    dialogTitle: "somthing` wrong",
    dialogDesc: errorMessage,
  );
}
