import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/Drawer/DrawerWidget.dart';
import 'package:untitled/OnTest/HeaderForRejection/RejectionHeader.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/rejected.dart';
class TestingHome extends StatefulWidget {
  const TestingHome({Key? key}) : super(key: key);

  @override
  State<TestingHome> createState() => _TestingHomeState();
}

class _TestingHomeState extends State<TestingHome> {
  @override
  Widget build(BuildContext context) {
    scaffoldKey =  GlobalKey<ScaffoldState>();
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      key: scaffoldKey,
      drawer: DrawerWidget(deviceHeight: deviceHeight,deviceWidth: deviceWidth,),
      body: Stack(
        children: [
          Column(
            children: [
              Container(

                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Color(0xFF050A30),
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(50))),
                child: Center(
                  child: Column(
                    children: [
                      Image.asset('images/cuteKitty.png',
                          width: deviceWidth,//(deviceWidth>800)?deviceWidth/2:400,
                          height: deviceHeight/2)//(deviceWidth>800)?deviceHeight/2:290,)
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: const Color(0xFF050A30),
                  child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(100))),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height /2 ,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top:18.0,bottom: 18),
                                  child: Text(
                                      "T E C H  N E R D S",
                                      style: GoogleFonts.yesevaOne(textStyle: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),)
                                  ),
                                ),

                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Text(
                                        "Store & Discover Top Talents instantly",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.jost(textStyle: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),)
                                    )
                                ),

                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                "Let's Connect With Each Other",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.jost(textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),)
                              )
                            ),
                              ],
                            ),
                            Container(
                              width: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: const Color(0xFFC54B8C),
                                    boxShadow: [
                                      // BoxShadow(
                                      //     color: Colors.pink,
                                      //     blurRadius: 20,
                                      //     offset: Offset(0, 2)),
                                      // BoxShadow(
                                      //     color: Colors.blue,
                                      //     blurRadius: 20,
                                      //     offset: Offset(0, -2)),
                                ]),
                                child: MaterialButton(
                                  elevation: 20,
                                  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>HeadingOfRejection(onPressedH1: (){}, onPressedH2: (){}, onPressedH3: (){})));},
                                  child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "S T A R T",
                                            style: GoogleFonts.jost(textStyle: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                            ),),
                                       //   Icon(Icons.start,color: Colors.black,),
                                        ],
                                      )
                                  ),
                                )),

                          ],
                        ),
                      )),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Align(alignment: Alignment.topRight,child: IconButton(onPressed: (){scaffoldKey?.currentState?.openDrawer();},icon:Icon(Icons.menu,color: Colors.white,size: 30,))),
          ),

        ],
      ),
    );
  }
}
