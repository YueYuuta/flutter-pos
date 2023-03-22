import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_jc/models/Product.model.dart';
import 'package:food_jc/provider/ProductProvider.dart';
import 'package:provider/provider.dart';

class CartItemSamples extends StatelessWidget {
  CartItemSamples({required this.item, super.key});

  ProductModel item;

  @override
  Widget build(BuildContext context) {
    ProductProvider productState = context.watch<ProductProvider>();
    return Container(
      height: 110,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 217, 221, 248),
        borderRadius: BorderRadius.circular(10),
        // border: Border.all(
        //     // color:
        //     //     selected == i ? Color(0xFF4C53A5) : Colors.white.withOpacity(0),
        //     ),
      ),
      child: Row(
        children: [
          // Radio(
          //   value: "",
          //   groupValue: "",
          //   activeColor: Color(0xFF4C53A5),
          //   onChanged: (index) {},
          // ),
          Expanded(
            flex: 2,
            child: Container(
              // height: 70,
              // width: 60,
              margin: EdgeInsets.only(
                right: 15,
              ),
              child: Image.asset(item.Image),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      item.ProductDescription,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4C53A5)),
                    ),
                  ),
                  Text(
                    "\$" + item.Price.toString(),
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4C53A5)),
                  )
                ],
              ),
            ),
          ),

          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      productState.removeProductSelected(ID: item.ID);
                    },
                    child: Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 30,
                    ),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          productState.addProductSelected(
                              ID: item.ID,
                              ProductDescription: item.ProductDescription,
                              Price: item.Price,
                              Qty: item.Qty - 1,
                              Image: item.Image,
                              Iva: item.Iva);
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                )
                              ]),
                          child: Icon(
                            CupertinoIcons.minus,
                            size: 18,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          item.Qty.toString(),
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4C53A5)),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          productState.addProductSelected(
                              ID: item.ID,
                              ProductDescription: item.ProductDescription,
                              Price: item.Price,
                              Qty: item.Qty + 1,
                              Image: item.Image,
                              Iva: item.Iva);
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                )
                              ]),
                          child: Icon(
                            CupertinoIcons.plus,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
