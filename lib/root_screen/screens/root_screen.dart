import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/configs/extensions.dart';
import 'package:wallpaper_app/styles/color.dart';
import 'package:wallpaper_app/root_screen/provider/root_provider.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, state, child) {
      return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              if (state.index == 0)
                GestureDetector(
                  onTap: () {
                    context.push('/search');
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: 30,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        border: Border.all(color: white), borderRadius: BorderRadius.circular(10)),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: white,
                          size: 16,
                        ),
                        Text(
                          '  Search Wallpaper',
                          style: TextStyle(color: white),
                        ),
                      ],
                    ),
                  ),
                ),
              20.height(),
              Expanded(child: state.bottomNavPages[state.index]),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: black,
          type: BottomNavigationBarType.fixed,
          currentIndex: state.index,
          onTap: (value) {
            state.setIndex = value;
          },
          selectedItemColor: primaryColor,
          items: List.generate(
            state.bottomNavItems.length,
            (index) {
              final data = state.bottomNavItems[index];
              return BottomNavigationBarItem(
                icon: Icon(data['icon'], color: state.index == index ? primaryColor : white),
                label: data['label'],
              );
            },
          ),
        ),
      );
    });
  }
}
