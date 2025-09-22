import 'package:flutter/material.dart';

class CustomCircleContainerImage extends StatelessWidget {
  const CustomCircleContainerImage({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        shape: BoxShape.circle,

        image: DecorationImage(fit: BoxFit.fill, image: AssetImage(image)),
      ),
    );
  }
}
