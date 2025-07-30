import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:multiservices_app/core/functions/download_subapase_file.dart';
import 'package:multiservices_app/core/functions/tregir_cubit_check_connectavity.dart';
import 'package:multiservices_app/core/utils/app_constants.dart';
import 'package:multiservices_app/features/auth/functions/show_error_dialog.dart';
import 'package:multiservices_app/features/home/chat/data/models/message_modal.dart';
import 'package:multiservices_app/generated/l10n.dart';
import 'package:path/path.dart' as p;
import 'package:open_file/open_file.dart';

class CustomFileWidget extends StatefulWidget {
  const CustomFileWidget({
    super.key,
    required this.fileUrl,
    required this.message,
  });
  final String fileUrl;
  final MessageModal message;
  @override
  State<CustomFileWidget> createState() => _CustomFileWidgetState();
}

class _CustomFileWidgetState extends State<CustomFileWidget> {
  late FirebaseFirestore firestore;
  bool isLoaidng = false;
  @override
  void initState() {
    firestore = FirebaseFirestore.instance;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final extension = p.extension(widget.fileUrl); // e.g. ".xlsx"
    String downloadedFilePath = widget.message.localPath;
    final nameWithoutExt = p.basenameWithoutExtension(widget.fileUrl);
    return Column(
      children: [
        Icon(
          extension == "pdf"
              ? Icons.picture_as_pdf
              : (extension == "doc" || extension == "docs"
                  ? Icons.description
                  : Icons.insert_drive_file),
          size: 75,
        ),
        SizedBox(width: 12),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Text(
            nameWithoutExt,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),

        Text(' ${extension}'),

        SizedBox(height: 12),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            backgroundColor: Theme.of(context).colorScheme.secondary,
            textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          onPressed: () async {
            if (widget.message.downloaded == null ||
                widget.message.downloaded == false) {
              var hasInternetAcess =
                  await InternetConnection().hasInternetAccess;
              if (!hasInternetAcess) {
                showErrorConectionDialog(context: context);
              } else {
                try {
                  setState(() {
                    isLoaidng = true;
                  });
                  downloadedFilePath = await downloadFile(widget.fileUrl);
                  firestore
                      .collection(AppConstants.chatColection)
                      .doc(widget.message.docId)
                      .set({
                        "downloaded": true,
                        "localPath": downloadedFilePath,
                      }, SetOptions(merge: true));
                } catch (e) {
                  showErrorDialog(context: context, errorMessage: e.toString());
                }
                setState(() {
                  isLoaidng = false;
                });
              }
            } else {
              OpenFile.open(downloadedFilePath);
            }
          },
          child:
              isLoaidng
                  ? SizedBox(
                    height: 23,
                    width: 50,
                    child: CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  )
                  : Text(
                    widget.message.downloaded == null
                        ? S.of(context).Download
                        : (widget.message.downloaded == true
                            ? S.of(context).Open
                            : S.of(context).Download),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
        ),
        SizedBox(height: 6),
      ],
    );
  }
}
