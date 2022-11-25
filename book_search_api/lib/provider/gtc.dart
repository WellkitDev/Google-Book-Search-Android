import 'dart:convert';

import 'package:book_search_api/models/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class GTC with ChangeNotifier {
  bool _loaded = false;
  List<Category> _categories = [];
  String _selectedCategory = '';

  bool get isLoaded {
    return _loaded;
  }

  List<Category> get getAllCategories {
    return [..._categories];
  }

  void setLoading(bool loadingState) {
    _loaded = loadingState;
    notifyListeners();
  }

  String get getSelectedCategory {
    return _selectedCategory;
  }

  Future<void> getCategoryList() async {
    var apiKey = 'AIzaSyCyaYPcKzMDM_AumbHzH330OMJqnZk3Ww8';
    final url =
        'https://www.googleapis.com/svc/books/v3/Lists/names.json?api-key=$apiKey';
    try {
      http.Response response = await http.get(url);
      var jsonResponse = await jsonDecode(response.body);
      List categoriesJsonList = jsonResponse['result'];

      List<Category> categories = [];
      categoriesJsonList.forEach((category) {
        categories.add(Category(
          categoryLink: category['list_name_encoded'],
          categoryTitle: category['display_name'],
          oldData: category['oldest_published_date'],
          newData: category['newest_published_date'],
          updated: category['updated'],
        ));
      });
      _categories = categories;
      await null;
    } catch (e) {
      print(e);
    }
  }
}
