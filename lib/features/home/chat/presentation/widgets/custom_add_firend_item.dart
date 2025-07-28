import 'package:flutter/material.dart';

import 'package:multiservices_app/features/auth/data/models/user_modal.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/add_friend_button_bloc_consumer.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/custom_profile_photo_circle_avatar.dart';

class CustomAddFriendItem extends StatelessWidget {
  const CustomAddFriendItem({super.key, required this.userData});
  final UserModal userData;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomProfilePhotoCircleAvatar(profileImage: userData.profilImageLink),
        SizedBox(width: 12),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.40,
          child: Text(
            userData.userName,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Spacer(),
        AddFreindButtonBlocConsumer(userData: userData),
      ],
    );
  }
}
