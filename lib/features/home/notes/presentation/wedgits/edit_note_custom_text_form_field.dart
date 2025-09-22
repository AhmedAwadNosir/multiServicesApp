import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class EditNoteCustomTextFormFilled extends StatelessWidget {
  const EditNoteCustomTextFormFilled({
    super.key,
    this.onSaved,
    required this.hint,
    @required this.maxLines,
    @required this.intialValue,
    @required this.fontSize,
    @required this.fontWeight,
    @required this.hintFontSize,
    @required this.maxLength,
    @required this.textColor,
    this.onChanged,
    @required this.enabledBorder,
    @required this.foucsedBorder,
    @required this.suffixIcon,
    @required this.textAlign,
    @required this.textEditingController,
  });
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final String hint;
  final int? maxLines;
  final String? intialValue;
  final double? fontSize;
  final double? hintFontSize;
  final FontWeight? fontWeight;
  final int? maxLength;
  final Color? textColor;
  final InputBorder? enabledBorder;
  final InputBorder? foucsedBorder;
  final Widget? suffixIcon;
  final TextAlign? textAlign;
  final TextEditingController? textEditingController;
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: textAlign ?? TextAlign.start,
      onSaved: onSaved,
      onChanged: onChanged,
      maxLength: maxLength,
      controller: textEditingController,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Filed is required";
        }
      },
      maxLines: maxLines,
      initialValue: intialValue,
      style: TextStyle(
        fontSize: fontSize ?? 20,
        color: textColor ?? Colors.white,
        fontWeight: fontWeight,
      ),
      decoration: InputDecoration(
        enabledBorder: enabledBorder ?? InputBorder.none,
        focusedBorder: foucsedBorder ?? InputBorder.none,
        border: enabledBorder ?? InputBorder.none,

        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: hintFontSize ?? fontSize ?? 22,
          fontWeight: FontWeight.w300,
        ),
        suffixIcon: suffixIcon,
      ),
      enableSuggestions: true,
    );
  }
}
