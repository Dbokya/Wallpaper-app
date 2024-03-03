import 'package:flutter/material.dart';

abstract class _Admin {
  Future<void> saveWallpaper();
  Future<void> saveCategory();
}

class AdminProvider extends ChangeNotifier implements _Admin {
  String _categoryName = '';
  String get categoryName => _categoryName;
  set categoryName(String value) {
    _categoryName = value;
    _updateState();
  }

  String? _categoryImage;
  String? get categoryImage => _categoryImage;
  set categoryImage(String? value) {
    _categoryImage = value;
    _updateState();
  }

  String _selectedCategory = '';
  String get selectedCategory => _selectedCategory;
  set selectedCategory(String value) {
    _selectedCategory = value;
    _updateState();
  }

  String? _wallpaperImage;
  String? get wallpaperImage => _wallpaperImage;
  set wallpaperImage(String? value) {
    _wallpaperImage = value;
    _updateState();
  }

  final List<String> _wallpaperTags = [];
  List<String> get wallpaperTags => _wallpaperTags;
  void setWallPaperTags(String value) {
    if (!wallpaperTags.contains(value)) {
      _wallpaperTags.add(value);
    }
    _updateState();
  }

  void removeWallPaperTags(String value) {
    if (wallpaperTags.contains(value)) {
      _wallpaperTags.remove(value);
    }
    _updateState();
  }

  void _updateState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  List<String> adminActionList = ["Add Category", "Add Wallpaper"];

  @override
  Future<void> saveCategory() {
    // TODO: implement saveCategory
    throw UnimplementedError();
  }

  @override
  Future<void> saveWallpaper() {
    // TODO: implement saveWallpaper
    throw UnimplementedError();
  }
}
