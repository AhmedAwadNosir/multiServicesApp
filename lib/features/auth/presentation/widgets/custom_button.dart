import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onPressed, required this.buttonName});
  final void Function()? onPressed;
  final String buttonName;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      child: Text(
        buttonName,
        style: TextStyle(
          color: Theme.of(context).colorScheme.secondary,

          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
