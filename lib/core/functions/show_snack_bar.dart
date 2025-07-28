import 'package:flutter/material.dart';

showSnackBar({required BuildContext context, required String errorMessage}) {
  ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text(errorMessage)));
}
