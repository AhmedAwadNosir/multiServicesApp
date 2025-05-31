import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:multiservices_app/features/home/notes/functions/build_outlined_input_border.dart';

class CustomTextFormFilled extends StatelessWidget {
  const CustomTextFormFilled({
    super.key,
    this.onSaved,
    required this.hint,
    @required this.maxLines,
    @required this.intialValue,
    @required this.fontSize,
    this.onChanged,
    @required this.controller,
  });
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final String hint;
  final int? maxLines;
  final String? intialValue;
  final double? fontSize;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onSaved: onSaved,
      onChanged: onChanged,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Filed is required";
        }
      },
      maxLines: maxLines,
      initialValue: intialValue,
      style: TextStyle(fontSize: fontSize ?? 20),
      decoration: InputDecoration(
        enabledBorder: buildOutlinedPorder(context: context),
        focusedBorder: buildOutlinedPorder(
          color: Theme.of(context).colorScheme.primary,
          context: context,
        ),
        border: buildOutlinedPorder(context: context),
        hintText: hint,
        hintStyle: const TextStyle(),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 16,
        ),
      ),
      enableSuggestions: true,
    );
  }
}
