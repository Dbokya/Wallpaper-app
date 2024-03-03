import 'package:flutter/material.dart';

abstract class _Search {
  Future<void> search(String query);
}

class SearchProvider extends ChangeNotifier implements _Search {
  String _searchQuery = '';
  String get searchQuery => _searchQuery;
  set searchQuery(String value) {
    _searchQuery = value;
    _updateState();
  }

  List<String> sampleSearches = ['love', 'animal', 'cool', 'car', 'dark', 'natural', 'fashion', 'beauty'];

  void _updateState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  @override
  Future<void> search(String query) async {
    // TODO: implement search
    throw UnimplementedError();
  }
}
