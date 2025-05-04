import 'package:flutter/material.dart';
import 'package:multiservices_app/core/functions/build_outlinedInput_border.dart';

class CustomPasswordTextFormField extends StatefulWidget {
  const CustomPasswordTextFormField({
    super.key,
    required this.title,
    this.onChanged,
    this.onSaved,
    this.titleColor,
    this.titleSpace,
    this.controller,
  });
  final String title;
  final void Function(String)? onChanged;
  final Function(String?)? onSaved;
  final TextEditingController? controller;
  final Color? titleColor;
  final double? titleSpace;

  @override
  State<CustomPasswordTextFormField> createState() =>
      _CustomPasswordTextFormFieldState();
}

class _CustomPasswordTextFormFieldState
    extends State<CustomPasswordTextFormField> {
  bool obsecureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecureText,
      controller: widget.controller,
      onChanged: widget.onChanged,
      onSaved: widget.onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Field is Required";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: widget.title,
        contentPadding: EdgeInsets.all(18),
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

        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              obsecureText = !obsecureText;
            });
          },
          child: Icon(
            obsecureText ? Icons.visibility_off_sharp : Icons.visibility_sharp,
            size: 20,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
