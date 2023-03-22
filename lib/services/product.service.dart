import 'dart:io';

import 'package:food_jc/mock/product.mock.dart';
import 'package:food_jc/models/Product.model.dart';

// import 'package:image_picker/image_picker.dart';
class ProductService {
  Future<List<ProductModel>> getItems() async {
    return products;
  }
}
