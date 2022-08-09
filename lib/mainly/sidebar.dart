// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_web_libraries_in_flutter, unused_import, unnecessary_import, must_be_immutable

//import 'dart:html';

import 'package:eleven/Api/signup.dart';
import 'package:eleven/Diary/D-receiption.dart';
import 'package:eleven/Diary/D_Handing.dart';
import 'package:eleven/departments/departments_file.dart';
import 'package:eleven/inventory/item_groups.dart';
import 'package:eleven/mainly/operation_security.dart';
import 'package:eleven/purchase/Import.dart';
import 'package:eleven/purchase/vendors.dart';
import 'package:eleven/sales/customers.dart';
import 'package:eleven/sales/export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.zero,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //padding: const EdgeInsets.only(top: 20),
        DrawerHeader(
          decoration: BoxDecoration(color: Colors.amber[300]),
          margin: EdgeInsets.all(1),
          // padding: EdgeInsets.only(bottom: 1,top: 1),
          child: Text(
            "Smart Storing Mangement ",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.search),
            labelText: 'Search',
          ),
        ),

        //  child: Drawer(
        // padding: EdgeInsets.zero,
        //
        //ListView(
        //children:<Widget>[
        DrawerList(
          title: "Dashboard",
          icon1: Icon(
            Icons.house,
            color: Colors.deepPurpleAccent[500],
          ),
          press: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Homepage(),
            ),
          ),
          icon2: Icon(Icons.circle, size: 1),
        ),

        ExpansionTile(
            onExpansionChanged: (b) {
              setState(
                () {},
              );
            },
            title: Text("sales"),
            leading: Icon(Icons.shop_outlined),
            trailing: Icon(
              Icons.keyboard_arrow_down,
            ),

            // ),
            children: <Widget>[
              DrawerList(
                title: "Export",
                icon1: Icon(Icons.import_export_outlined),
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Export(),
                  ),
                ),
                icon2: Icon(Icons.circle, size: 1),
              ),
              DrawerList(
                title: "Customers",
                icon1: Icon(Icons.people_rounded),
                icon2: Icon(Icons.circle, size: 1),
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => customers(),
                  ),
                ),
              ),
            ]),

        ExpansionTile(
          onExpansionChanged: (b) {
            setState(
              () {},
            );
          },
          title: Text("Purchasing"),
          leading: Icon(Icons.shopping_cart_rounded),
          trailing: Icon(
            Icons.keyboard_arrow_down,
          ),
          children: <Widget>[
            DrawerList(
              title: "Import",
              icon1: Icon(Icons.import_export_outlined),
              press: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Import(),
                ),
              ),
              icon2: Icon(Icons.circle, size: 1),
            ),
            DrawerList(
              title: "vendors",
              icon1: Icon(Icons.people),
              press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => vendors(),
                  )),
              icon2: Icon(Icons.circle, size: 1),
            ),
          ],
        ),

        DrawerList(
          title: "Departments",
          icon1: Icon(Icons.featured_play_list_sharp),
          press: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => departments(),
            ),
          ),
          icon2: Icon(Icons.circle, size: 1),
        ),
        ExpansionTile(
          onExpansionChanged: (b) {
            setState(
              () {},
            );
          },
          title: Text("internal Diary"),
          leading: Icon(Icons.dynamic_feed_sharp),
          trailing: Icon(
            Icons.keyboard_arrow_down,
          ),

          // ),
          children: <Widget>[
            DrawerList(
              title: "Diary Receiption(from departments)",
              icon1: Icon(Icons.event_note),
              press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => D_receiption(),
                  )),
              icon2: Icon(Icons.circle, size: 1),
            ),
            DrawerList(
              title: "Diary Handing(to departments)",
              icon1: Icon(Icons.event_note_outlined),
              icon2: Icon(Icons.circle, size: 1),
              press: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => D_handing(),
                ),
              ),
            ),
          ],
        ),
        ExpansionTile(
          onExpansionChanged: (b) {
            setState(
              () {},
            );
          },
          title: Text("Inventory"),
          leading: Icon(Icons.inventory_2),
          trailing: Icon(
            Icons.keyboard_arrow_down,
          ),

          // ),
          children: <Widget>[
            DrawerList(
              title: "Item Group",
              icon1: Icon(Icons.inventory_rounded),
              icon2: Icon(Icons.circle, size: 1),
              press: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => inventory(),
                ),
              ),
            ),
          ],
        ),
        DrawerList(
          title: "Security_table",
          icon1: Icon(Icons.security),
          icon2: Icon(Icons.circle, size: 1),
          press: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => security_table(),
            ),
          ),
        ),
        DrawerList(
          title: "Help center",
          icon1: Icon(Icons.help_center),
          press: () {},
          icon2: Icon(Icons.circle, size: 1),
        ),
        DrawerList(
          title: "Contact us",
          icon1: Icon(Icons.mail),
          press: () {},
          icon2: Icon(Icons.circle, size: 1),
        ),
        DrawerList(
          title: "Report",
          icon1: Icon(Icons.report),
          press: () {},
          icon2: Icon(Icons.circle, size: 1),
        ),
        DrawerList(
          title: "Account",
          icon1: Icon(Icons.account_box),
          press: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SignUp(),
            ),
          ),
          icon2: Icon(Icons.circle, size: 1),
        ),

        // ],
        // ),
        //  ),
        // ),
      ],
      // ),

      // ),
    );
  }
}

class DrawerList extends StatelessWidget {
  // ignore: unnecessary_new
  final String? title;
  //final IconData ? icon1;
  final VoidCallback? press;

  Icon icon1;
  Icon icon2;
  DrawerList(
      {Key? key,
      this.title,
      required this.icon1,
      required this.icon2,
      this.press})
      : super(key: key);
//DrawerList b;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon1,

      title: Text(
        title!,
        style: TextStyle(color: Colors.brown),
      ),
      trailing: icon2,
      //iconColor: Colors.yellow,
      onTap: press,
    );
  }
}

/*Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      //child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(top: 50),
            width: 50,
          height: 20,
          child:icon1,
    ),
          ListTile(
            leading: icon1,
          title: Text(title!,style: TextStyle(
    color: Colors.brown
    ),
    ),

    //iconColor: Colors.yellow,
    onTap: press,
    ),
          //),

     // ),
        ],
    );*/
