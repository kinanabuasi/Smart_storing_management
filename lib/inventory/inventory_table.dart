// ignore_for_file: unused_import, camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class inventory_security extends StatefulWidget {
  const inventory_security({Key? key}) : super(key: key);

  @override
  _inventory_securityState createState() => _inventory_securityState();
}

class _inventory_securityState extends State<inventory_security> {

  final List<Map> _books = [
    {'id': 100, 'title': 'Flutter Basics', 'author': 'David John'},
    {'id': 102, 'title': 'Git and GitHub', 'author': 'Merlin Nick'},
    {'id': 101, 'title': 'Flutter Basics', 'author': 'David John'},
  ];
  bool? _isEditMode = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('DataTable Demo'),
        ),
        body: ListView(
          children: [_createDataTable(), _createCheckboxField()],
        ),
      ),
    );
  }

  DataTable _createDataTable() {
    return DataTable(columns: _createColumns(), rows: _createRows());
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(label: Text('ID')),
      DataColumn(label: Text('Book')),
      DataColumn(label: Text('Author'))
    ];
  }

  List<DataRow> _createRows() {
    return _books
        .map((book) => DataRow(cells: [
      DataCell(Text('#' + book['id'].toString())),
      _createTitleCell(book['title']),
      DataCell(Text(book['author']))
    ]))
        .toList();
  }

  DataCell _createTitleCell(bookTitle) {
    return DataCell(_isEditMode == true
        ? TextFormField(initialValue: bookTitle, style: TextStyle(fontSize: 14))
        : Text(bookTitle));
  }

  Row _createCheckboxField() {
    return Row(
      children: [
        Checkbox(
          value: _isEditMode,
          onChanged: (value) {
            setState(() {
              _isEditMode = value;
            });
          },
        ),
        Text('Edit mode'),
      ],
    );
  }
}

/*
   SafeArea(
          child: Container(
            width: 1000,height: 1000,
      alignment: Alignment.center,
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
   */
Widget tableHeader(text) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 15),
    child: Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black26),
    ),
  );
}
