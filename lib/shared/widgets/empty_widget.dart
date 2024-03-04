import 'package:flutter/material.dart';
import 'package:wallpaper_app/configs/extensions.dart';
import 'package:wallpaper_app/styles/color.dart';

class EmtpyWidget extends StatelessWidget {
  final String title;
  const EmtpyWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset('assets/empty.png'),
          20.height(),
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: white),
          ),
        ],
      ),
    );
  }
}
