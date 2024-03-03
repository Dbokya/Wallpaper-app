import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallpaper_app/shared/widgets/wallpaper_widget.dart';
import 'package:wallpaper_app/styles/color.dart';

class CategoryViewScreen extends StatefulWidget {
  final String categoryName;

  const CategoryViewScreen({super.key, required this.categoryName});

  @override
  State<CategoryViewScreen> createState() => _CategoryViewScreenState();
}

class _CategoryViewScreenState extends State<CategoryViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          widget.categoryName,
          style: const TextStyle(color: white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.6, crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
          children: List.generate(
            20,
            (index) {
              return WallpaperWidget(
                url: '',
                onTap: () {
                  context.push('/view_wallpaper');
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
