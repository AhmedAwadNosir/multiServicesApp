import 'package:flutter/material.dart';
import 'package:multiservices_app/features/home/chat/data/models/chat_room_modal.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/custom_profile_photo_circle_avatar.dart';
import 'package:intl/intl.dart';

class CustomChatRoomItem extends StatelessWidget {
  const CustomChatRoomItem({super.key, required this.chatRoomModal});
  final ChatRoomModal chatRoomModal;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomProfilePhotoCircleAvatar(
          profileImage: chatRoomModal.reciverProfileImage,
        ),
        SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.56,
              child: Text(
                chatRoomModal.reciver,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              DateFormat(
                'hh:mm a',
              ).format(chatRoomModal.lastUpdate.toDate()).toLowerCase(),
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
          ],
        ),
        Spacer(),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            shape: BoxShape.circle,
          ),

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.08,
              child: Text(
                chatRoomModal.numOfNewMessage.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
