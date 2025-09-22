import 'package:flutter/material.dart';

class CustomConfarmationButton extends StatelessWidget {
  const CustomConfarmationButton({
    super.key,
    this.onPressed,
    required this.buttonName,
    required this.buttonColor,
  });
  final void Function()? onPressed;
  final String buttonName;
  final Color buttonColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: buttonColor,
      ),
      onPressed: onPressed,
      child: Text(
        buttonName,
        style: const TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}
