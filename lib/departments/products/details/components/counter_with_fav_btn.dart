// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../Product.dart';
import 'cart_counter.dart';

class CounterWithFavBtn extends StatelessWidget {
  const CounterWithFavBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.start,
      verticalDirection: VerticalDirection.down,
      children: <Widget>[
        CartCounter(),
        Container(
          padding: EdgeInsets.all(1),
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            //color: Color(0xFFFF6464),
            shape: BoxShape.circle,
          ),
         
        )
      ],
    );
  }
}
