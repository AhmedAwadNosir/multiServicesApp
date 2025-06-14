import 'package:flutter/material.dart';

class CustomUserAvatar extends StatelessWidget {
  const CustomUserAvatar({
    super.key,
    @required this.hieght,
    @required this.width,
    required this.avatar,
    required this.avatarColor,
  });
  final double? hieght;
  final double? width;
  final String avatar;
  final Color avatarColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: hieght ?? 75,
      width: width ?? 75,
      decoration: BoxDecoration(
        color: avatarColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Image.asset(avatar),
    );
  }
}
