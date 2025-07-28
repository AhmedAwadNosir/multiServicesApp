import 'package:flutter/material.dart';

class PickImageOptions extends StatelessWidget {
  const PickImageOptions({
    super.key,
    required this.onCameraTap,
    required this.onGalleryTap,
  });
  final void Function()? onCameraTap;
  final void Function()? onGalleryTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Column(
          children: [
            Card(
              color: Theme.of(context).colorScheme.primary,
              child: ListTile(
                onTap: onCameraTap,
                leading: Icon(Icons.camera_alt_rounded),
                title: Text("Camera"),
              ),
            ),
            Card(
              color: Theme.of(context).colorScheme.primary,
              child: ListTile(
                onTap: onGalleryTap,
                leading: Icon(Icons.photo),
                title: Text("Gallery"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
