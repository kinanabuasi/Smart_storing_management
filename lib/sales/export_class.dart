// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unused_import, camel_case_types

import 'package:eleven/mainly/operation_security_class.dart';
import 'package:flutter/material.dart';
operation_security_class? op;
int f_id=op!.id;
class Export_class { 
  final int Ex_id,bill_number,f_id;
  final double Ex_bill_v,total_q; 
  
  Export_class({
     required this.Ex_id,
      required this.f_id,
     required this.bill_number,
     required this.Ex_bill_v,
     required this.total_q,
     
}
);
}

List<Export_class> exp = [
  Export_class(
      Ex_id: 1,
      f_id: 1,
      bill_number: 1,
      Ex_bill_v: 1000, 
      total_q: 2800,
      
  ),
  Export_class(
      Ex_id: 2,
      f_id: 1,
      bill_number: 2,
      Ex_bill_v: 1000, 
      total_q: 3600,
      
  ),
  
]; 