// ignore_for_file: unused_import, camel_case_types, avoid_unnecessary_containers, prefer_const_constructors, unnecessary_string_escapes, must_be_immutable, unnecessary_import, unnecessary_const, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations, non_constant_identifier_names

import 'package:eleven/Api/api.dart';
import 'package:eleven/departments/department.dart';
import 'package:eleven/departments/products/product_body_page.dart';
import 'package:eleven/departments/products/Product.dart';
import 'package:eleven/departments/products/details/details_screen.dart';
import 'package:eleven/mainly/home_page.dart';
import 'package:eleven/purchase/Import.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'department.dart';
import 'dart:core';
import 'package:eleven/Api/department_api.dart';
//import 'package:eleven/Api/product_api.dart';

class departments extends StatefulWidget {
  const departments({ Key? key }) : super(key: key);

  @override
  State<departments> createState() => _departmentsState();
}
// Product? pro;
class _departmentsState extends State<departments> {
  
  List<Department> deps = <Department>[];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    Api.getAllDepartment().then((serverData) {
      //products = serverProducts;
      deps = serverData;
      print(deps.length);
      setState((){
        loading = false;
      });
    });
  }
  
  
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
                    text: "Departments",
                  ),

                 // mainAxisAlignment:MainAxisAlignment.spaceBetween,

                ],
              ),
                ),
         ), 
       
        actions: [ 
                              
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
                            builder: (context) =>  create_department(context),
                          )), 
            child: Text(
              "Add a new department",
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
        body: loading
            ?Container(
              width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
          child: Center(
            child: CircularProgressIndicator(),
          ),
            )
            :GridView.builder(
    itemCount:deps.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
     crossAxisCount: 3,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1,
                 // childAspectRatio: 0.75,
    ), 
   itemBuilder: (context, index) =>
          Container(
            height: 55,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(10)
            ),
            child: DepCard(
                       dep: deps[index]

                      ),
          ),
  ),
    
  );
  }
}
class DepCard extends StatelessWidget {
   final Department dep;
  const DepCard({
    Key? key,
    required this.dep,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: GestureDetector(
        onTap: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>  Product_body_page(dep: dep,products: dep.products,),
              ));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           // Expanded(

           // ),
            Padding(
              padding: const EdgeInsets.symmetric(),
              child: Text(
                // products is out demo list
                dep.name,
                style: TextStyle(color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                ),
              ),
            ),

          ],
        ),

  ),
    );
  }
}


Widget create_department(BuildContext context) {
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
                    text: "Departments",
                  ),

                 // mainAxisAlignment:MainAxisAlignment.spaceBetween,

                ],
              ),
                ),
         ), 
       
        actions: <Widget>[ 
              
        ],
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
        SizedBox(height: 70),
        TextField(
          //textAlign: TextAlign.start,
          //expands: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(
              Icons.vpn_key,
            ),
            labelText: 'Enter Dep_id',
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(
              Icons.snippet_folder_outlined,
            ),
            labelText: 'Enter Department_name',
          ),
        ),
        SizedBox(height: 20),
        TextField(
          //textAlign: TextAlign.start,
          //expands: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(
              Icons.portrait,
            ),
            labelText: 'Enter Employee_full name',
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
                            builder: (context) =>  departments(),
                          )),
          color: Colors.lightBlue,
          splashColor: Colors.white70,
          child: Text("Save and back",
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
                            builder: (context) =>  create_product(),
                          )),
          color: Colors.lightBlue,
          splashColor: Colors.white70,
          child: Text("Add a product",
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


class create_product extends StatelessWidget {
   create_product({Key? key}) : super(key: key);
  Api? a;
  String? name;
  int? dep_id,product_code, purchasing_price,
      seling_price; String? note, imagePath;

  bool loading = true;
  /*void initState() {
    super.initState();
    Api.addProduct(name!, dep_id!, product_code!, purchasing_price!,
        seling_price!, note!, imagePath!).then((serverProducts) {
     // products = serverProducts;
      setState((){
        loading = false;
      });
    });
  }*/
   @override
   Widget build(BuildContext context) {
  var myController=TextEditingController();
    Size size = MediaQuery.of(context).size;
  //void _setText() {
    /*setState(() {
      myController= product_code as TextEditingController ;
    });*/
  //}

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
                    text: "creating a products",
                  ), 
                ],
              ),
                ),
         ), 
       
        actions: [ 
         
        ],
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
          SizedBox(height: 100),
          Row( 
            children: [
          TextField(
           controller:myController,
            // product_code=controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(
                Icons.vpn_key,
              ),
              labelText: 'Enter pro_id',
            ),
          ),
          
            ],
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(
                Icons.storefront_outlined,
              ),
              labelText: 'Enter production name',
            ),

          ),
          SizedBox(height: 10),  
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(
                Icons.vpn_key,
              ),
              labelText: 'Enter a department id',
              
            ),
            onTap:()=>{ PopupMenuButton(
            icon:Icon(Icons.arrow_drop_down) ,
                              itemBuilder: (context)=>[
                                PopupMenuItem(
                                  child: Text("01"),)
                              ]
                              ),
                              },
          ),
           SizedBox(height: 10),  
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(
                Icons.storefront_outlined,
              ),
              labelText: 'Enter purchasing_price',
            ),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(
                Icons.storefront_outlined,
              ),
              labelText: 'Enter selling_price',
            ),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(
                Icons.storefront_outlined,
              ),
              labelText: 'Enter product-notes',
            ),
          ),
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
                            builder: (context) => create_product(),
                          )),
          color: Colors.lightBlue,
          splashColor: Colors.white70,
          child: Text("Save and add more products",
          style: TextStyle(fontSize: 20,
            color: Colors.white,
          ),
          ),

        ),
        MaterialButton( 
          height: 70,
          minWidth: 200,
          onPressed:() => Navigator.pop(context,false),
          color: Colors.lightBlue,
          splashColor: Colors.white70,
          child: Text("Save and go back",
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
}



 



