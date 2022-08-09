// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unused_import, camel_case_types

import 'package:flutter/material.dart';

import '../departments/products/Product.dart';
import 'D_handing_class.dart';
import 'D_receiption_class.dart';
D_handing_class? d_h; // Foriegn-key
D_receiption_class? d_r;
Product? pr;
final int f_id1=d_h!.H_id;
final int f_id2=d_r!.R_id; 
final int f_id3=pr!.id;

class Diary_product_class { 
  final int DP_id,f_id1,f_id2,f_id3;
  final double DP_quantities; 
  
  Diary_product_class({
    required this.f_id1,
    required this.f_id2,
    required this.f_id3, 
    required this.DP_id, 
    required this.DP_quantities,
     
}
);
}

List<Diary_product_class> exp = [
  Diary_product_class(
      DP_id: 1,
      DP_quantities:100,
      f_id1: 1,
      f_id2: 0,
      f_id3: 22,
      
  ),
 Diary_product_class(
      DP_id: 2,
      DP_quantities:350,
      f_id1: 0,
      f_id2: 1,
      f_id3: 4008,
  ),
  
]; 