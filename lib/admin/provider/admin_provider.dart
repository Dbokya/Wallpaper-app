import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/category/models/category_model.dart';
import 'package:wallpaper_app/configs/enums.dart';
import 'package:wallpaper_app/home/model/wallpaper_model.dart';
import 'package:wallpaper_app/shared/utils/upload_file.dart';

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

  final _categoryRef = FirebaseFirestore.instance.collection('category');
  final _wallpaperRef = FirebaseFirestore.instance.collection('wallpaper');

  ViewState viewState = ViewState.idle;
  String message = "";

  @override
  Future<void> saveCategory() async {
    viewState = ViewState.busy;
    _updateState();

    try {
      final urlString = await uploadDocumentToServer(_categoryImage!);

      if (urlString.state == ViewState.error) {
        viewState = ViewState.error;
        message = urlString.fileUrl;
        _updateState();
        return;
      }
      //success upload
      final payload = CategoryModel(
          categoryName: _categoryName,
          categoryImage: urlString.fileUrl,
          dateCreated: DateTime.now().millisecondsSinceEpoch);

      _categoryRef.add(payload.toJson());

      //clear values
      _categoryName = '';
      _categoryImage = null;

      viewState = ViewState.success;
      _updateState();
    } on FirebaseException catch (e) {
      message = e.code;
      viewState = ViewState.error;
      _updateState();
    } catch (e) {
      message = e.toString();
      viewState = ViewState.error;
      _updateState();
    }
  }

  @override
  Future<void> saveWallpaper() async {
    viewState = ViewState.busy;
    _updateState();

    try {
      final urlString = await uploadDocumentToServer(_wallpaperImage!);

      if (urlString.state == ViewState.error) {
        viewState = ViewState.error;
        message = urlString.fileUrl;
        _updateState();
        return;
      }
      //success upload
      final payload = WallpaperModel(
          categoryName: _selectedCategory,
          wallPaperImage: urlString.fileUrl,
          wallPaperTags: _wallpaperTags,
          dateCreated: DateTime.now().millisecondsSinceEpoch);

      _wallpaperRef.add(payload.toJson());

      //clear values
      _selectedCategory = '';
      _wallpaperImage = null;
      wallpaperTags.clear();

      viewState = ViewState.success;
      _updateState();
    } on FirebaseException catch (e) {
      message = e.code;
      viewState = ViewState.error;
      _updateState();
    } catch (e) {
      message = e.toString();
      viewState = ViewState.error;
      _updateState();
    }
  }
}
