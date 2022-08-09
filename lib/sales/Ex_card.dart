

// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unused_import

import 'package:eleven/purchase/vendors.dart';
import 'package:eleven/sales/export.dart';
import 'package:flutter/material.dart';

Widget Ex_card(BuildContext context) {
  //Size size = MediaQuery.of(context).size;
    return Scaffold(
     appBar: AppBar(
        //elevation: 10,
        backgroundColor: Colors.blueAccent, 
        //foregroundColor: Colors.transparent,
        leading: BackButton
      (
          onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  create_Export(context),
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
                    text: "Ex_card section",
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
              labelText: 'Enter pec_id',
            ),
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(
                Icons.note_add_rounded,
              ),
              labelText: 'Enter Product name',
            ),

          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(
                Icons.storefront_outlined,
              ),
              labelText: 'Enter the unit Ex_card quantity',
            ),

          ),
          SizedBox(height: 10),
          Text("Example: 50 computer device",
          style: TextStyle(color: Colors.green),),
          SizedBox(height: 20),
          TextField(
            //textAlign: TextAlign.start,
            //expands: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(
                Icons.price_change_outlined,
              ),
              labelText: 'Enter Ex_card price',
            ),
          ),
          SizedBox(height: 20),

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
                            builder: (context) =>  Ex_card(context),
                          )),
          color: Colors.lightBlue,
          splashColor: Colors.white70,
          child: Text("Save and and write more Ex_cards",
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
                            builder: (context) =>  create_export(context),
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

create_export(BuildContext context) {
}