import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

void showMessage(BuildContext context, String message, {bool isError = true}) {
  QuickAlert.show(
    context: context,
    type: isError ? QuickAlertType.error : QuickAlertType.success,
    title: isError ? 'Oops...' : null,
    text: message,
  );
}
