import 'package:flutter/material.dart';
import 'package:food_jc/provider/ProductProvider.dart';
import 'package:food_jc/provider/ProductProvider.dart';
import 'package:food_jc/provider/HomePageProvider.dart';
import 'package:food_jc/widgets/CartAppBar.dart';
import 'package:food_jc/widgets/CartBottomNavBar.dart';
import 'package:food_jc/widgets/CartItemSamples.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    ProductProvider productState = context.watch<ProductProvider>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CartAppBar(),
            Expanded(
              child: Container(
                color: Colors.white,
                child: RefreshIndicator(
                  onRefresh: () {
                    return Future(() => null);
                  },
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: productState.productsSelected.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          CartItemSamples(
                            item: productState.productsSelected[index],
                          ),
                          // Container(
                          //   // decoration: BoxDecoration(
                          //   //   borderRadius: BorderRadius.circular(10),
                          //   // ),
                          //   margin: EdgeInsets.symmetric(
                          //       vertical: 20, horizontal: 15),
                          //   padding: EdgeInsets.all(10),
                          //   child: Row(
                          //     children: [
                          //       Container(
                          //         decoration: BoxDecoration(
                          //           color: Color(0xFF4C53A5),
                          //           borderRadius: BorderRadius.circular(20),
                          //         ),
                          //         child: Icon(
                          //           Icons.add,
                          //           color: Colors.white,
                          //         ),
                          //       ),
                          //       Padding(
                          //         padding: EdgeInsets.symmetric(horizontal: 10),
                          //         child: Text(
                          //           "Add Coupon Code",
                          //           style: TextStyle(
                          //               color: Color(0xFF4C53A5),
                          //               fontWeight: FontWeight.bold,
                          //               fontSize: 16),
                          //         ),
                          //       )
                          //     ],
                          //   ),
                          // )
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CartBottomNavBar(
        detailProductSelected: productState.detailProductSelected,
      ),
    );
  }
}
