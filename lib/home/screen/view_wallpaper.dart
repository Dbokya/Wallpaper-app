import 'package:flutter/material.dart';
import 'package:wallpaper_app/shared/dialog/apply_bottom_dialog.dart';
import 'package:wallpaper_app/styles/color.dart';

class ViewWallPaperScreen extends StatefulWidget {
  const ViewWallPaperScreen({super.key});

  @override
  State<ViewWallPaperScreen> createState() => _ViewWallPaperScreenState();
}

class _ViewWallPaperScreenState extends State<ViewWallPaperScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border,
              color: white,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const Expanded(
            child: Icon(Icons.house),
          ),
          Container(
            margin: const EdgeInsets.all(50),
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(primaryColor),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: const BorderSide(color: white)))),
                      onPressed: () async {
                        showAttachmentBottomSheet(
                          context,
                          onBothTapped: () {},
                          onHomeTapped: () {},
                          onLockTapped: () {},
                        );
                      },
                      child: const Text(
                        'Apply Wallpaper',
                        style: TextStyle(color: white),
                      )),
                ),
                const Spacer(),
                FloatingActionButton(
                  backgroundColor: white,
                  mini: true,
                  onPressed: () {},
                  child: const Icon(
                    Icons.ios_share,
                    color: primaryColor,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
