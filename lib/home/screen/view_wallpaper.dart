import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/shared/dialog/apply_bottom_dialog.dart';
import 'package:wallpaper_app/styles/color.dart';

class ViewWallPaperScreen extends StatefulWidget {
  final String url;
  const ViewWallPaperScreen({super.key, required this.url});

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
          Expanded(
              child: CachedNetworkImage(
            imageUrl: widget.url,
            fit: BoxFit.cover,
          )),
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
