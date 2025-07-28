import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:multiservices_app/core/functions/tregir_cubit_check_connectavity.dart';
import 'package:multiservices_app/core/utils/app_constants.dart';
import 'package:multiservices_app/features/auth/data/models/user_modal.dart';
import 'package:multiservices_app/features/auth/functions/show_error_dialog.dart';
import 'package:multiservices_app/features/auth/functions/upload_image_geturl.dart';
import 'package:multiservices_app/features/home/chat/data/models/message_modal.dart';
import 'package:multiservices_app/features/home/chat/states_manager/send_message/send_message_cubit.dart';

class SendPickedImageWidget extends StatelessWidget {
  const SendPickedImageWidget({
    super.key,
    required this.image,
    required this.reciverModal,
  });

  final File? image;
  final UserModal reciverModal;
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.44,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: FileImage(image!),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: 12),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              backgroundColor: Theme.of(context).colorScheme.primary,
              textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            onPressed: () async {
              var hasInternetAcess =
                  await InternetConnection().hasInternetAccess;
              if (!hasInternetAcess) {
                showErrorConectionDialog(context: context);
              } else {
                String? imgdonloadUrl;
                try {
                  imgdonloadUrl = await uploadProfilegetUrl(
                    profileImage: image!,
                    imagePaht: AppConstants.messageImagesPaht,
                  );
                } catch (e) {
                  showErrorDialog(context: context, errorMessage: e.toString());
                }
                if (imgdonloadUrl != null) {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  FirebaseAuth auth = FirebaseAuth.instance;
                  await BlocProvider.of<SendMessageCubit>(context).sendMessage(
                    messageModal: MessageModal(
                      chatRoom:
                          "${reciverModal.docId!}${auth.currentUser!.uid}",
                      messageType: MessageType.image,
                      messageContent: imgdonloadUrl,
                      messageTime: Timestamp.now(),
                      senderId: auth.currentUser!.uid,
                      seen: false,
                      delletReciver: false,
                      delletSender: false,
                    ),
                    reciverModal: reciverModal,
                  );
                }
              }
            },
            child: Icon(
              Icons.send_rounded,
              size: 36,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}
