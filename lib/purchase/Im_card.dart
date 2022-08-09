
// ignore_for_file: camel_case_types, prefer_const_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:eleven/purchase/Import.dart';
import 'package:flutter/material.dart';


  Widget Im_card(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return 
    Scaffold(
     appBar: AppBar(
        elevation: 10,
        backgroundColor: Colors.blueAccent, 
        //foregroundColor: Colors.transparent,
        leading: BackButton
      (
          onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  create_import(context),
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
             child: Text.rich( 
              TextSpan(
                style: TextStyle(
                    fontSize: 25,color: Colors.black,
                    fontWeight: FontWeight.bold,
                ),
                children:  [
                  TextSpan(
                    text: "Im_card section",
                  ), 
                ],
              ),
                ),
         ), 
       
        
         
      ),
      body: SafeArea(
        child: SingleChildScrollView(   
  child: Center(
      child:Container(
    width: 1000,
    margin: EdgeInsets.all(5),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          //textAlign: TextAlign.start,
          //expands: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(
              Icons.vpn_key,
            ),
            labelText: 'Enter Im_id',
          ),
        ),
        SizedBox(height: 20),
        //SizedBox(height: 70),
        TextField(
          //textAlign: TextAlign.start,
          //expands: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(
              Icons.vpn_key,
            ),
            labelText: 'Enter import_id',
          ),
        ),
         SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(
                Icons.vpn_key,
              ),
              labelText: 'Enter Product_id',
            ),

          ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(
              Icons.storefront_outlined,
            ),
            labelText: 'Enter the quantity',
          ),
          
        ),
        SizedBox(height: 10),
        Text("Example: 50 computer device",
        style: TextStyle(color: Colors.lightGreen),),
        SizedBox(height: 20),
        /*TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(
              Icons.price_change_outlined,
            ),
            labelText: 'Enter Ex_card price',
          ),
        ),
        SizedBox(height: 20),

        TextField(
        
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.note_alt),
            labelText: 'Enter a product note(if it found)',
          ),
        ),
        SizedBox(height: 20),
        */
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
                            builder: (context) =>  Im_card(context),
                          )),
          color: Colors.lightBlue,
          splashColor: Colors.white70,
          child: Text("Save and write more Im_cards",
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
                            builder: (context) =>  create_import(context),
                          )),
          color: Colors.lightBlue,
          splashColor: Colors.white70,
          child: Text("Finish and go back",
          style: TextStyle(fontSize: 20,
            color: Colors.white,
          ),
          ),

        ),
          ],
         ),
      ],
      ),
    ),
  ),
        ),
      ),
  );
  }
