import 'package:flutter/material.dart';
import 'package:wallpaper_app/admin/screens/admin_home.dart';
import 'package:wallpaper_app/category/screens/category_screen.dart';
import 'package:wallpaper_app/favourite/screens/favourite_screen.dart';
import 'package:wallpaper_app/home/screen/home_screen.dart';
import 'package:wallpaper_app/settings/screens/settings_screen.dart';

class HomeProvider extends ChangeNotifier {
  int _index = 0;
  int get index => _index;
  set setIndex(int value) {
    _index = value;
    notifyListeners();
  }

  List<Map> bottomNavItems = [
    {"label": "Home", "icon": Icons.home},
    {"label": "Category", "icon": Icons.category},
    {"label": "Favourite", "icon": Icons.favorite},
    {"label": "Settings", "icon": Icons.settings},
    {"label": "Admin", "icon": Icons.admin_panel_settings},
  ];

  List<Widget> bottomNavPages = [
    const HomeScreen(),
    const CategoryScreen(),
    const FavouriteScreen(),
    const SettingScreens(),
    const AdminHomeScreen()
  ];
}
