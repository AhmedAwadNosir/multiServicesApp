import 'package:flutter/material.dart';
import 'package:multiservices_app/features/home/chat/presentation/views/message_view.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/add_friends_view_body.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/custom_tap_par.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/friend_requsts_view_Body.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/messages_view_body.dart';

class ChatTap extends StatefulWidget {
  const ChatTap({super.key});

  @override
  State<ChatTap> createState() => _ChatTapState();
}

class _ChatTapState extends State<ChatTap> {
  int numOfFriendReq = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          SizedBox(height: 20),
          CustomTapBar(numOfFriendReq: numOfFriendReq),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.69,
            child: TabBarView(
              children: [
                MessageView(),
                AddFriendsViewBody(),
                FriendRequstsViewBody(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
