import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiservices_app/features/auth/data/models/user_modal.dart';
import 'package:multiservices_app/features/auth/functions/pick_image.dart';
import 'package:multiservices_app/features/home/chat/data/models/message_modal.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/create_message_text_form_field.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/pick_image_options.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/send_picked_image_widget.dart';
import 'package:multiservices_app/features/home/chat/states_manager/send_message/send_message_cubit.dart';

class CreateMessageContainerForm extends StatefulWidget {
  const CreateMessageContainerForm({
    super.key,
    required this.scrollController,
    required this.reciverUserModal,
  });
  final ScrollController scrollController;
  final UserModal reciverUserModal;

  @override
  State<CreateMessageContainerForm> createState() =>
      _CreateMessageContainerFormState();
}

class _CreateMessageContainerFormState
    extends State<CreateMessageContainerForm> {
  String messageContent = '';
  late TextEditingController _textEditingController;
  final FirebaseAuth auth = FirebaseAuth.instance;
  File? image;
  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.11,
      color: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.attach_file,
                size: 35,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            CreateMessageTextFormField(
              textEditingController: _textEditingController,
              suffixIcon: IconButton(
                onPressed: () async {
                  showModalBottomSheet(
                    context: context,
                    builder:
                        (context) => IntrinsicHeight(
                          child: PickImageOptions(
                            onCameraTap: () async {
                              image = await pickCameraImage();
                              setState(() {});
                              if (image != null) {
                                showModalBottomSheet(
                                  context: context,
                                  builder:
                                      (context) => SendPickedImageWidget(
                                        image: image,
                                        reciverModal: widget.reciverUserModal,
                                      ),
                                );
                              }
                            },
                            onGalleryTap: () async {
                              image = await pickGallaryImage();
                              setState(() {});
                              if (image != null) {
                                showModalBottomSheet(
                                  context: context,
                                  builder:
                                      (context) => SendPickedImageWidget(
                                        image: image,
                                        reciverModal: widget.reciverUserModal,
                                      ),
                                );
                              }
                            },
                          ),
                        ),
                  );
                  widget.scrollController.animateTo(
                    0.0,
                    duration: Duration(seconds: 2),
                    curve: Curves.bounceIn,
                  );
                  _textEditingController.clear();
                },
                icon: Icon(
                  Icons.image,
                  size: 33,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              onChanged: (value) {
                messageContent = value ?? "";
                setState(() {});
              },
            ),
            messageContent.isEmpty
                ? IconButton(
                  onPressed: () async {
                    widget.scrollController.animateTo(
                      0.0,
                      duration: Duration(seconds: 2),
                      curve: Curves.bounceIn,
                    );
                  },
                  icon: Icon(
                    Icons.mic,
                    size: 38,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                )
                : IconButton(
                  onPressed: () async {
                    BlocProvider.of<SendMessageCubit>(context).sendMessage(
                      messageModal: MessageModal(
                        chatRoom:
                            "${widget.reciverUserModal.docId!}${auth.currentUser!.uid}",
                        messageType: MessageType.text,
                        messageContent: messageContent,
                        messageTime: Timestamp.now(),
                        senderId: auth.currentUser!.uid,
                        seen: false,
                        delletReciver: false,
                        delletSender: false,
                      ),
                      reciverModal: widget.reciverUserModal,
                    );
                    widget.scrollController.animateTo(
                      0.0,
                      duration: Duration(seconds: 2),
                      curve: Curves.bounceIn,
                    );
                    _textEditingController.clear();
                  },
                  icon: Icon(
                    Icons.send,
                    size: 38,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
