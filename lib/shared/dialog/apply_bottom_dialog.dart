import 'package:flutter/material.dart';
import 'package:wallpaper_app/styles/color.dart';

void showAttachmentBottomSheet(BuildContext context,
    {VoidCallback? onHomeTapped, VoidCallback? onLockTapped, VoidCallback? onBothTapped}) {
  //
  showModalBottomSheet<void>(
    backgroundColor: black,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
    ),
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(
                Icons.camera,
                color: white,
              ),
              title: const Text(
                'Home Screen',
                style: TextStyle(color: white),
              ),
              onTap: () {
                Navigator.pop(context);
                onHomeTapped!();
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.camera,
                color: white,
              ),
              title: const Text(
                'Lock Screen',
                style: TextStyle(color: white),
              ),
              onTap: () {
                Navigator.pop(context);
                onLockTapped!();
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.image,
                color: white,
              ),
              title: const Text(
                'Both Screen',
                style: TextStyle(color: white),
              ),
              onTap: () {
                Navigator.pop(context);
                onBothTapped!();
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.cancel,
                color: white,
              ),
              title: const Text(
                'Cancel',
                style: TextStyle(color: white),
              ),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    },
  );
}
