import 'package:flutter/material.dart';
import 'package:multiservices_app/features/home/chat/data/models/user_modal.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/chat_view_body.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/custom_profile_photo_circle_avatar.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key, required this.userModal});
  final FriendUserModal userModal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        leadingWidth: double.infinity,
        leading: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
            ),

            CustomProfilePhotoCircleAvatar(
              profileImage: userModal.profileImage,
              radius: 20,
            ),
            SizedBox(width: 6),
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
      ),
      body: ChatViewBody(),
    );
  }
}
