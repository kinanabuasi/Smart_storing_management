// ignore_for_file: unused_import, prefer_const_constructors, camel_case_types, avoid_unnecessary_containers

import 'package:flutter/material.dart';
class createtable extends StatefulWidget {
  const createtable({ Key? key }) : super(key: key);

  @override
  _createtableState createState() => _createtableState();
}

class _createtableState extends State<createtable> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Table(
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

                      tableHeader("Head-1-"),
                      tableHeader("Head-2-"),
                      tableHeader("Head-2-"),

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
                   /*   Container(
                        margin:EdgeInsets.symmetric(vertical: 15),
                        child:Row(
                          children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(1000),
                           // child: Image.asset(''),
                          ),
                        ],
                        ),
                      
                      ),*/
                      tableHeader("Kinan"),
                      tableHeader("Marten"),
                      tableHeader("Tom"),

                    ],
                  ),
                ],
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