import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/admin/provider/admin_provider.dart';
import 'package:wallpaper_app/authentication/provider/auth.dart';
import 'package:wallpaper_app/configs/routers.dart';
import 'package:wallpaper_app/firebase_options.dart';
import 'package:wallpaper_app/onboarding/provider/state_provider.dart';
import 'package:wallpaper_app/search/provider/search_provider.dart';
import 'package:wallpaper_app/styles/color.dart';
import 'package:wallpaper_app/root_screen/provider/root_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => OnboardingProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AdminProvider(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
              centerTitle: true,
              scrolledUnderElevation: 0,
              backgroundColor: Colors.transparent,
              iconTheme: IconThemeData(color: white)),
          scaffoldBackgroundColor: black,
          primaryColor: primaryColor,
        ),
      ),
    );
  }
}
