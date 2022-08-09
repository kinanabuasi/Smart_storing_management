// ignore_for_file: prefer_const_constructors

import 'package:eleven/Api/product_api.dart';
import 'package:eleven/additions/constants.dart';
import 'package:flutter/material.dart';
import '../../Product.dart';
/*import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/models/Product.dart';*/



class AddToCart extends StatelessWidget {
  const AddToCart({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: kDefaultPaddin),
            height: 50,
            width: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                // color: product.color,
              ),
            ),
            child:   IconButton(
          onPressed: () {},
          icon: Icon(Icons.add_shopping_cart,),
          color: Colors.black,
        ),
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                // color: product.color,
                onPressed: () {},
                child: Text(
                  "Buy  Now".toUpperCase(),
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
