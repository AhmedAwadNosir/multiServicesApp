import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:multiservices_app/core/utils/app_images.dart';
import 'package:multiservices_app/features/home/chat/data/models/message_modal.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/audio_chat_buble.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/custom_file_widget.dart';
import 'package:intl/intl.dart';

class CustomSenderMessage extends StatelessWidget {
  const CustomSenderMessage({
    super.key,
    required this.message,
    required this.userAvatar,
  });
  final MessageModal message;
  final String userAvatar;
  // final MessageType messagetype;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.66,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  DateFormat('dd/MM/yyyy').format(message.messageTime.toDate()),
                  style: TextStyle(fontSize: 10),
                ),
                SizedBox(width: 50),
                message.messageType == MessageType.text
                    ? Text(
                      message.messageContent,
                      softWrap: true,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                    : (message.messageType == MessageType.image
                        ? SizedBox(
                          height: MediaQuery.of(context).size.height * 0.38,
                          width: MediaQuery.of(context).size.height * 0.35,
                          child: CachedNetworkImage(
                            imageUrl: message.messageContent,
                            fit: BoxFit.fill,
                          ),
                        )
                        : (message.messageType == MessageType.voiceRecord
                            ? AudioChatBuble(recordUrl: message.messageContent)
                            : CustomFileWidget(
                              fileUrl: message.messageContent,
                              message: message,
                            ))),
                SizedBox(width: 60),
                Text(
                  DateFormat(
                    'hh:mm a',
                  ).format(message.messageTime.toDate()).toLowerCase(),
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
