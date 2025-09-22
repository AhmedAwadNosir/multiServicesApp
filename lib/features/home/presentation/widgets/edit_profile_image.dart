import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:multiservices_app/features/auth/data/models/user_modal.dart';

class EditProfileImageWidget extends StatelessWidget {
  const EditProfileImageWidget({
    super.key,
    required this.pickedImage,
    required this.userData,
    required this.onPressed,
    required this.pickedImageUrl,
  });

  final File? pickedImage;
  final UserModal userData;
  final String? pickedImageUrl;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipOval(
          child:
              pickedImage != null
                  ? Image.file(
                    pickedImage!,
                    fit: BoxFit.fill,
                    height: 150,
                    width: 150,
                  )
                  : (pickedImageUrl != null
                      ? CachedNetworkImage(
                        imageUrl: pickedImageUrl!,
                        fit: BoxFit.fill,
                        height: 150,
                        width: 150,
                      )
                      : CachedNetworkImage(
                        imageUrl: userData.profilImageLink,
                        fit: BoxFit.fill,
                        height: 150,
                        width: 150,
                      )),
        ),
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            Icons.edit_note_outlined,
            size: 55,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
