import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food_jc/mock/product.mock.dart';
import 'package:food_jc/models/Category.model.dart';
import 'package:food_jc/provider/ProductProvider.dart';
import 'package:food_jc/provider/categoryProvider.dart';
import 'package:food_jc/widgets/CategoriesWidget.dart';
import 'package:food_jc/widgets/ItemsWidget.dart';
import 'package:provider/provider.dart';

import '../widgets/HomeAppBar.dart';

class SalesPage extends StatelessWidget {
  const SalesPage({super.key});
  _init(
      {required ProductProvider productState,
      required CategoryProvider categoryState}) {
    productState.addProducts();
    categoryState.addCategories();
  }

  @override
  Widget build(BuildContext context) {
    ProductProvider productState = context.watch<ProductProvider>();
    CategoryProvider categoryState = context.watch<CategoryProvider>();
    List<CategoryModel> categories = categoryState.categories;
    _init(productState: productState, categoryState: categoryState);
    return ListView(physics: BouncingScrollPhysics(), children: [
      HomeAppBar(TotalItemBaged: productState.totalItemBaged),
      productState.loadingMain
          ? SizedBox(
              // color: Colors.red,
              height: 600,
              child: SpinKitDoubleBounce(
                color: Color(0xFF4C53A5),
                size: 50.0,
              ),
            )
          : Container(
              // height: 500,
              padding: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                color: Color(0xFFEDECF2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          height: 50,
                          width: 250,
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: "Buscar.."),
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.search,
                          size: 27,
                          color: Color(0xFF4C53A5),
                        )
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    child: Text(
                      "Categorias",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4C53A5),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: CategoriesWidget(categories: categories),
                  ),
                  //items

                  ItemsWidget(products: productState.products),
                ],
              ),
            )
    ]);
  }
}
