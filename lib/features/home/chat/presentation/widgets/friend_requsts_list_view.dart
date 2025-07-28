import 'package:flutter/material.dart';
import 'package:multiservices_app/core/utils/app_images.dart';
import 'package:multiservices_app/features/auth/data/models/user_modal.dart';
import 'package:multiservices_app/features/home/chat/data/models/user_modal.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/custom_friend_req_item.dart';

class FreindRequstListView extends StatelessWidget {
  const FreindRequstListView({super.key, required this.users});

  final List<UserModal> users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: CustomFriendRequstItem(userData: users[index]),
        );
      },
    );
  }
}
