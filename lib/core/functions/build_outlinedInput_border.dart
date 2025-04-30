import 'package:flutter/material.dart';

OutlineInputBorder buildOutlinedInputBodreder(final Color color) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: color),
  );
}
