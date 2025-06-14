import 'package:flutter/material.dart';
import 'package:multiservices_app/core/utils/app_images.dart';
import 'package:multiservices_app/features/auth/data/models/user_modal.dart';
import 'package:multiservices_app/features/home/chat/data/models/user_modal.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/custom_add_firend_item.dart';

class UsersListView extends StatefulWidget {
  const UsersListView({super.key});

  @override
  State<UsersListView> createState() => _UsersListViewState();
}

class _UsersListViewState extends State<UsersListView> {
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
          child: CustomAddFriendItem(userData: users[index]),
        );
      },
    );
  }
}
