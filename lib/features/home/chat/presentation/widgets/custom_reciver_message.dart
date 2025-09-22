import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:multiservices_app/features/home/chat/data/models/message_modal.dart';
import 'package:intl/intl.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/audio_chat_buble.dart';
import 'package:multiservices_app/features/home/chat/presentation/widgets/custom_file_widget.dart';

class CustomResiverMessage extends StatelessWidget {
  const CustomResiverMessage({super.key, required this.message});
  final MessageModal message;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.70,
          ),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromARGB(255, 23, 192, 249),
                Color.fromARGB(255, 80, 214, 251),
              ],
            ),
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
    );
  }
}
