// ignore_for_file: prefer_const_constructors

import 'package:eleven/additions/constants.dart';
import 'package:flutter/material.dart';
import '../../Product.dart';
import 'add_to_cart.dart';
import 'color_and_size.dart';
import 'counter_with_fav_btn.dart';
import 'description.dart';
import 'product_title_with_image.dart';

class Body extends StatelessWidget {
  final Product product2;

  const Body({Key? key, required this.product2}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // It provide us total height and width
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    //left: kDefaultPaddin,
                    //right: kDefaultPaddin,
                  ),
                  // height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      ColorAndSize(product: product2),
                      SizedBox(height: kDefaultPaddin / 2),
                      Description(product: product2),
                      SizedBox(height: kDefaultPaddin / 2),
                      CounterWithFavBtn(),
                      //SizedBox(height: kDefaultPaddin / 2),
                      //AddToCart(product: product2)
                    ],
                  ),
                ),
               // Expanded(
                   ProductTitleWithImage(product: product2),
                
               // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
