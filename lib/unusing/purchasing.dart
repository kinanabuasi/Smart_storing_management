/*import 'package:flutter/material.dart';

class purchasing extends StatefulWidget {
  const purchasing({Key? key}) : super(key: key);

  @override
  _purchasingState createState() => _purchasingState();
}

class _purchasingState extends State<purchasing> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Row(
        children: [
          Column(
            children:[
              Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                //defaultColumnWidth: ,
                border: TableBorder.all(),
                columnWidths:{
                  0:FractionColumnWidth(0.5),
                  1:FractionColumnWidth(0.25),
                  2:FractionColumnWidth(0.25),

                },
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


                    ],
                  ),
                ],
              ),
            ],

          ),
          Column(

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
      text,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black26),
    ),
  );

}
*/