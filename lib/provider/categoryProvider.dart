import 'package:flutter/foundation.dart';
import 'package:food_jc/models/Category.model.dart';

import 'package:food_jc/services/category.service.dart';

class CategoryProvider with ChangeNotifier {
  int _selectedCategory = 0;

  List<CategoryModel> _categories = [];
  int get selectedIndex => _selectedCategory;

  List<CategoryModel> get categories => _categories;

  Future<void> setSelectedCategory({required int selectedCategory}) async {
    _selectedCategory = selectedCategory;
    notifyListeners();
  }

  Future<void> addCategories() async {
    if (_categories.length == 0) {
      _categories = await CategoryService().getItems();
      notifyListeners();
    }
  }
}
