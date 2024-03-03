import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/configs/extensions.dart';
import 'package:wallpaper_app/search/provider/search_provider.dart';
import 'package:wallpaper_app/styles/color.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(builder: (context, state, child) {
      return Scaffold(
        appBar: AppBar(
          title: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            height: 30,
            alignment: Alignment.centerLeft,
            decoration:
                BoxDecoration(border: Border.all(color: white), borderRadius: BorderRadius.circular(10)),
            child: TextFormField(
              controller: searchController,
              onChanged: (value) {
                state.searchQuery = value;
              },
              onFieldSubmitted: (value) {
                state.search(value);
              },
              textInputAction: TextInputAction.search,
              style: const TextStyle(color: white),
              decoration: const InputDecoration(isDense: true, border: InputBorder.none),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    ///history search

                    //sample search history
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Sample Searches",
                          style: TextStyle(color: white, fontSize: 18),
                        ),
                        20.height(),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: List.generate(state.sampleSearches.length, (index) {
                            final data = state.sampleSearches[index];

                            return GestureDetector(
                              onTap: () {
                                searchController.text = data;

                                state.searchQuery = data;
                                //searchQuery
                                //state.search(data);
                              },
                              child: Chip(
                                label: Text(data),
                                backgroundColor: state.searchQuery == data ? white : black,
                              ),
                            );
                          }),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
