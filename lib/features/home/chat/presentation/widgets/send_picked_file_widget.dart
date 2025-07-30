import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
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

class SendPickedFileWidget extends StatefulWidget {
  const SendPickedFileWidget({
    super.key,
    required this.file,
    required this.reciverModal,
  });

  final PlatformFile file;
  final UserModal reciverModal;

  @override
  State<SendPickedFileWidget> createState() => _SendPickedFileWidgetState();
}

class _SendPickedFileWidgetState extends State<SendPickedFileWidget> {
  @override
  Widget build(BuildContext context) {
    final fileextintion = widget.file.name.split('.').last.toLowerCase();
    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 25),
        child: Column(
          children: [
            Row(),
            Icon(
              fileextintion == "pdf"
                  ? Icons.picture_as_pdf
                  : (fileextintion == "doc" || fileextintion == "docs"
                      ? Icons.description
                      : Icons.insert_drive_file),
              size: 75,
            ),
            SizedBox(width: 24),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Text(
                widget.file.name,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Text('${(widget.file.size / 1024).toStringAsFixed(2)} KB'),
            if (widget.file.extension != null)
              Text('Ext: .${widget.file.extension}'),

            SizedBox(height: 24),
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
                  String? fileDownloadUrl;
                  String fileAlterName = widget.file.name
                      .toLowerCase()
                      .replaceAll(' ', '_')
                      .replaceAll(RegExp(r'[^\w\.\-_]'), '');
                  final storagePath = 'files/$fileAlterName';
                  try {
                    fileDownloadUrl = await uploadfileGetUrl(
                      file: File(widget.file.path!),
                      imagePaht: AppConstants.filesPaht,
                      folderBocketName: AppConstants.filesPocketPaht,
                      fullPath: storagePath,
                    );
                  } catch (e) {
                    showErrorDialog(
                      context: context,
                      errorMessage: e.toString(),
                    );
                  }
                  if (fileDownloadUrl != null) {
                    Navigator.pop(context);
                    FirebaseAuth auth = FirebaseAuth.instance;
                    await BlocProvider.of<SendMessageCubit>(
                      context,
                    ).sendMessage(
                      messageModal: MessageModal(
                        chatRoom:
                            "${widget.reciverModal.docId!}${auth.currentUser!.uid}",
                        messageType: MessageType.file,
                        messageContent: fileDownloadUrl,
                        messageTime: Timestamp.now(),
                        senderId: auth.currentUser!.uid,
                        seen: false,
                        delletReciver: false,
                        delletSender: false,
                        downloaded: false,
                        localPath: "",
                      ),
                      reciverModal: widget.reciverModal,
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
          ],
        ),
      ),
    );
  }
}
