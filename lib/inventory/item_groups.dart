

// ignore_for_file: camel_case_types, prefer_const_literals_to_create_immutables, prefer_const_constructors, duplicate_ignore, non_constant_identifier_names

import 'package:eleven/mainly/home_page.dart';
import 'package:eleven/mainly/operation_security.dart';
import 'package:eleven/sales/export.dart';
//import 'package:eleven/set_time.dart';
import 'package:flutter/material.dart';

//import '../home_page.dart';
import 'inventory_view.dart';
class inventory extends StatefulWidget {
  const inventory({ Key? key }) : super(key: key);

  @override
  State<inventory> createState() => _inventoryState();
}

class _inventoryState extends State<inventory> {
  String _selectedMenu = '';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
     appBar: AppBar(
        elevation: 10,
        //backgroundColor: Colors.blueAccent, 
        //foregroundColor: Colors.transparent,
        leading: BackButton
      (
          onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  Homepage(),
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
              // ignore: prefer_const_constructors
              TextSpan(
                style: TextStyle(
                    fontSize: 25,color: Colors.black,
                    fontWeight: FontWeight.bold,
                ),
                children:  [
                  TextSpan(
                    text: "Inventory section",
                  ),

                 // mainAxisAlignment:MainAxisAlignment.spaceBetween,

                ],
              ),
                ),
         ), 
       
        actions: [
          PopupMenuButton<Menu>(
            // Callback that sets the selected popup menu item.
              onSelected: (Menu item) {
                setState(() {
                  _selectedMenu = item.name;
                });
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
                const PopupMenuItem<Menu>(
                  onTap: null ,
                          
                  value: Menu.itemOne,
                  child: Text('view latest inventory'),
                ),
                const PopupMenuItem<Menu>(
                  value: Menu.itemTwo,
                  child: Text('view all'),
                ),

              ]),
        ElevatedButton(
         style: ElevatedButton.styleFrom(
          primary: Colors.yellow,
          elevation: 5,
          padding: EdgeInsets.symmetric(horizontal: 7,vertical: 7),
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60),
            
            ),
           ),
            onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  create_Inventory(context),
                          )), 
            child: Text(
              "Add a new inventory card",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
         // ),
         
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          //child: create_export(context),
          
        ),
      ),
      //),
    );
  }
}

Widget create_Inventory(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Scaffold(
     appBar: AppBar(
        elevation: 10,
        backgroundColor: Colors.blueAccent, 
        //foregroundColor: Colors.transparent,
        leading: BackButton
      (
          onPressed: () => Navigator.pop(context,false), 
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
                    text: "Inventory section",
                  ),

                 // mainAxisAlignment:MainAxisAlignment.spaceBetween,

                ],
              ),
                ),
         ), 
       
      ),
      body: SafeArea(
        child: SingleChildScrollView(  
  child: Center(
    child: Container(
    width: 1000,
    margin: EdgeInsets.only(top: 10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 20),
        TextField(
          //textAlign: TextAlign.start,
          //expands: true,
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
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(
              Icons.vpn_key,
            ),
            labelText: 'Enter product_id',
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
              Icons.format_list_numbered,
            ),
            labelText: 'Enter Member-1- name',
          ),
        ),
        SizedBox(height: 20),
        TextField(
          //textAlign: TextAlign.start,
          //expands: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.storage_sharp),
            labelText: 'Enter Member-2- name',
          ),
        ),
        SizedBox(height: 20),
        TextField(
          //textAlign: TextAlign.start,
          //expands: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.storage_sharp),
            labelText: 'Enter Cashier name',
          ),
        ),
        //FloatingActionButton(onPressed: (){}),
        SizedBox(height: 20),
        TextField(
          //textAlign: TextAlign.start,
          //expands: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.storage_sharp),
            labelText: 'Enter Poss name',
          ),
        ),
        SizedBox(height: 20),
        //set_time(),
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
          child: Text("Save and continue",
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
                            builder: (context) =>  inventory(),
                          )),
          color: Colors.lightBlue,
          splashColor: Colors.white70,
          child: Text("back without saving",
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