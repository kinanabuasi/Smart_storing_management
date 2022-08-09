// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unused_import

import 'package:eleven/departments/departments_file.dart';
import 'package:flutter/material.dart'; 

class Users {
  
 final String User_name,Email,Gender,Country,City,Offical_statue;
  final int  User_id,zip;
   final double Phone;
  
  Users({
    required this.User_name,
    required this.User_id,
    required this.Email,
    required this.Gender,
    required this.Country,
    required this.City,
    required this.Offical_statue, //vendor,client,admin,user...
    required this.Phone,
    required this.zip,
    
  });
}

List<Users> user = [
  Users(
     User_id:1, 
     User_name:"Amer Alwarwar",
     Email: "Amer_Alwarwar@gmail.com",
     Gender: "male",
     Country: "Syria",
     City: "Aleppo", 
     Offical_statue: "client",
     zip: 00963,
     Phone: 0933675663, 

  ),
  
  
];

String dummyText =
    "";
String add= "Add an product";