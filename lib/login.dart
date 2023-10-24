import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
final _auth = FirebaseAuth.instance;
String email="";
String passs="";
String e_message ="";
class Login extends StatefulWidget {
  Login(){
    osCheck();
  }
  double os = 1.0;
  void osCheck(){
    if (kIsWeb) {
      os = 0.5;
    }
  }
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
                stops: [0.4,0.7,0.9],
                colors: [Colors.purple.shade400,Colors.purple.shade600,Colors.purple.shade800]
            ),
          ),
          padding: EdgeInsets.all(40.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Log in",
                    style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Welcome, Please enter your credentials to use the app",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    child: FractionallySizedBox(
                      widthFactor: MediaQuery.of(context).size.width > 700 ? 0.5 : 1,
                      child: TextFormField(
                        onChanged: (value){
                          setState(() {
                            email = value;
                          });
                        },
                        decoration: InputDecoration(
                          icon: Icon(
                              Icons.account_circle_outlined,
                              color: Colors.black
                          ),
                          labelText: "Email",
                          labelStyle: TextStyle(fontStyle: FontStyle.italic,color:Colors.black),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(200),
                              borderSide: BorderSide(color: Colors.black,width: 3.0)
                          ),
                          focusedBorder:  OutlineInputBorder(
                              borderRadius: BorderRadius.circular(200),
                              borderSide: BorderSide(color: Colors.black87,width: 3.0)
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    child: FractionallySizedBox(
                      widthFactor: MediaQuery.of(context).size.width > 600 ? 0.5 : 1,
                      child: TextFormField(
                        obscureText: true,
                        onChanged: (value){
                          setState((){
                            passs = value;
                          });
                        },
                        decoration: InputDecoration(
                          icon: Icon(
                              Icons.account_circle_outlined,
                              color: Colors.black
                          ),
                          labelText: "Password",
                          labelStyle: TextStyle(fontStyle: FontStyle.italic,color:Colors.black),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(200),
                              borderSide: BorderSide(color: Colors.black,width: 3.0)
                          ),
                          focusedBorder:  OutlineInputBorder(
                              borderRadius: BorderRadius.circular(200),
                              borderSide: BorderSide(color: Colors.black87,width: 3.0)
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15,left: 25,right: 15),
                  child: Text("Not a user? Register here",  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: Colors.white)),
                ),
                Material(
                  child: MaterialButton(
                    onPressed: () async{
                      var user = await _auth.createUserWithEmailAndPassword(
                          email: email.replaceAll(" ",""), password: passs.replaceAll(" ", ""));

                    },
                    child: Text(
                      "Log in"
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}

// class Login extends StatelessWidget {
//   Login({super.key}){
//     osCheck();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }
