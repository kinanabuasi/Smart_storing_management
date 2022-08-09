/*
import 'package:flutter/material.dart';

import 'home_page.dart';
class Export extends StatefulWidget {
  const Export({Key? key}) : super(key: key);

  @override
  _ExportState createState() => _ExportState();
}

class _ExportState extends State<Export> {
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
           const TextSpan(
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
    );
  }
}
class creat_Export extends StatelessWidget {
  const creat_Export({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
*/