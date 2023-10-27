import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/Drawer/DrawerWidget.dart';
import 'package:untitled/FullDetailedPage.dart';
import 'package:untitled/constants.dart';

class ForMobileClick extends StatefulWidget {
  ForMobileClick(this.fullDetailVar);
  Map<String, dynamic>? fullDetailVar;
  @override
  State<ForMobileClick> createState() => _ForMobileClickState();
}

GlobalKey<ScaffoldState> scaffoldKeyForMobile = GlobalKey<ScaffoldState>();
class _ForMobileClickState extends State<ForMobileClick> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKeyForMobile,
      drawer: DrawerWidget(deviceWidth: MediaQuery.of(context).size.width,deviceHeight: MediaQuery.of(context).size.height,),
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
          Container(
            decoration: BoxDecoration(
                color: containerBg,
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(50)
                )
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("S T O R E  H O U S E",style: GoogleFonts.yesevaOne(textStyle: TextStyle(fontWeight: FontWeight.bold),color: Colors.white),),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top:15.0),
                            child: Text("P E R S O N A L  I N F O",style: GoogleFonts.yesevaOne(textStyle: TextStyle(fontWeight: FontWeight.bold),color: Colors.white),),
                          ),
                        ],
                      ),


                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: IconButton(
                      icon: const Icon(Icons.menu,color: Colors.white),
                      onPressed: (){
                        print("pressed inside formobileIcon");
                        scaffoldKeyForMobile.currentState?.openDrawer();
                      },
                    ),
                  ),
                )

              ],
            ),
          ),
            Container(
              margin: EdgeInsets.zero,
              color: containerBg,
              child: Container(
                margin: EdgeInsets.zero,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50)
                    )
                ),
                child: Center(
                  child: FullDetailPage(fullDetailVar: widget.fullDetailVar
                  ,),
                ),
              ),
            )
          ]
        ),
      ),
    );
  }
}
