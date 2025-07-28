import 'package:flutter/material.dart';
import 'package:multiservices_app/core/utils/app_images.dart';
import 'package:multiservices_app/features/auth/data/models/user_modal.dart';
import 'package:multiservices_app/features/home/chat/data/models/user_modal.dart';
import 'package:multiservices_app/features/home/chat/presentation/views/chat_view.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/chat_view_body.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/custom_profile_photo_circle_avatar.dart';

class FriendsItem extends StatelessWidget {
  const FriendsItem({super.key, required this.userModal});
  final UserModal userModal;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatView(userModal: userModal),
          ),
        );
      },
      child: Row(
        children: [
          CustomProfilePhotoCircleAvatar(
            profileImage: userModal.profilImageLink,
          ),
          SizedBox(width: 12),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.65,
            child: Text(
              userModal.userName,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
