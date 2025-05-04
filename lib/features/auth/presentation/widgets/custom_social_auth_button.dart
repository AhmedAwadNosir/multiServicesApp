import 'package:flutter/material.dart';

class CustomSocialAuthButton extends StatelessWidget {
  const CustomSocialAuthButton({
    super.key,
    required this.backgroundColor,
    this.onPressed,
    required this.buttonName,
    required this.buttonNameColor,
    required this.socialAuthIcon,
  });
  final Color backgroundColor;
  final void Function()? onPressed;
  final String buttonName;
  final Color buttonNameColor;
  final String socialAuthIcon;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            buttonName,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: buttonNameColor,
            ),
          ),
          const SizedBox(width: 6),
          Image.asset(socialAuthIcon, height: 30),
        ],
      ),
    );
  }
}
