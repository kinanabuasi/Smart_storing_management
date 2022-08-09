// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unused_import, camel_case_types

import 'package:eleven/departments/department.dart';
import 'package:eleven/departments/products/Product.dart';
import 'package:eleven/purchase/import_class.dart';
import 'package:flutter/material.dart';
Product? pro;
Import_class? im;
Department? dep;
int f1_id=pro!.id;
int f2_id=im!.Im_id; 
int f3_id=dep!.id;
class Ex_card_class { 
  final int Pec_id,f1_id,f2_id,f3_id;
  final double Ex_card_price,unit_q;
  final String notes; 
  Ex_card_class({
     required this.Pec_id,
      required this.f1_id,
     required this.f2_id,
     required this.f3_id,
     required this.Ex_card_price,
     required this.unit_q,
     required this.notes,
     
} ); } 
List<Ex_card_class> exp = [
  Ex_card_class(
      Pec_id: 1,
      f1_id: 1,
      f2_id: 1,
      f3_id: 1,
      Ex_card_price: 1000, 
      unit_q: 50,
      notes: "laptop Asus core i5_ Ram:8 _ Hard: 1 Tera_ windows 10",
  ),
  Ex_card_class(
      Pec_id: 2,
      f1_id: 4005,
      f2_id: 2,
      f3_id: 4,
      Ex_card_price: 10, 
      unit_q: 36,
      notes: "notes book, meduim_size,Turkian type",
  ),
  
]; 