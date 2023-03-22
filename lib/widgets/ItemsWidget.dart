import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food_jc/models/Product.model.dart';
import 'package:food_jc/provider/ProductProvider.dart';

import 'package:provider/provider.dart';

class ItemsWidget extends StatelessWidget {
  ItemsWidget({required this.products, super.key});

  List<ProductModel> products = [];

  @override
  Widget build(BuildContext context) {
    ProductProvider provideState = context.watch<ProductProvider>();

    return GridView.count(
      childAspectRatio: 0.8,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        for (int i = 0; i < products.length; i++)
          InkWell(
            onTap: () {
              provideState.updateItemMain(
                  items: ProductModel(
                      ID: products[i].ID,
                      ProductDescription: products[i].ProductDescription,
                      Price: products[i].Price,
                      Qty: products[i].Qty,
                      Image: products[i].Image,
                      selected: true,
                      Iva: products[i].Iva));
              provideState.addProductSelected(
                  ID: products[i].ID,
                  ProductDescription: products[i].ProductDescription,
                  Price: products[i].Price,
                  Qty: products[i].Qty,
                  Image: products[i].Image,
                  Iva: products[i].Iva);
            },
            child: Container(
              padding: EdgeInsets.only(left: 15, right: 15, top: 10),
              margin: EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                color: products[i].selected == true
                    ? Color.fromARGB(255, 217, 221, 248)
                    : Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Container(
                    //   padding: EdgeInsets.all(5),
                    //   decoration: BoxDecoration(
                    //     color: Color(0xFF4C53A5),
                    //     borderRadius: BorderRadius.circular(20),
                    //   ),
                    //   child: Text(
                    //     "-50%",
                    //     style: TextStyle(
                    //       fontSize: 14,
                    //       color: Colors.white,
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    // ),
                    Icon(
                      Icons.check_circle_outline,
                      color: products[i].selected == true
                          ? Color(0xFF4C53A5)
                          : Colors.white.withOpacity(0),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(0),
                  child: Image.asset(
                    products[i].Image,
                    height: 100,
                    width: 100,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 8),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Product Title",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF4C53A5),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Container(
                //   alignment: Alignment.centerLeft,
                //   child: Text(
                //     "Write description of product",
                //     style: TextStyle(
                //       fontSize: 13,
                //       color: Color(0xFF4C53A5),
                //     ),
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$55",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4C53A5),
                        ),
                      ),
                      Icon(
                        Icons.shopping_cart_checkout,
                        color: Color(0xFF4C53A5),
                      ),
                    ],
                  ),
                )
              ]),
            ),
          )
      ],
    );
  }
}
