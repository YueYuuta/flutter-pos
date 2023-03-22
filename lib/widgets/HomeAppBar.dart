import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:food_jc/provider/HomePageProvider.dart';
import 'package:provider/provider.dart';

class HomeAppBar extends StatelessWidget {
  HomeAppBar({required this.TotalItemBaged, super.key});
  int TotalItemBaged = 0;

  @override
  Widget build(BuildContext context) {
    MenuProvider menuState = context.watch<MenuProvider>();

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(15),
      child: Row(children: [
        const Icon(
          Icons.sort,
          size: 30,
          color: Color(0xFF4C53A5),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "FOOD JC",
            style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4C53A5)),
          ),
        ),
        const Spacer(),
        badges.Badge(
          onTap: () {},
          badgeStyle: const badges.BadgeStyle(
            badgeColor: Colors.red,
          ),
          badgeContent: Text(
            TotalItemBaged.toString(),
            style: TextStyle(color: Colors.white),
          ),
          child: InkWell(
            onTap: () {
              menuState.setSelectedIndex(selectedIndex: 1);
              // Navigator.pushNamed(context, "cartPage");
            },
            child: const Icon(
              Icons.shopping_cart,
              size: 30,
              color: Color(0xFF4C53A5),
            ),
          ),
        )
      ]),
    );
  }
}
