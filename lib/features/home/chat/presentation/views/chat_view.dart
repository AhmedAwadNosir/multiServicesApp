import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiservices_app/core/services/firebase_servieces.dart';
import 'package:multiservices_app/features/auth/data/models/user_modal.dart';
import 'package:multiservices_app/features/home/chat/data/repos/chat_repo_impl.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/chat_view_body.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/custom_profile_photo_circle_avatar.dart';
import 'package:multiservices_app/features/home/chat/states_manager/get_all_contacts/get_all_contacts_cubit.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key, required this.userModal});
  final UserModal userModal;

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
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
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        chatRepoImpl.handleUserOnlineSatusChatOut(
          reciverDocId: widget.userModal.docId!,
        );
        BlocProvider.of<GetAllContactsCubit>(context).getAllContacts();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 4,
          leadingWidth: double.infinity,
          leading: Row(
            children: [
              IconButton(
                onPressed: () {
                  chatRepoImpl.handleUserOnlineSatusChatOut(
                    reciverDocId: widget.userModal.docId!,
                  );
                  Navigator.pop(context);
                  BlocProvider.of<GetAllContactsCubit>(
                    context,
                  ).getAllContacts();
                },
                icon: Icon(Icons.arrow_back),
              ),

              CustomProfilePhotoCircleAvatar(
                profileImage: widget.userModal.profilImageLink,
                radius: 20,
              ),
              SizedBox(width: 6),
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
        ),
        body: ChatViewBody(reciverModal: widget.userModal),
      ),
    );
  }
}
