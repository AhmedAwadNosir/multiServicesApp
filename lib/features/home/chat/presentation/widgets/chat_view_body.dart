import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiservices_app/core/functions/is_dark_mode.dart';
import 'package:multiservices_app/core/utils/app_images.dart';

import 'package:multiservices_app/features/auth/data/models/user_modal.dart';
import 'package:multiservices_app/features/home/chat/functions/get_all_messages_stream.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/create_message_container_bloc_consumer.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/message_list_view.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/no_user_found_message_container.dart';
import 'package:multiservices_app/features/home/chat/states_manager/update_chat_room/update_chat_room_cubit.dart';

class ChatViewBody extends StatefulWidget {
  const ChatViewBody({
    super.key,
    required this.reciverModal,
    required this.isUserExist,
  });
  final UserModal reciverModal;
  final bool isUserExist;
  @override
  State<ChatViewBody> createState() => _ChatViewBodyState();
}

class _ChatViewBodyState extends State<ChatViewBody> {
  late ScrollController scrollController;
  @override
  void initState() {
    scrollController = ScrollController();
    BlocProvider.of<UpdateChatRoomCubit>(
      context,
    ).updateChatRoom(newchatRoom: widget.reciverModal.chatRoom ?? "");
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: isDarkMode(),
      builder: (context, isDarkMode) {
        return Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                isDarkMode.data!
                    ? AppImages.chatBackground
                    : AppImages.chatBackgroundLight,
              ),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                BlocBuilder<UpdateChatRoomCubit, UpdateChatRoomState>(
                  builder: (context, state) {
                    return StreamBuilder(
                      stream: getallMessagesForContact(
                        userModal: widget.reciverModal,
                        chatRoom:
                            (state is UpdateChatRoomSuccess)
                                ? state.chatRoom
                                : "",
                      ),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text(snapshot.error.toString());
                        } else if (snapshot.hasData) {
                          return MessagesListView(
                            scrollController: scrollController,
                            messages: snapshot.data ?? [],
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          );
                        }
                      },
                    );
                  },
                ),

                widget.isUserExist
                    ? CreateMessageContainerBlocConsumer(
                      scrollController: scrollController,
                      reciverModal: widget.reciverModal,
                    )
                    : NotUserFoundMessageContainer(),
              ],
            ),
          ),
        );
      },
    );
  }
}
