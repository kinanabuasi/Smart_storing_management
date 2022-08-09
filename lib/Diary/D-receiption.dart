// ignore_for_file: unused_import, prefer_const_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_label, camel_case_types, avoid_print, override_on_non_overriding_member, use_key_in_widget_constructors, must_be_immutable

//import 'dart:js';

import 'package:eleven/mainly/home_page.dart';
import 'package:eleven/sales/export.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl_browser.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/date_symbols.dart';
import 'package:flutter/cupertino.dart';

//Intl.defaultLocale='pt_BR';
class D_receiption extends StatefulWidget {
  const D_receiption({ Key? key }) : super(key: key);

  @override
  State<D_receiption> createState() => _D_receiptionState();
}

class _D_receiptionState extends State<D_receiption> {
  String _selectedMenu = '';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Colors.blueAccent, 
        //foregroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () 
            
          => Navigator.push(
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
                    text: "D-receiption",
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
            
          PopupMenuButton(
            icon:Icon(Icons.arrow_drop_down) ,
                              itemBuilder: (context)=>[
                                PopupMenuItem(
                                  child: Text("01"),)
                              ]
                              ), 
                               IconButton(onPressed: ()=> Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  create_D_receiption(context),
                          )),
          icon: Icon(Icons.post_add_outlined),
          ),
       /* ElevatedButton(
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
                            builder: (context) =>  create_D_receiption(context),
                          )),  
            child: Text(
              "Add a new D-receiption card",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),*/
         // ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          //child:create_D_receiption(),
          // child: Container(
          // color: Colors.white10,
          // width: 100,
          //height: 75,
        ),
      ),
      //),
    );
  }
}

Widget create_D_receiption(BuildContext context) {
  //Size size = MediaQuery.of(context).size;
  return AlertDialog(
      backgroundColor: Colors.white,
      actions: [
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
          //textAlign: TextAlign.start,
          //expands: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(
              Icons.format_list_numbered,
            ),
            labelText: 'Enter R_quantities',
          ),
        ),
        SizedBox(height: 20),
        //set_time(),
        SizedBox(height: 20),
        TextField(
          //textAlign: TextAlign.start,
          //expands: true,
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
                            builder: (context) =>  D_Rproduct(context),
                          )),
          color: Colors.lightBlue,
          splashColor: Colors.white70,
          child: Text("Save and write a Diary_product",
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
                            builder: (context) =>  D_receiption(),
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

  Widget D_Rproduct(BuildContext context) {
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
                            builder: (context) =>  create_D_receiption(context),
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
                            builder: (context) =>  D_Rproduct(context),
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
                            builder: (context) =>  create_D_receiption(context),
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
_dialog(BuildContext context){
  return showGeneralDialog(
    context: context,
    barrierDismissible: false,
    transitionDuration: Duration(milliseconds: 2000),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: ScaleTransition(
          scale: animation,
          child: child,
        ),
      );
    },
    pageBuilder: (context, animation, secondaryAnimation) {
      return SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(20),
          color: Colors.white,
          child: Center(
            child:Column(
              mainAxisSize: MainAxisSize.min,
              children:<Widget> [


              ],
            ),
          ),
        ),
      );
    },
  );
}
*/