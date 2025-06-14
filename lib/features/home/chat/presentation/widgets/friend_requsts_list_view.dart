import 'package:flutter/material.dart';
import 'package:multiservices_app/core/utils/app_images.dart';
import 'package:multiservices_app/features/home/chat/data/models/user_modal.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/custom_friend_req_item.dart';

class FreindRequstListView extends StatefulWidget {
  const FreindRequstListView({super.key});

  @override
  State<FreindRequstListView> createState() => _FreindRequstListViewState();
}

class _FreindRequstListViewState extends State<FreindRequstListView> {
  List<FriendUserModal> users = [
    FriendUserModal(
      docId: "",
      userName: "Ahemd Awad",
      profileImage: AppImages.profilePhoto,
    ),
    FriendUserModal(
      docId: "",
      userName: "Yousef Awad",
      profileImage: AppImages.profilePhoto,
    ),
    FriendUserModal(
      docId: "",
      userName: "Ahemd Awad",
      profileImage: AppImages.profilePhoto,
    ),
    FriendUserModal(
      docId: "",
      userName: "Yousef Awad",
      profileImage: AppImages.profilePhoto,
    ),
    FriendUserModal(
      docId: "",
      userName: "Ahemd Awad",
      profileImage: AppImages.profilePhoto,
    ),
    FriendUserModal(
      docId: "",
      userName: "Yousef Awad",
      profileImage: AppImages.profilePhoto,
    ),
  ];
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
