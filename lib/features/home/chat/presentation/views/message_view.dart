import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiservices_app/core/services/firebase_servieces.dart';
import 'package:multiservices_app/features/home/chat/data/repos/chat_repo_impl.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/messages_view_body.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/new_chat_bottom_sheet.dart';
import 'package:multiservices_app/features/home/chat/states_manager/get_all_contacts/get_all_contacts_cubit.dart';
import 'package:multiservices_app/features/home/chat/states_manager/get_friends/get_friends_cubit.dart';

class MessageView extends StatefulWidget {
  const MessageView({super.key});

  @override
  State<MessageView> createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView> {
  @override
  void initState() {
    BlocProvider.of<GetAllContactsCubit>(context).getAllContacts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            backgroundColor: Theme.of(context).colorScheme.surface,
            builder: (context) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: BlocProvider(
                  create:
                      (context) => GetFriendsCubit(
                        chatRepoImpl: ChatRepoImpl(
                          firebaseServieces: FirebaseServieces(),
                          auth: FirebaseAuth.instance,
                        ),
                      ),
                  child: NewChatBottomSheet(),
                ),
              );
            },
          );
        },
        backgroundColor: const Color(0xFF252525),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Icon(
          Icons.add_comment_sharp,
          size: 28,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      body: MessagesViewBody(),
    );
  }
}
