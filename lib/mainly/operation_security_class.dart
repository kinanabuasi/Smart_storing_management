// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unused_import, camel_case_types

import 'package:eleven/departments/departments_file.dart';
import 'package:flutter/material.dart'; 
class operation_security_class {
  
 final String OS_date;
 final int id;
  final double Payments,Receipts,Profits,Total_p;
   
 operation_security_class({
   required this.id,
    required this.Payments,
    required this.Receipts,
    required this.Profits,
    required this.Total_p,
    required this.OS_date,
   
  });
}

List<operation_security_class> op_se = [
  operation_security_class(
    id: 1,
      Payments: 10000000,
      Receipts: 12000000,
      Profits: 2000000,
      Total_p: 50000000,
      OS_date: "8/5/2022",
  ),
  
      operation_security_class(
        id: 2,
      Payments: 10000000,
      Receipts: 12000000,
      Profits: 2000000,
      Total_p: 50000000,
      OS_date: "8/5/2022",
      ),
 
  
];

String dummyText =
    "";
String add= "Add an product";