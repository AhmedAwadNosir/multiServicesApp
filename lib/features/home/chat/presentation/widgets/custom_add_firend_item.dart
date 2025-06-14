import 'package:flutter/material.dart';
import 'package:multiservices_app/features/home/chat/data/models/user_modal.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/custom_profile_photo_circle_avatar.dart';
import 'package:multiservices_app/generated/l10n.dart';

class CustomAddFriendItem extends StatelessWidget {
  const CustomAddFriendItem({super.key, required this.userData});
  final FriendUserModal userData;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomProfilePhotoCircleAvatar(profileImage: userData.profileImage),
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
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            padding: EdgeInsets.all(10),
          ),
          child: Row(
            children: [
              Text(
                S.of(context).AddFriend,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              Icon(Icons.add, color: Theme.of(context).colorScheme.secondary),
            ],
          ),
        ),
      ],
    );
  }
}
