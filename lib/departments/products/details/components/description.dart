// ignore_for_file: prefer_const_constructors, unused_import

import 'package:eleven/Api/product_api.dart';
import 'package:flutter/material.dart';
import '../../Product.dart';

class Description extends StatelessWidget {
  const Description({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return  SizedBox( 
      child: Text(
        
          product.note,
          textAlign:TextAlign.left,
          style: TextStyle(height: 1.5,fontSize: 25,fontWeight: FontWeight.bold),
        ),
    //),
    );
  }
}
