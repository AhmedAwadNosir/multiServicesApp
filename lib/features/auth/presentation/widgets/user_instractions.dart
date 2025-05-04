import 'package:flutter/material.dart';

class UserInstractions extends StatelessWidget {
  const UserInstractions({
    super.key,
    required this.userQution,
    required this.userDestenation,
    this.onTap,
  });
  final String userQution;
  final String userDestenation;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          userQution,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        const SizedBox(width: 6),
        GestureDetector(
          onTap: onTap,
          child: Text(
            userDestenation,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
        ),
      ],
    );
  }
}
