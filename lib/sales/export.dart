// ignore_for_file: prefer_const_constructors, unused_import, unused_label, non_constant_identifier_names, camel_case_types, prefer_const_literals_to_create_immutables, sized_box_for_whitespace
import 'package:date_time_picker/date_time_picker.dart';
import 'package:eleven/Api/api.dart';
import 'package:eleven/Api/app.dart';
import 'package:eleven/Api/dealer_api.dart';
import 'package:eleven/Api/product_api.dart';
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

  List<Dealer>? dealers ;
  List<Product>? products ;
  String _selectedMenu = '';
  bool loading = true;
  int dealer_id =1;
  int product_id =1;
  TextEditingController bill = TextEditingController();
  TextEditingController shipping_charge_price = TextEditingController();
  int count = 1;

  @override
  void initState() {
    super.initState();
    Api.getAllProduct().then((serverProducts) {
      Api.getAllDealer().then((serverDealers) {
        products = serverProducts;
        dealers = serverDealers;
        setState((){
          loading = false;
        });
      });
    });
  }

  addExport(){
    if(bill.text.isEmpty){
      App.Err("Bill Cannot be empty", context);
      return;
    }
    if(bill.text.length>7){
      App.Err("Bill Cannot be More Than 7", context);
      return;
    }
    if(shipping_charge_price.text.isEmpty){
      App.Err("shipping price Cannot be empty", context);
      return;
    }

    if(int.parse(shipping_charge_price.text) > 256){
      App.Err("shipping price Cannot be more than 256", context);
      return;
    }
    setState((){
      loading = true;
    });
    Api.addExport(bill.text , shipping_charge_price.text,dealer_id.toString(),product_id.toString(),count.toString()).then((value) {
      setState((){
        loading = false;
      });
      if(value.succ){
        App.Succ("Export has been successfully", context);

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>  Homepage(),
            ));

      }else{
        App.Err(value.msg, context);
      }
    });
  }


  increase(){
    setState((){
      count++;
    });
  }

  decrease(){
    if(count>1){
      setState((){
        count--;
      });
    }
  }

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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: loading?App.Loading()
            :Column(
          children: [
            SizedBox(height: 50,),
            _textField(bill, "billing price"),
            SizedBox(height: 20,),
            _textField(shipping_charge_price, "shipping price"),
            SizedBox(height: 20,),
            Text("Dealer"),
            DropdownButton(

              // Initial Value
              value: dealer_id,

              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: dealers!.map((items) {
                return DropdownMenuItem(
                  value: items.id,
                  child: Text(items.name),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (newValue) {
                setState(() {
                  dealer_id = int.parse(newValue.toString());
                });
              },
            ),

            SizedBox(height: 20,),
            Text("Product"),
            DropdownButton(

              // Initial Value
              value: product_id,

              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: products!.map((items) {
                return DropdownMenuItem(
                  value: items.id,
                  child: Text(items.name),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (newValue) {
                setState(() {
                  product_id = int.parse(newValue.toString());
                });
              },
            ),

            SizedBox(height: 20,),
            Container(
              height: 55,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(25)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: (){
                        increase();
                      },
                      child: Icon(Icons.add,color: Colors.white,),
                  ),
                  Text(count.toString(),style: TextStyle(color: Colors.white,fontSize: 16)),
                  GestureDetector(
                    onTap: (){
                      decrease();
                    },
                    child: Icon(Icons.maximize,color: Colors.white,),
                  ),
                ],
              )
            ),

            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                addExport();
              },
              child: Container(
                height: 55,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Text("Submit"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


  _textField(TextEditingController controller,String hint){
    return Container(
      height: 55,
      color: Colors.grey[200],
      width: MediaQuery.of(context).size.width*0.4,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            hintText: hint
        ),
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