import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallpaper_app/styles/color.dart';

class CategoryScreen extends StatefulWidget {
  final bool isAdmin;
  const CategoryScreen({super.key, this.isAdmin = false});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.isAdmin ? AppBar() : null,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: List.generate(20, (index) {
            return GestureDetector(
              onTap: () {
                if (widget.isAdmin) {
                  ///pop and send back category name
                  context.pop(index.toString());
                } else {
                  final name = {'category_name': 'category $index'};
                  context.push('/view_category', extra: name);
                }
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(bottom: 10),
                height: 120,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Category",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: white),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
