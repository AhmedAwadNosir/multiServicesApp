import 'package:flutter/material.dart';
import 'package:multiservices_app/features/home/notes/functions/build_outlined_input_border.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    this.onChanged,
    this.controller,
    required this.hintText,
  });
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 38,
          vertical: 11,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
        border: buildOutlinedPorder(radius: 30, context: context),
        enabledBorder: buildOutlinedPorder(radius: 30, context: context),
        focusedBorder: buildOutlinedPorder(radius: 30, context: context),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
            onPressed: () {
              controller!.clear();
            },
            icon: const Icon(Icons.close),
          ),
        ),
      ),
    );
  }
}
