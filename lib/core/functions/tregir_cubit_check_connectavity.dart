import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:multiservices_app/core/functions/show_awesome_dialog.dart';

import 'package:multiservices_app/generated/l10n.dart';

showErrorConectionDialog({required BuildContext context}) {
  showAwesomeDialog(
    context: context,
    dialogType: DialogType.error,
    dialogTitle: S.of(context).NoInternetConnection,
    dialogDesc: S.of(context).Pleasecheckyourinternetsettingsandtryagain,
  );
}
