import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_jc/pages/CartPage.dart';
import 'package:food_jc/pages/SalesPage.dart';
import 'package:food_jc/provider/HomePageProvider.dart';
import 'package:food_jc/widgets/CategoriesWidget.dart';
import 'package:food_jc/widgets/HomeAppBar.dart';
import 'package:food_jc/widgets/ItemsWidget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final sreenViews = [SalesPage(), CartPage(), SalesPage()];
    MenuProvider watch = context.watch<MenuProvider>();
    return Scaffold(
      body: sreenViews[watch.selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
          index: watch.selectedIndex,
          backgroundColor: Colors.transparent,
          onTap: (index) {
            watch.setSelectedIndex(selectedIndex: index);
          },
          color: Color(0xFF4C53A5),
          height: 70,
          items: [
            Icon(
              Icons.home,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              CupertinoIcons.cart_fill,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.list,
              size: 30,
              color: Colors.white,
            )
          ]),
    );
  }
}
