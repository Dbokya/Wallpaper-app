import 'package:flutter/material.dart';
import 'package:wallpaper_app/configs/extensions.dart';
import 'package:wallpaper_app/styles/color.dart';

class SettingScreens extends StatefulWidget {
  const SettingScreens({super.key});

  @override
  State<SettingScreens> createState() => _SettingScreensState();
}

class _SettingScreensState extends State<SettingScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Auto Change Wallpaper",
                  style: TextStyle(color: white, fontSize: 18),
                ),
                20.height(),
              ],
            ),
            const Spacer(),
            const Text(
              'Current Version v1.0.0',
              style: TextStyle(color: white),
            ),
          ],
        ),
      ),
    );
  }
}
