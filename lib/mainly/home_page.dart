// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, sized_box_for_whitespace, unused_local_variable


import 'package:eleven/mainly/sidebar.dart';
import 'package:flutter/material.dart';




class Homepage extends StatefulWidget {
  // const Homepage({ Key? key }) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      
      backgroundColor: Colors.blue,
      drawer: Drawer(
        //elevation: 50,
        
        child: SideBar() ,
      ),
      //drawerScrimColor: Colors.yellow[300],
      appBar: AppBar
        (
        backgroundColor:Colors.transparent,
        elevation: 0.0, 

        actions: [
        /*   PopupMenuButton(
            icon:Icon(Icons.arrow_drop_down) ,
                              itemBuilder: (context)=> const[
                                PopupMenuItem(
                                  value: MenuItem.item1,
                                  child: Text("Latest Export card"),),
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
                              ),*/

          MaterialButton(

            onPressed: null,
            child: Icon(Icons.translate_rounded,size: 35,
            ),
            //disabledColor: Colors.black,
          ),

          MaterialButton(

            onPressed: null,
            child: Icon(Icons.facebook,size: 35,),
            //disabledColor: Colors.black,
          ),

          MaterialButton(

            onPressed: null,
            child: Icon(Icons.smart_display,color: Colors.red,
              size: 35,),
            //disabledColor: Colors.black,
          ),

        /*  MaterialButton(

            onPressed: ()=> SideBar(),
            child: Icon(Icons.search),
            disabledColor: Colors.black,
          ),
           TextField(
               decoration: InputDecoration(
                 labelText: "Login",
               ),

             ),*/
          MaterialButton(

            onPressed: ()=> SideBar(),
            child: Icon(Icons.account_circle_rounded,size: 35,),
            disabledColor: Colors.black,

          ),
        ],

      ),

      body: SingleChildScrollView(
      child:SafeArea(
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children:[
            Container(
              width: 1200,
              height: 200,

              //color: Colors.yellowAccent,
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)),
              child:Column(
                children:[
                   Text.rich( 
              TextSpan(
                style: TextStyle(
                    fontSize: 16,color: Colors.black
                ),
                children: [
                  TextSpan(
                    text: "Welcome to get the best result to manage your storing system",
                  ),

                 // mainAxisAlignment:MainAxisAlignment.spaceBetween,

                ],
              ),
                ),
                
            
            SizedBox(
              height: 10,),

            TextButton(
            onPressed: (){},
            child: Text("Read more..",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
            ),
                ],
            ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                 // flex: 8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                       Image(image:AssetImage('asset/wa.JPEG'),
                          width: 600,height: 400,
                       ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20,top: 5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      //margin: EdgeInsets.symmetric(vertical: 20),
                                   // child:Image.asset('ware.jpg'),
                                    width:200,
                                    height:100,
                                    color: Colors.deepPurpleAccent,

                                ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                     // margin: EdgeInsets.symmetric(vertical: 15),
                                      //child:Image.asset('ware.jpg'),
                                      width:200,
                                      height:100,
                                      color: Colors.deepPurpleAccent,

                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:70,top: 5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      //margin: EdgeInsets.symmetric(vertical: 20),
                                      //child:Image.asset('ware.jpg'),
                                      width:200,
                                      height:100,
                                      color: Colors.green,

                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      // margin: EdgeInsets.symmetric(vertical: 15),
                                      //child:Image.asset('ware.jpg'),
                                      width:200,
                                      height:100,
                                      color: Colors.green,

                                    ),
                                  ),
                                ],
                              ),
                            ),



                          ],
                        ),

                    ],
                  ),
                ),
                Expanded(
                 // flex: 8,
                  child: Column(
                    children:[
                      Container(
                       // margin: EdgeInsets.symmetric(vertical: 50,horizontal: 10),
                        child:Image(image:AssetImage('asset/ware.JPEG'),
                          width:500,
                          height:300,),
                        width:1000,
                        height:500,
                        //color: Colors.white60,

                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 50,top: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    //margin: EdgeInsets.symmetric(vertical: 20),
                                    //child:Image.asset('ware.jpg'),
                                    width:200,
                                    height:100,
                                    color: Colors.brown,

                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    // margin: EdgeInsets.symmetric(vertical: 15),
                                    //child:Image.asset('ware.jpg'),
                                    width:200,
                                    height:100,
                                    color: Colors.brown,

                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:70,top: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    //margin: EdgeInsets.symmetric(vertical: 20),
                                    //child:Image.asset('ware.jpg'),
                                    width:200,
                                    height:100,
                                    color: Colors.limeAccent,

                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    // margin: EdgeInsets.symmetric(vertical: 15),
                                    //child:Image.asset('ware.jpg'),
                                    width:200,
                                    height:100,
                                    color: Colors.limeAccent,

                                  ),
                                ),
                              ],
                            ),
                          ),



                        ],
                      ),

                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.tealAccent,
                      width: 1300,
                      height: 500,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Center(
                    child: Container(
                      color: Colors.white54,
                      width: 1300,
                      height: 300,
                      child: Text("Baskerville"),
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
}
