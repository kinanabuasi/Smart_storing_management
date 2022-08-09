

// ignore_for_file: unused_import, use_key_in_widget_constructors, unnecessary_import, prefer_const_constructors, avoid_print, deprecated_member_use
/*
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class ImageUpload extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ImageUpload();
  }
}

class _ImageUpload extends State<ImageUpload>{

 late  File  uploadimage; //variable for choosed file

  Future<void> chooseImage() async {
        var choosedimage =  ImagePicker.pickImage(source: ImageSource.gallery);
        //set source: ImageSource.camera to get image from camera
        setState(() {
            uploadimage = choosedimage as File;
        });
  }

  Future<void> uploadImage() async {
     //show your own loading or progressing code here

     String uploadurl = "http://192.168.0.112/test/image_upload.php";
     //dont use http://localhost , because emulator don't get that address
     //insted use your local IP address or use live URL
     //hit "ipconfig" in windows or "ip a" in linux to get you local IP

    try{
      List<int> imageBytes = uploadimage!.readAsBytesSync();
      String baseimage = base64Encode(imageBytes);
      //convert file image to Base64 encoding
      var response = await http.post(
              uploadurl, 
              body: {
                 'image': baseimage,
              }
      );
      if(response.statusCode == 200){
         var jsondata = json.decode(response.body); //decode json data
         if(jsondata["error"]){ //check error sent from server
             print(jsondata["msg"]);
             //if error return from server, show message from server
         }else{
             print("Upload successful");
         }
      }else{
        print("Error during connection to server");
        //there is error during connecting to server,
        //status code might be 404 = url not found
      }
    }catch(e){
       print("Error during converting to Base64");
       //there is error during converting file image to base64 encoding. 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
           title: Text("Upload Image to Server"),
           backgroundColor: Colors.deepOrangeAccent,
         ),
         body:Container(
             height:300,
             alignment: Alignment.center,
             child:Column(
                    mainAxisAlignment: MainAxisAlignment.center, //content alignment to center 
                    children: <Widget>[
                        Container(  //show image here after choosing image
                            child:uploadimage == null? 
                               Container(): //if uploadimage is null then show empty container
                               Container(   //elese show image here
                                  child: SizedBox( 
                                     height:150,
                                     child:Image.file(uploadimage!) //load image from file
                                  )
                               )
                        ),

                        Container( 
                            //show upload button after choosing image
                          child:uploadimage == null? 
                               Container(): //if uploadimage is null then show empty container
                               Container(   //elese show uplaod button
                                  child:RaisedButton.icon(
                                    onPressed: (){
                                        uploadImage();
                                        //start uploading image
                                    }, 
                                    icon: Icon(Icons.file_upload), 
                                    label: Text("UPLOAD IMAGE"),
                                    color: Colors.deepOrangeAccent,
                                    colorBrightness: Brightness.dark,
                                    //set brghtness to dark, because deepOrangeAccent is darker coler
                                    //so that its text color is light
                                  )
                               ) 
                        ),

                        Container(
                          child: RaisedButton.icon(
                            onPressed: (){
                                chooseImage(); // call choose image function
                            },
                            icon:Icon(Icons.folder_open),
                            label: Text("CHOOSE IMAGE"),
                            color: Colors.deepOrangeAccent,
                            colorBrightness: Brightness.dark,
                          ),
                        )
              ],),
          ),
    );
  }
}

*/







/*
class CustomFilePicker extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _CustomFilePicker();
  }
}

class _CustomFilePicker extends State<CustomFilePicker>{



  

  File selectedfile;
  Response response;
  String progress;
  Dio dio = new Dio();

  selectFile() async {
     selectedfile = await FilePicker.getFile(
          type: FileType.custom,
          allowedExtensions: ['jpg', 'pdf', 'mp4'],
          //allowed extension to choose
     );
     
    //for file_pocker plugin version 2 or 2+
    /*
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'mp4'],
      //allowed extension to choose
    );

    if (result != null) {
      //if there is selected file
      selectedfile = File(result.files.single.path);
    } */
    
     setState((){}); //update the UI so that file name is shown
  }

  uploadFile() async {
     String uploadurl = "http://192.168.0.112/test/file_upload.php";
     //dont use http://localhost , because emulator don't get that address
     //insted use your local IP address or use live URL
     //hit "ipconfig" in windows or "ip a" in linux to get you local IP

     FormData formdata = FormData.fromMap({
          "file": await MultipartFile.fromFile(
                 selectedfile.path, 
                 filename: basename(selectedfile.path) 
                 //show only filename from path
           ),
      });

      response = await dio.post(uploadurl, 
          data: formdata,
          onSendProgress: (int sent, int total) {
              String percentage = (sent/total*100).toStringAsFixed(2);
              setState(() {
                   progress = "$sent" + " Bytes of " "$total Bytes - " +  percentage + " % uploaded";
                   //update the progress
              });
          },);
          
      if(response.statusCode == 200){
            print(response.toString()); 
            //print response from server
      }else{ 
          print("Error during connection to server.");
      }
  }
  
  @override
  Widget build(BuildContext context) {
      return Scaffold(
         appBar: AppBar(
             title:Text("Select File and Upload"),
             backgroundColor: Colors.orangeAccent,
         ), //set appbar
         body:Container( 
            alignment: Alignment.center,
             padding: EdgeInsets.all(40),
             child:Column(children: <Widget>[

                  Container( 
                      margin: EdgeInsets.all(10),
                      //show file name here
                      child:progress == null?
                            Text("Progress: 0%"):
                            Text(basename("Progress: $progress"), 
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18),),
                      //show progress status here
                  ),
                  
                  Container( 
                      margin: EdgeInsets.all(10),
                      //show file name here
                      child:selectedfile == null?
                            Text("Choose File"):
                            Text(basename(selectedfile.path)),
                      //basename is from path package, to get filename from path
                      //check if file is selected, if yes then show file name
                  ),

                  Container( 
                     child:RaisedButton.icon(
                       onPressed: (){
                         selectFile();
                       },
                       icon: Icon(Icons.folder_open), 
                       label: Text("CHOOSE FILE"),
                       color: Colors.redAccent,
                       colorBrightness: Brightness.dark,
                      )
                  ),

                  //if selectedfile is null then show empty container
                  //if file is selected then show upload button
                  selectedfile == null?
                  Container():
                  Container( 
                     child:RaisedButton.icon(
                       onPressed: (){ 
                         uploadFile();
                       }, 
                       icon: Icon(Icons.folder_open), 
                       label: Text("UPLOAD FILE"),
                       color: Colors.redAccent,
                       colorBrightness: Brightness.dark,
                      )
                  )
                  
             ],)
         )
      );
  }
}*/