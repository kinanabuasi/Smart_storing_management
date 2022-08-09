import 'package:eleven/Api/signup.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  String dropdownvalue = 'User';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width*0.5,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment(0.8, 1),
                    colors: <Color>[
                      Colors.blue.withOpacity(0.9),
                      Colors.blue.withOpacity(0.8),
                      Colors.blue.withOpacity(0.7),
                      Colors.blue.withOpacity(0.6),
                    ], // Gradient from https://learnui.design/tools/gradient-generator.html
                    tileMode: TileMode.mirror,
                  ),
                ),
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Welcome",style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.bold),),
                        SizedBox(height: 20,),
                        Text("to get your purchasing needs"
                            " and see our special products with the suite prices",
                          style: TextStyle(fontSize: 20,color: Colors.white),),

                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    SizedBox(height: 50,),
                    Text("Sign in For Free",style: TextStyle(fontSize: 20)),

                    SizedBox(height: 20,),
                    _textField(email,"Email"),
                    SizedBox(height: 20,),
                    _textField(password,"Password"),

                    SizedBox(height: 30,),
                    GestureDetector(
                      onTap: (){
                        //todo signup
                        // Api.getAllDealer();
                      },
                      child:  ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlue,
                          //elevation: 5,
                          padding: const EdgeInsets.symmetric(horizontal: 240,vertical: 25),
                          shape:RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          // maximumSize: MaximumSize.max,
                        ),
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  const SignIn(),
                            )),
                        child: const Text(
                          "Sign in",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("You don't have an account"),
                        TextButton(
                          onPressed: ()=> Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  const SignUp(),
                              )),
                          child: const Text("Sign Up"),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
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