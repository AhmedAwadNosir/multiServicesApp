import 'package:flutter/material.dart';
import 'package:multiservices_app/features/auth/data/models/user_modal.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/friend_item.dart';

class FreindListView extends StatelessWidget {
  const FreindListView({super.key, required this.users});

  final List<UserModal> users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: users.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: FriendsItem(userModal: users[index]),
        );
      },
    );
  }
}
