import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomProfilePhotoCircleAvatar extends StatelessWidget {
  const CustomProfilePhotoCircleAvatar({
    super.key,
    required this.profileImage,
    @required this.radius,
  });
  final String profileImage;
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius != null ? radius! + 3 : 33,
      child: CircleAvatar(
        radius: radius ?? 30,
        backgroundImage: CachedNetworkImageProvider(profileImage),
      ),
    );
  }
}
