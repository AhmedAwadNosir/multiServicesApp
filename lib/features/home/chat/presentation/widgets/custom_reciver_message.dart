import 'package:flutter/material.dart';

class CustomResiverMessage extends StatelessWidget {
  const CustomResiverMessage({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.70,
          ),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromARGB(255, 23, 192, 249),
                Color.fromARGB(255, 80, 214, 251),
              ],
            ),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Text(
            message,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
