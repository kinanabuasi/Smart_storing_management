
// ignore_for_file: non_constant_identifier_names, unnecessary_import, prefer_const_literals_to_create_immutables, prefer_const_constructors, duplicate_ignore

import 'package:eleven/inventory/item_groups.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget Inventory_view(BuildContext context) {
  Size size = MediaQuery.of(context).size;
    return Scaffold(
     appBar: AppBar(
        elevation: 10,
        backgroundColor: Colors.blueAccent, 
        //foregroundColor: Colors.transparent,
        leading: BackButton
      (
          onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  create_Inventory(context),
                          )), 
          color: Colors.black,
        ),
        title:  Container(
              width: 200,
              height: 50,

              //color: Colors.yellowAccent,
              alignment: Alignment.center,
              decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(60)
              ),
             // ignore: prefer_const_constructors
             child: Text.rich( 
              TextSpan(
                style: TextStyle(
                    fontSize: 25,color: Colors.black,
                    fontWeight: FontWeight.bold,
                ),
                children:  [
                  TextSpan(
                    text: "Inventory_view",
                  ), 
                ],
              ),
                ),
         ), 
      ),
      body: SafeArea(
        child: SingleChildScrollView(  
          
          child:  Column(
       children:<Widget>[
         SizedBox(height: 20),
         TextField(
           //textAlign: TextAlign.start,
           //expands: true,
           decoration: InputDecoration(
             border: OutlineInputBorder(),
             prefixIcon: Icon(
               Icons.vpn_key,
             ),
             labelText: 'Enter E_I_id',
           ),
         ),
         SizedBox(height: 20),
         TextField(
           decoration: InputDecoration(
             border: OutlineInputBorder(),
             prefixIcon: Icon(
               Icons.vpn_key,
             ),
             labelText: 'Enter I_id',
           ),
         ),
         SizedBox(height: 20),
         TextField(
           //textAlign: TextAlign.start,
           //expands: true,
           decoration: InputDecoration(
             border: OutlineInputBorder(),
             prefixIcon: Icon(
               Icons.format_list_numbered,
             ),
             labelText: 'Enter quantity',
           ),
         ),
         SizedBox(height: 20),
         TextField(
           //textAlign: TextAlign.start,
           //expands: true,
           decoration: InputDecoration(
             border: OutlineInputBorder(),
             prefixIcon: Icon(
               Icons.price_change_outlined,
             ),
             labelText: 'Enter export_product_price',
           ),
         ),
         SizedBox(height: 20),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             MaterialButton(
               height: 70,
               minWidth: 200,
               onPressed:()
               => Navigator.push(
                   context,
                   MaterialPageRoute(
                     builder: (context) =>  Inventory_view(context),
                   )),
               color: Colors.lightBlue,
               splashColor: Colors.white70,
               child: Text("Save and back",
                 style: TextStyle(fontSize: 20,
                   color: Colors.white,
                 ),
               ),

             ),
             MaterialButton(
               height: 70,
               minWidth: 200,
               onPressed:()
               => Navigator.push(
                   context,
                   MaterialPageRoute(
                     builder: (context) =>  create_Inventory(context),
                   )),
               color: Colors.lightBlue,
               splashColor: Colors.white70,
               child: Text("Finish the card",
                 style: TextStyle(fontSize: 20,
                   color: Colors.white,
                 ),
               ),

             ),
           ],
         ),
/*
           MaterialButton(
            height: 70,
            minWidth: 200,
            onPressed:()
                        => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  create_Inventory(context),
                            )),
            color: Colors.lightBlue,
            splashColor: Colors.white70,
            child: Text("Finish and go back",
            style: TextStyle(fontSize: 20,
              color: Colors.white,
            ),
            ),

          ),
    */
       ],
  ),
        ),
      ),
    );
  }