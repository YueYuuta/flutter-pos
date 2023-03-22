import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/HomePageProvider.dart';

class CartAppBar extends StatelessWidget {
  const CartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    MenuProvider watch = context.watch<MenuProvider>();
    return Container(
      // height: 100,
      color: Colors.white,
      padding: const EdgeInsets.all(15),
      child: Row(children: [
        InkWell(
          onTap: () {
            // Navigator.pop(context);
            watch.setSelectedIndex(selectedIndex: 0);
          },
          child: Icon(
            Icons.arrow_back,
            size: 30,
            color: Color(0xFF4C53A5),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "Cart",
            style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4C53A5)),
          ),
        ),
        Spacer(),
        Icon(
          Icons.more_vert,
          size: 30,
          color: Color(0xFF4C53A5),
        )
      ]),
    );
  }
}
