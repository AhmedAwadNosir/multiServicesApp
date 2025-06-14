import 'package:flutter/material.dart';
import 'package:multiservices_app/core/utils/app_images.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/custom_profile_photo_circle_avatar.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/custom_user_avatar.dart';

class CustomSenderMessage extends StatelessWidget {
  const CustomSenderMessage({
    super.key,
    required this.message,
    required this.userAvatar,
  });
  final String message;
  final String userAvatar;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          CustomProfilePhotoCircleAvatar(
            profileImage: AppImages.profilePhoto,
            radius: 28,
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.all(15),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.66,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(
              message,
              softWrap: true,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
