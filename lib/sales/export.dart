// ignore_for_file: prefer_const_constructors, unused_import, unused_label, non_constant_identifier_names, camel_case_types, prefer_const_literals_to_create_immutables, sized_box_for_whitespace
import 'package:date_time_picker/date_time_picker.dart';
import 'package:eleven/mainly/home_page.dart';
import 'package:flutter/material.dart';

import 'Ex_card.dart';

//import 'home_page.dart';
class Export extends StatefulWidget {
  const Export({Key? key}) : super(key: key);

  @override
  _ExportState createState() => _ExportState();
}

class _ExportState extends State<Export> {
  String _selectedMenu = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton
          (
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>  Homepage(),
              )),
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
          child: const Text.rich(
            TextSpan(
              style: TextStyle(
                fontSize: 25,color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              children:  [
                TextSpan(
                  text: "Export section",
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
                  onTap: null,
                  child: Text('view latest Export card'),
                ),
                const PopupMenuItem<Menu>(
                  value: Menu.itemTwo,
                  child: Text('View all'),
                ),

              ]),


         IconButton(
           onPressed: ()=> Navigator.push(
               context,
               MaterialPageRoute(
                 builder: (context) =>  create_Export(context),
               )),
           icon: Icon(Icons.post_add_outlined),
         ),
        ],


      ),
    );
  }
}
enum Menu { itemOne, itemTwo }
create_Export(BuildContext context) {
 return AlertDialog(
   backgroundColor: Colors.white,
   actions: [
    // SizedBox(height: 20),
  TextField(
  decoration: InputDecoration(
  border: OutlineInputBorder(),
   prefixIcon: Icon(
   Icons.vpn_key,
  ),
  labelText: 'Enter Ex_id',
  ),
  ),
  SizedBox(height: 20),
  TextField(
  decoration: InputDecoration(
  border: OutlineInputBorder(),
  prefixIcon: Icon(
  Icons.receipt,
  ),
  labelText: 'Enter Ex_bill_number',
  ),
  ),
  SizedBox(height: 20),
  TextField(
  decoration: InputDecoration(
  border: OutlineInputBorder(),
  prefixIcon: Icon(
  Icons.price_change_outlined
  ),
  labelText: 'Enter shipping_price',
  ),
  ),
  SizedBox(height: 20),
   
  TextField(
  decoration: InputDecoration(
  border: OutlineInputBorder(),
  prefixIcon: Icon(Icons.vpn_key),
  labelText: 'Enter dealer_id',
  ),
  ),

  //FloatingActionButton(onPressed: (){}),
  SizedBox(height: 20),
  TextField(
  //textAlign: TextAlign.start,
  //expands: true,
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
  builder: (context) =>  Ex_card(context),
  )),
  color: Colors.lightBlue,
  splashColor: Colors.white70,
  child: Text("Save and Enter Ex_cards",
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
  builder: (context) =>  Export(),
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































/*
import 'package:eleven/sales/export.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl_browser.dart';
import 'package:intl/intl.dart';
import 'package:eleven/_dialog.dart';
import '../home_page.dart';
import '../set_time.dart';
import 'Ex_card.dart';
class Export extends StatefulWidget {
  const Export({ Key? key }) : super(key: key);

  @override
  State<Export> createState() => _ExportState();
}

class _ExportState extends State<Export> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:<Widget>[
        IconButton(onPressed: ()=> Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => create_Export(context),
            )),
               icon: Icon(Icons.post_add_outlined),

        ),
        ],
      ),



      /*
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
                    text: "Export section",
                  ),

                 // mainAxisAlignment:MainAxisAlignment.spaceBetween,

                ],
              ),
                ),
         ), 
       

            /* 
        PopupMenuButton(
            icon:Icon(Icons.arrow_drop_down) ,
                              itemBuilder: (context)=> const[
                                PopupMenuItem(
                                  value: MenuItem.item1,
                                  child: Text("Latest Vendor_card"),),
                                  PopupMenuItem(
                                    value: MenuItem.item1,
                                    child: Text("veiw all"),),
                              ],
                              onSelected: (value) {
                                if(value==MenuItem.item1){
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context)=>
                                  const create_table(),
                                  ),
                                  );

                                };

                              }
                              ),
          */  
           /*=> Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  create_Export(context),
     */
         /*IconButton(onPressed: ()=> Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => create_Export(context),
                          )),
          icon: Icon(Icons.post_add_outlined),
          ),*/
         // ),
        /* MaterialButton(onPressed: (){
          SimpleDialog(
            title: Text("Export"),
          );
         },
        
        child: Icon(Icons.post_add_outlined),
         )*/

      ),
      */
      //),
    );
  }
}

Widget create_Export(BuildContext context) {
  //Size size = MediaQuery.of(context).size;
  return
     /*appBar: AppBar(
        //elevation: 10,
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
                    text: "Export section",
                  ),

                 // mainAxisAlignment:MainAxisAlignment.spaceBetween,

                ],
              ),
                ),
         ), 
       
        
      ),
     */
      Stack(
      alignment: Alignment.center,
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
            labelText: 'Enter Ex_id',
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(
              Icons.receipt,
            ),
            labelText: 'Enter Ex_bill_value',
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
            labelText: 'Enter bill_number',
          ),
        ),
        SizedBox(height: 20),
       set_time(),
       SizedBox(height: 20),
        TextField(
          //textAlign: TextAlign.start,
          //expands: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.storage_sharp),
            labelText: 'Enter Type of product',
          ),
        ),
        //SizedBox(height: 20),
        TextField(
          //textAlign: TextAlign.start,
          //expands: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.storage_sharp),
            labelText: 'Enter number of product',
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
                            builder: (context) =>  Ex_card(context),
                          )),
          color: Colors.lightBlue,
          splashColor: Colors.white70,
          child: Text("Save and Enter Ex_cards",
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
                            builder: (context) =>  Export(),
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

  

/*
class create_table extends StatelessWidget {
  const create_table({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading: BackButton
      (
          onPressed: () => Navigator.pop(context,false), 
          color: Colors.black,
        ),
         ),
         body:SafeArea(
          child: Container(
            width: 1000,height: 1000,
      alignment: Alignment.topCenter,
      child:Table(
        defaultColumnWidth: FlexColumnWidth(100),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                //defaultColumnWidth: ,
               /* border: TableBorder.all(),
                columnWidths:{
                  0:FractionColumnWidth(0.5),
                  1:FractionColumnWidth(0.25),
                  2:FractionColumnWidth(0.25),

                },*/
                children: [
                  TableRow(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey,width: 0.5,
                        ),
                      ),
                    ),
                    children: [

                      tableHeader("name"),
                       tableHeader("pre"),

                    ],
                  ),
                  TableRow(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey,width: 0.5,
                        ),
                      ),
                    ),
                    children: [
                      tableHeader("kinan"),
                      tableHeader("sir"),

                    ],
                  ),
                ], 
      ), 
          ),
         ),        
    );
  }
}

Widget tableHeader(text){
  return Container(
    margin: EdgeInsets.symmetric(vertical: 15),
    child: Text(
      text,style: TextStyle(
        fontWeight: FontWeight.bold,color: Colors.black26),
    ),
  );

}
      
    */
*/