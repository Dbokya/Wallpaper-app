import 'package:go_router/go_router.dart';
import 'package:wallpaper_app/admin/screens/add_category.dart';
import 'package:wallpaper_app/admin/screens/add_wallpaper.dart';
import 'package:wallpaper_app/category/screens/category_screen.dart';
import 'package:wallpaper_app/category/screens/view_category_screen.dart';
import 'package:wallpaper_app/home/screen/view_wallpaper.dart';
import 'package:wallpaper_app/onboarding/screens/onboarding_home.dart';
import 'package:wallpaper_app/search/screen/search_screen.dart';
import 'package:wallpaper_app/splash_screen.dart';
import 'package:wallpaper_app/root_screen/screens/root_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/on_boarding',
      builder: (context, state) => const OnboardingHome(),
    ),
    GoRoute(
      path: '/root',
      builder: (context, state) => const RootScreen(),
    ),
    GoRoute(
      path: '/view_wallpaper',
      builder: (context, state) => const ViewWallPaperScreen(),
    ),
    GoRoute(
      path: '/search',
      builder: (context, state) => const SearchScreen(),
    ),
    GoRoute(
      path: '/view_category',
      builder: (context, state) {
        final categoryName = (state.extra as Map)['category_name'];
        return CategoryViewScreen(
          categoryName: categoryName,
        );
      },
    ),
    //admin
    GoRoute(
      path: '/add_category',
      builder: (context, state) => const AddCategoryScreen(),
    ),
    GoRoute(
      path: '/add_wallpaper',
      builder: (context, state) => const AddWallpaperScreen(),
    ),

    GoRoute(
      path: '/category',
      builder: (context, state) {
        final isAdmin = (state.extra as Map)['is_admin'];
        return CategoryScreen(
          isAdmin: isAdmin,
        );
      },
    ),
  ],
);
