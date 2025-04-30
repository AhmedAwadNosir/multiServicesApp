import 'package:flutter/material.dart';

class CustomCirclarContainer extends StatelessWidget {
  const CustomCirclarContainer({super.key, required this.title, this.color});
  final String title;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).primaryColor,

        shape: BoxShape.circle,
      ),
      padding: EdgeInsets.all(30),
      child: SizedBox(
        height: title.length * 5.5,
        width: 62,
        child: Text(
          title,
          textAlign: TextAlign.center,
          softWrap: true,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
