// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unused_import

import 'package:eleven/departments/departments_file.dart';
import 'package:flutter/material.dart';

import 'Users.dart';


Users? us;
int f_id=us!.User_id;
class Dealer {
  
 final String D_name,D_address,Center_name,Country,City;
  final int  D_id,f_id,Zip;
   final double Phone,Land_phone,fax;
  final String C_or_v;
  Dealer({
    required this.D_name,
    required this.f_id,
    required this.D_address,
    required this.Center_name,
    required this.Country,
    required this.City,
    required this.D_id,
    required this.Zip,
    required this.Phone,
    required this.Land_phone,
    required this.fax,
    required this.C_or_v,
  });
}

List<Dealer> dealer = [
  Dealer(
     D_id:1,
     f_id:5,
     D_name:"Morad Alhoot",
     D_address: "Turkey-Estanboul",
     Center_name: "Alhoot center",
     Country: "Turkey",
     City: "Estanboul",
     Zip: 34379,
     Phone: 356756638,
     Land_phone: 212703799,
     fax: 009042674245,
     C_or_v: "v",

  ),
  
  
];

String dummyText =
    "";
String add= "Add an product";