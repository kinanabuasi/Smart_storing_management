// ignore_for_file: unused_import, prefer_const_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_label, camel_case_types, avoid_print, override_on_non_overriding_member, use_key_in_widget_constructors, must_be_immutable

//import 'dart:js';


import 'package:eleven/mainly/home_page.dart';
import 'package:eleven/sales/export.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl_browser.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/date_symbols.dart';
//Intl.defaultLocale='pt_BR';
class D_handing extends StatefulWidget {
  const D_handing({ Key? key }) : super(key: key);

  @override
  State<D_handing> createState() => _D_handingState();
}

class _D_handingState extends State<D_handing> {
  String _selectedMenu = '';
  @override
  Widget build(BuildContext context) {
   // Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      appBar: AppBar(
        //elevation: 10,
        backgroundColor: Colors.blueAccent, 
        //foregroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  Homepage(),
                            ),),
          icon: Icon(Icons.arrow_back_sharp),
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
                    text: "D-handing",
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
                  value: Menu.itemOne,
                  child: Text('Item 1'),
                ),
                const PopupMenuItem<Menu>(
                  value: Menu.itemTwo,
                  child: Text('Item 2'),
                ),

              ]),
                              IconButton(onPressed: ()=> Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  create_D_handing(context),
                          )),
                                icon: Icon(Icons.post_add_outlined),
          ),
        ],
      ),
      ),
    );
  }
}

Widget create_D_handing(BuildContext context) {
 // Size size = MediaQuery.of(context).size;
  return AlertDialog(
      backgroundColor: Colors.white,
      actions: [
        SizedBox(height: 70),
        TextField(
          //textAlign: TextAlign.start,
          //expands: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(
              Icons.vpn_key,
            ),
            labelText: 'Enter H_id',
          ),
        ),
       /* SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(
              Icons.receipt,
            ),
            labelText: 'Enter R_date',
          ),
        ),*/
        SizedBox(height: 20),
        TextField(
          
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(
              Icons.format_list_numbered,
            ),
            labelText: 'Enter R_quantities',
          ),
        ),
        //SizedBox(height: 20),
         //set_time(),
        SizedBox(height: 20),
        TextField(
          
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.storage_sharp),
            labelText: 'Enter Total quantities of products',
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
                            builder: (context) =>  D_Hproduct(context),
                          )),
          color: Colors.lightBlue,
          splashColor: Colors.white70,
          child: Text("Save and write a Diary_product card",
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
                            builder: (context) =>  D_handing(),
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
      ],
  );
}


Widget D_Hproduct(BuildContext context) {
 // Size size = MediaQuery.of(context).size;
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
                            builder: (context) =>  create_D_handing(context),
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
                    text: "D-product",
                  ), 
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
      //height: 1000,
      margin: EdgeInsets.only(top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: 70),
          TextField(
            //textAlign: TextAlign.start,
            //expands: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(
                Icons.vpn_key,
              ),
              labelText: 'Enter DP_id',
            ),
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(
                Icons.storefront_outlined,
              ),
              labelText: 'Enter the unit DP_quantities',
            ),

          ),
          SizedBox(height: 10),
          Text("Example: 50 computer device",
          style: TextStyle(color: Colors.green),),
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
                            builder: (context) =>  D_Hproduct(context),
                          )),
          color: Colors.lightBlue,
          splashColor: Colors.white70,
          child: Text("Save and write more cards",
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
                            builder: (context) =>  create_D_handing(context),
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
        //),
      ),
  ),
  ),
        ),
      ),
    );
  }

/*
  Widget dialog(BuildContext context) {
    return Scaffold(
    body:
      SimpleDialog(
      title: BackButton
        (
        onPressed: () => Navigator.pop(context,false),
        color: Colors.black,
      ),
      children: [
        SizedBox(height: 70),
        TextField(
          //textAlign: TextAlign.start,
          //expands: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(
              Icons.vpn_key,
            ),
            labelText: 'Enter H_id',
          ),
        ),
        /* SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(
              Icons.receipt,
            ),
            labelText: 'Enter R_date',
          ),
        ),*/
        SizedBox(height: 20),
        TextField(

          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(
              Icons.format_list_numbered,
            ),
            labelText: 'Enter R_quantities',
          ),
        ),
        SizedBox(height: 20),
        set_time(),
        SizedBox(height: 20),
        TextField(

          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.storage_sharp),
            labelText: 'Enter Total quantities of products',
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
                    builder: (context) =>  D_Hproduct(context),
                  )),
              color: Colors.lightBlue,
              splashColor: Colors.white70,
              child: Text("Save and write a Diary_product card",
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
                    builder: (context) =>  D_handing(),
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
      ],
      ),
    );
  }
*/