import 'package:flutter/material.dart';
import 'package:multiservices_app/core/utils/app_images.dart';
import 'package:multiservices_app/features/home/chat/data/models/user_modal.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/friend_item.dart';

class FreindListView extends StatefulWidget {
  const FreindListView({super.key});

  @override
  State<FreindListView> createState() => _FreindListViewState();
}

class _FreindListViewState extends State<FreindListView> {
  List<FriendUserModal> users = [
    FriendUserModal(
      docId: "",
      userName: "Ahemd Awad Mohamed Awad Nosir",
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
