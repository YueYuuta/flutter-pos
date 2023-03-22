import 'package:flutter/material.dart';
import 'package:food_jc/models/Category.model.dart';

class CategoriesWidget extends StatelessWidget {
  CategoriesWidget({required this.categories, super.key});
  List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 1; i < categories.length; i++)
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    categories[i].Image,
                    width: 40,
                    height: 40,
                  ),
                  Text(
                    categories[i].CategoryDescription,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xFF4C53A5),
                    ),
                  )
                ],
              ),
            )
        ],
      ),
    );
  }
}
