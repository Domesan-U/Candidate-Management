import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/constants.dart';

import '../NavBar/NavBarWidget.dart';
class AboutPage extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    final double deviceWidth=MediaQuery.of(context).size.width;
    final double deviceHeight =MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children:[
          Container(
            decoration: BoxDecoration(
              color: containerBg,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50)
              )
            ),
            child: Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text("A B O U T",style: GoogleFonts.yesevaOne(textStyle: TextStyle(fontWeight: FontWeight.bold),color: Colors.white),),
            ),
            ),
          ),
          Container(
            color: containerBg,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50)
                  )
              ),
              child: Container(
                width: deviceWidth,
                height: deviceHeight/1.5,
                child: Column(
                  children: [
                      Text("We have ")
                  ],
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}
