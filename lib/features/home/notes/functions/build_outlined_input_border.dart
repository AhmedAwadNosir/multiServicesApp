import 'package:flutter/material.dart';

buildOutlinedPorder({
  Color? color,
  double? radius,
  required BuildContext context,
}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(radius ?? 8),
    borderSide: BorderSide(
      color: color ?? Theme.of(context).colorScheme.secondary,
    ),
  );
}
