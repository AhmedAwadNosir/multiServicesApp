import 'package:flutter/material.dart';

import 'package:multiservices_app/features/home/chat/data/models/contac_modal.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/custom_profile_photo_circle_avatar.dart';
import 'package:intl/intl.dart';

class CustomChatRoomItem extends StatelessWidget {
  const CustomChatRoomItem({super.key, required this.chatRoom});
  final ContactModal chatRoom;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomProfilePhotoCircleAvatar(profileImage: chatRoom.image),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.56,
                  child: Text(
                    chatRoom.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 5),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.56,
                  child: Text(
                    chatRoom.lastMessage,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w200),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  DateFormat(
                    'hh:mm a',
                  ).format(chatRoom.lastMessageTime.toDate()).toLowerCase(),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                SizedBox(height: 7),
                chatRoom.numOfNewMessages == 0
                    ? SizedBox(height: 7)
                    : Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        shape: BoxShape.circle,
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.08,
                          child: Text(
                            chatRoom.numOfNewMessages.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
