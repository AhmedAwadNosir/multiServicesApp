import 'dart:io';

import 'package:flutter/material.dart';
import 'package:multiservices_app/generated/l10n.dart';

class CustomIMagePickerContainer extends StatelessWidget {
  const CustomIMagePickerContainer({
    super.key,
    required this.image,
    this.onTap,
  });

  final File? image;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 170,
        width: 170,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        child:
            image != null
                ? ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.file(image!, fit: BoxFit.cover),
                )
                : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, size: 70),
                    Text(
                      S.of(context).choosprofilephoto,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
      ),
    );
  }
}
