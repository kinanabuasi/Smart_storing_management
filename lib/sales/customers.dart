
// ignore_for_file: prefer_const_constructors, unused_import, unused_label, non_constant_identifier_names, camel_case_types, prefer_const_literals_to_create_immutables

import 'package:eleven/mainly/home_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl_browser.dart';
import 'package:intl/intl.dart';

import 'export.dart';
//import 'export.dart';
/*import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/date_symbols.dart';*/
//Intl.defaultLocale='pt_BR';
class customers extends StatefulWidget {
  const customers({ Key? key }) : super(key: key);

  @override
  State<customers> createState() => _customersState();
}

class _customersState extends State<customers> {
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
                    text: "Customers",
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
                            builder: (context) =>  create_customer_card(context),
                          )), 
            child: Text(
              "Add a new Customer",
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
          //child: create_customer_card(),
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

Widget create_customer_card(BuildContext context) {
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
                    text: "Customers",
                  ),

                 // mainAxisAlignment:MainAxisAlignment.spaceBetween,

                ],
              ),
                ),
         ), 
       
        
      ),
      body:Container(
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
            labelText: 'Enter a customer full_name',
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
            labelText: 'Enter a customer Address',
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
                            builder: (context) =>  order(context),
                          )),
          color: Colors.lightBlue,
          splashColor: Colors.white70,
          child: Text("Save and write an order",
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
                            builder: (context) =>  customers(),
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
      //),
    ),
      ),
  );
}


  
  Widget order(BuildContext context) {
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
                            builder: (context) =>  create_customer_card(context),
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
                    text: "Order",
                  ), 
                ],
              ),
                ),
         ), 
       
        
      ),
      body: Container(
    width: 1000,
    margin: EdgeInsets.all(5),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            labelText: 'Enter O_id',
          ),
        ),
       

      /*  TextField(
          //controller: dateinput, //editing controller of this TextField
          decoration: InputDecoration(
              icon: Icon(Icons.calendar_today), //icon of text field
              labelText: "Enter Date" //label text of field
              ),
          readOnly: true, //set it true, so that user will not able to edit text
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                //DateTime.now() - not to allow to choose before today.
                lastDate: DateTime(2101));

            if (pickedDate != null) {
              print(
                  pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
              String formattedDate =
                  DateFormat('yyyy-MM-dd').format(pickedDate);
              print(
                  formattedDate); //formatted date output using intl package =>  2021-03-16
              //you can implement different kind of Date Format here according to your requirement

              setState(() {
                dateinput.text =
                    formattedDate; //set output date to TextField value.
              }
              );

            } else {
              print("Date is not selected");
            }
          },
        ),*/
        
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
                            builder: (context) =>  order(context),
                          )),
          color: Colors.lightBlue,
          splashColor: Colors.white70,
          child: Text("Save and write more orders..",
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
                            builder: (context) =>  create_customer_card(context),
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
  );
  }
