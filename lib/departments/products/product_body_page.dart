// ignore_for_file: unused_import, camel_case_types, avoid_unnecessary_containers, prefer_const_constructors, unnecessary_string_escapes, must_be_immutable, prefer_const_literals_to_create_immutables, use_function_type_syntax_for_parameters, non_constant_identifier_names, unnecessary_import, duplicate_import, unnecessary_string_interpolations 
//import 'dart:ffi';

import 'package:eleven/additions/constants.dart';
import 'package:eleven/departments/departments_file.dart';
import 'package:eleven/departments/products/details/details_screen.dart';
import 'package:eleven/mainly/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../department.dart';
import 'Product.dart';

class Product_body_page extends StatelessWidget {
final Product? pro;
//final DepCard d;
final Department dep;
  const Product_body_page({ Key? key,required this.pro ,required this.dep}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    text: "Products",
                  ),

                 // mainAxisAlignment:MainAxisAlignment.spaceBetween,

                ],
              ),
                ),
         ), 
       
        actions: [ 
             IconButton(
          onPressed: () {},
          icon: Icon(Icons.delete_sharp),
          color: Colors.black,
        ),
       // Spacer(),
         IconButton(
          onPressed: () {},
          icon: Icon(Icons.edit),
          color: Colors.black,
        ), 
                              
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
                            builder: (context) =>  create_product(),
                          )), 
            child: Text(
              "Add a new product",
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
      
       // child: Expanded(
          child: GridView.builder(
    itemCount:products.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
     crossAxisCount: 2,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 0.2,
                    //childAspectRatio: 0.75,
    ), 
   itemBuilder: (context, index) => ItemCard(
                        product: products[index],
                        press: ()
                        => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                product: products[index],
                              ),
                              //fullscreenDialog: true,
                            ),
                            ),
                      ),
  ),
        //),
    
    ),
  );
  }
}
class ItemCard extends StatelessWidget {
  final Product product;
  final VoidCallback press;
  const ItemCard({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: press,
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
         // Expanded(
            // Container(
              //padding: EdgeInsets.all(5), 
              // height: 180,
              // width: 160,
              //decoration: BoxDecoration(
               // color: product.color,
                //borderRadius: BorderRadius.circular(16),
             // ),
              
                 SizedBox(
                   child: Hero(
                    tag: "${product.id}",
                    child: Image.asset(product.image,scale: 2,),
                    
                ),
                 ),
              //),
           // ),
         // ),
          SizedBox(height: 10,width: 10,),
             Text(
              // products is out demo list
              product.title,
              style: TextStyle(color: kTextLightColor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              ),
            ),
         // ),
         SizedBox(height: 10,width: 10,),
          Text(
            "\$${product.price}",
            style: TextStyle(fontWeight: FontWeight.bold,
            fontSize: 40,
            ),
          )
        ],
      ),
    
  );
  }
}
