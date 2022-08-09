// ignore_for_file: prefer_const_constructors, unused_import

import 'package:eleven/Api/products_api.dart';
import 'package:eleven/Api/signup.dart';
import 'package:eleven/Diary/D-receiption.dart';
import 'package:eleven/Diary/D_Handing.dart';
import 'package:eleven/departments/departments_file.dart';
import 'package:eleven/departments/products/product_body_page.dart';
import 'package:eleven/departments/products/Product.dart';
import 'package:eleven/purchase/Import.dart';
import 'package:eleven/purchase/vendors.dart';
import 'package:eleven/sales/Ex_card.dart';
import 'package:eleven/unusing/sales.dart';
import 'package:eleven/sales/export.dart';
import 'package:eleven/sales/customers.dart';
import 'package:eleven/unusing/table.dart';
import 'package:flutter/material.dart';
import 'Api/signin.dart';
import 'mainly/home_page.dart';
//import 'package:google_fonts/google_fonts.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Storing mangement',
      debugShowCheckedModeBanner: false,
      home:Homepage(),

    );
  }
}
