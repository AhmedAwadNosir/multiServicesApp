import 'package:flutter/material.dart';
import 'package:multiservices_app/core/functions/build_outlinedInput_border.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.onSaved,
    required this.label,
    this.prefixIcon,
  });
  final void Function(String?)? onSaved;
  final String label;
  final Widget? prefixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Field is Required";
        }
        return null;
      },
      enableSuggestions: true,

      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        labelText: label,
        border: buildOutlinedInputBodreder(
          Theme.of(context).colorScheme.secondary,
        ),
        enabledBorder: buildOutlinedInputBodreder(
          Theme.of(context).colorScheme.secondary,
        ),
        errorBorder: buildOutlinedInputBodreder(Colors.red),
        focusedBorder: buildOutlinedInputBodreder(
          Theme.of(context).colorScheme.primary,
        ),
        contentPadding: EdgeInsets.all(18),
      ),
    );
  }
}
