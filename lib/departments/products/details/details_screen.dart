// ignore_for_file: prefer_const_constructors, unused_import

import 'package:eleven/additions/constants.dart';
import 'package:eleven/departments/products/product_body_page.dart';
import 'package:eleven/departments/products/Product.dart';
import 'package:eleven/departments/products/details/components/body.dart';
import 'package:flutter/material.dart';


class DetailsScreen extends StatelessWidget {
  final Product product;

  const DetailsScreen({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // each product have a color
      backgroundColor: product.color,
      appBar: buildAppBar(context),
      body:Body (product2: product),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: product.color,
      elevation: 0,
      leading: BackButton
      (
          onPressed: () => Navigator.pop(context,false),
         // icon: Icon(Icons.chevron_left),
          color: Colors.black,
        ), 
      actions: <Widget>[
       
       IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_drop_down),
          color: Colors.black,
        ),
        SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }
}
