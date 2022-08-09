// ignore_for_file: prefer_const_constructors

import 'package:eleven/Api/product_api.dart';
import 'package:eleven/additions/constants.dart';
import 'package:flutter/material.dart';
import '../../Product.dart';

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       Column( 
          children: <Widget>[
            // Text(
            //   "Electronic products",
            //   style: TextStyle(color: Colors.white),
            // ),
            Text(
              product.name,
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: kDefaultPaddin),
            Row(
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: "Price\n"),
                      TextSpan(
                        text: "\$${product.selingPrice}",
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                //SizedBox(width: kDefaultPaddin), 
               // ),
              ],

            )
          ],
      ),
      // ),
     Padding(
       padding: const EdgeInsets.only(right: 90,top: 100),
       child: Column(
        mainAxisAlignment: MainAxisAlignment.start,

         children: [
           Hero(
                          tag: "${product.id}",
                          child: Image.network(
                            product.imagePath,
                            //fit: BoxFit.fill,
                            alignment: Alignment.topRight,
                            //scale: 10,
                          ),
                        ),

           // Text(product.note,style: TextStyle(color: Colors.black,fontSize: 16),)
         ],
       ),
     ),
                 
    //),
    ],
    );
  }
}
