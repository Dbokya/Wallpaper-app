import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/configs/enums.dart';
import 'package:wallpaper_app/home/model/wallpaper_model.dart';

abstract class _WallPaper {
  Future<void> fetchRecentWallpaper();
  Future<void> fetchWallpaperByCategory(String categoryName);
}

class WallPaperProvider extends ChangeNotifier implements _WallPaper {
  List<WallpaperModel> _recentWallpapers = [];
  List<WallpaperModel> get recentWallpapers => _recentWallpapers;

  List<WallpaperModel> _categoryWallpapers = [];
  List<WallpaperModel> get categoryWallpapers => _categoryWallpapers;

  final _wallpaperRef = FirebaseFirestore.instance.collection('wallpaper');

  ViewState viewState = ViewState.idle;
  String message = "";

  void _updateState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  @override
  Future<void> fetchRecentWallpaper() async {
    viewState = ViewState.busy;
    _updateState();

    try {
      final result = await _wallpaperRef.get();

      List<WallpaperModel> tempList = [];

      if (result.docs.isNotEmpty) {
        for (var i in result.docs) {
          tempList.add(WallpaperModel.fromJson(i.data()));
        }
      }

      _recentWallpapers = tempList;

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
  Future<void> fetchWallpaperByCategory(String categoryName) async {
    viewState = ViewState.busy;
    _updateState();

    try {
      final result = await _wallpaperRef.where('category_name', isEqualTo: categoryName).get();

      List<WallpaperModel> tempList = [];

      if (result.docs.isNotEmpty) {
        for (var i in result.docs) {
          tempList.add(WallpaperModel.fromJson(i.data()));
        }
      }

      _categoryWallpapers = tempList;

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
