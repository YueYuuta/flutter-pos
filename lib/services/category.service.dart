import 'dart:io';

import 'package:food_jc/mock/Category.mock.dart';
import 'package:food_jc/models/Category.model.dart';

// import 'package:image_picker/image_picker.dart';
class CategoryService {
  Future<List<CategoryModel>> getItems() async {
    return categories;
  }
}
