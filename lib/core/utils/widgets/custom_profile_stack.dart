import 'package:flutter/material.dart';
import 'package:multiservices_app/core/utils/widgets/custom_circle_container_image.dart';

class CustomProfileStack extends StatelessWidget {
  const CustomProfileStack({
    super.key,
    required this.coverImage,
    required this.profileImage,
  });
  final String coverImage;
  final String profileImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Positioned(
          top: 0,
          child: Image.asset(
            coverImage,
            fit: BoxFit.fill,
            height: MediaQuery.of(context).size.height * 0.21,
          ),
        ),
        Positioned(
          bottom: 0,
          child: CustomCircleContainerImage(image: profileImage),
        ),
      ],
    );
  }
}
