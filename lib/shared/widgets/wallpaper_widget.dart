import 'package:flutter/material.dart';
import 'package:wallpaper_app/styles/color.dart';

class WallpaperWidget extends StatelessWidget {
  final String url;
  final VoidCallback onTap;
  const WallpaperWidget({super.key, required this.url, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(15)),
        child: const Text(
          "Hello image",
          style: TextStyle(color: white),
        ),
      ),
    );
  }
}
