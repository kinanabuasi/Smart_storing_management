
// ignore_for_file: prefer_const_constructors, unused_import, unused_label, non_constant_identifier_names, camel_case_types, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:eleven/mainly/home_page.dart';
import 'package:eleven/sales/export.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl_browser.dart';
import 'package:intl/intl.dart';
/*import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/date_symbols.dart';*/

class vendors extends StatefulWidget {
  const vendors({ Key? key }) : super(key: key);

  @override
  State<vendors> createState() => _vendorsState();
}

class _vendorsState extends State<vendors> {
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
             child: Text.rich( 
              TextSpan(
                style: TextStyle(
                    fontSize: 25,color: Colors.black,
                    fontWeight: FontWeight.bold,
                ),
                children:  [
                  TextSpan(
                    text: "Vendors section",
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
                            builder: (context) =>  create_vendor_card(context),
                          )), 
            child: Text(
              "Add a new Vendor",
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
          //child: create_vendor_card(context),
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

Widget create_vendor_card(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return  Scaffold(
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
                    text: "Vendors section",
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
    margin: EdgeInsets.all(5),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
            labelText: 'Enter D_id',
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(
              Icons.person,
            ),
            labelText: 'Enter a vendor fullname',
          ),
        ),
        SizedBox(height: 20),
        TextField(
          //textAlign: TextAlign.start,
          //expands: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(
              Icons.location_on_sharp
            ),
            labelText: 'Enter a vendor Address',
          ),
        ),
        SizedBox(height: 20), 
        TextField(
          //textAlign: TextAlign.start,
          //expands: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.phone),
            labelText: 'Enter Zip',
          ),
          ),
          SizedBox(height: 20),
        TextField(
          //textAlign: TextAlign.start,
          //expands: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.local_print_shop_sharp),
            labelText: 'Enter a Center_name',
          ),
        ),
       
        SizedBox(height: 20),
        TextField(
          //textAlign: TextAlign.start,
          //expands: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.language_rounded),
            labelText: 'Enter a Country_name',
          ),
        ),
        SizedBox(height: 20),
        TextField(
          //textAlign: TextAlign.start,
          //expands: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.location_city_sharp),
            labelText: 'Enter a City_name',
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
                            builder: (context) =>  transaction(context),
                          )),
          color: Colors.lightBlue,
          splashColor: Colors.white70,
          child: Text("Save and write a transaction",
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
                            builder: (context) =>  vendors(),
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
    ),
  ),
        ),
    ),
  );
}

  Widget transaction(BuildContext context) {
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
                            builder: (context) =>  create_vendor_card(context),
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
                    text: "Transaction",
                  ), 
                ],
              ),
                ),
         ), 
       
        
      ),
      body:Container(
        //alignment: Alignment.center,
    width: 1000,
   // margin: EdgeInsets.all(5),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            labelText: 'Enter T_id',
          ),
        ),
       

        TextField(
          //textAlign: TextAlign.start,
          //expands: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.note_alt),
            labelText: 'Enter a product note(if it found)',
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
                            builder: (context) =>  transaction(context),
                          )),
          color: Colors.lightBlue,
          splashColor: Colors.white70,
          child: Text("Save and write more transactions",
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
                            builder: (context) =>  create_vendor_card(context),
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
  );
  }
