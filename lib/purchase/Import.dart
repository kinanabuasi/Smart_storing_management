// ignore_for_file: prefer_const_constructors, unused_label, non_constant_identifier_names, prefer_const_literals_to_create_immutables, camel_case_types, avoid_print, unused_import, use_key_in_widget_constructors, override_on_non_overriding_member

import 'package:date_time_picker/date_time_picker.dart';
import 'package:eleven/Api/api.dart';
import 'package:eleven/Api/app.dart';
import 'package:eleven/Api/import.dart';
import 'package:eleven/additions/set_time.dart';
import 'package:eleven/mainly/home_page.dart';
import 'package:eleven/purchase/Im_card.dart';
import 'package:eleven/purchase/vendors.dart';
import 'package:eleven/sales/export.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl_browser.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/date_symbols.dart';
class Import extends StatefulWidget {
  const Import({ Key? key }) : super(key: key);

  @override
  State<Import> createState() => _ImportState();
}

class _ImportState extends State<Import> {


  List<ImportData> my_imports = <ImportData>[];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    Api.getAllImport().then((serverImport) {
      my_imports = serverImport;
      setState((){
        loading = false;
      });
    });
  }

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
                    text: "Import section",
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
                            builder: (context) =>  create_import(context),
                          )), 
            child: Text(
              "Add a new Import card",
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
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: loading?App.Loading():GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 4/1,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20
          ),
         itemCount: my_imports.length,
         itemBuilder: (context,index){
            return Container(
              child: Column(
                children: [
                  Text("billNumber: "+my_imports[index].billNumber.toString()),
                  Text("dealerName: "+my_imports[index].dealerName),
                  Text("billNumber: "+my_imports[index].shippingChargePrice.toString()),
                  my_imports[index].importProduct.isNotEmpty
                  ?Text("product: "+my_imports[index].importProduct.first.pruductsName)
                  :Center()
                ],
              ),
            );
          }),
        ),
      ),
      //),
    );
  }
}

Widget create_import(BuildContext context) {

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
                    text: "Import section",
                  ),

                 // mainAxisAlignment:MainAxisAlignment.spaceBetween,

                ],
              ),
                ),
         ), 
       
      
      ),
      body:
         SingleChildScrollView(  
 // child: Center(
    child: Container(
    width: 1000,
    margin: EdgeInsets.all(5),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 70),
        TextField( 
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(
              Icons.vpn_key,
            ),
            labelText: 'Enter Im_id',
          ),
        ),
        SizedBox(height: 20),
        TextField( 
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(
              Icons.price_check_outlined
            ),
            labelText: 'Enter bill_number',
          ),
        ),
        SizedBox(height: 20),
        //DateTimePicker()set_time(),
       /* DateTimePicker(
        type: DateTimePickerType.dateTimeSeparate,
  dateMask: 'd MMM, yyyy',
  initialValue: DateTime.now().toString(),
  firstDate: DateTime(2000),
  lastDate: DateTime(2100),
  icon: Icon(Icons.event),
  dateLabelText: 'Date',
  timeLabelText: "Hour",
  selectableDayPredicate: (date) {
// Disable weekend days to select from the calendar
  if (date.weekday == 6 || date.weekday == 7) {
  return false;
  }

  return true;
  },
  onChanged: (val) => print(val),
  validator: (val) {
  print(val);
  return null;
  },
  onSaved: (val) => print(val),
  ),
        */
        //SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.price_change_outlined),
            labelText: 'Enter shipping_price',
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(
              Icons.vpn_key,
            ),
            labelText: 'Enter Im_id',
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.storage_sharp),
            labelText: 'Enter *yes/no* if it has received',
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.price_change_rounded),
            labelText: 'Enter Total price of products',
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
                            builder: (context) =>  Im_card(context),
                          )),
          color: Colors.lightBlue,
          splashColor: Colors.white70,
          child: Text("Save and write an Im_card",
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
                            builder: (context) =>  Import(),
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
  );
} 
class im_table extends StatelessWidget {
  const im_table({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      
    );
  }
}