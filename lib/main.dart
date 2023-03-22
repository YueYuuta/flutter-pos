import 'package:flutter/material.dart';
import 'package:food_jc/pages/CartPage.dart';

import 'package:food_jc/pages/HomePage.dart';

import 'package:food_jc/provider/HomePageProvider.dart';
import 'package:food_jc/provider/ProductProvider.dart';
import 'package:food_jc/provider/categoryProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<MenuProvider>(
            create: (_) => MenuProvider(),
          ),
          ChangeNotifierProvider<ProductProvider>(
            create: (_) => ProductProvider(),
          ),
          ChangeNotifierProvider<CategoryProvider>(
            create: (_) => CategoryProvider(),
          )
        ],
        builder: (context, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'FOOD JC',
            theme: ThemeData(scaffoldBackgroundColor: Colors.white
                // colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
                // useMaterial3: false,
                ),
            routes: {
              "/": (context) => const HomePage(),
              "cartPage": (context) => const CartPage()
            },
          );
        });
  }
}
