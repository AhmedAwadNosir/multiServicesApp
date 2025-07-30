import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:multiservices_app/core/services/firebase_servieces.dart';
import 'package:multiservices_app/features/auth/data/models/user_modal.dart';
import 'package:multiservices_app/features/home/chat/data/repos/chat_repo_impl.dart';
import 'package:multiservices_app/features/home/chat/presentation/views/chat_view.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/custom_profile_photo_circle_avatar.dart';

class FriendsItem extends StatefulWidget {
  const FriendsItem({super.key, required this.userModal});
  final UserModal userModal;

  @override
  State<FriendsItem> createState() => _FriendsItemState();
}

class _FriendsItemState extends State<FriendsItem> {
  late ChatRepoImpl chatRepoImpl;
  @override
  void initState() {
    chatRepoImpl = ChatRepoImpl(
      firebaseServieces: FirebaseServieces(),
      auth: FirebaseAuth.instance,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await chatRepoImpl.handleUserOnlineSatuslastSeenChatIn(
          reciverDocId: widget.userModal.docId!,
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatView(userModal: widget.userModal),
          ),
        );
      },
      child: Row(
        children: [
          CustomProfilePhotoCircleAvatar(
            profileImage: widget.userModal.profilImageLink,
          ),
          SizedBox(width: 12),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.65,
            child: Text(
              widget.userModal.userName,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
