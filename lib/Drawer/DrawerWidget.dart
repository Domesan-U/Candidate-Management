import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/FullDetailedPage.dart';
import 'package:untitled/OnTest/TestingHomePage.dart';
import 'package:untitled/rejected.dart';

import '../About/about.dart';
import '../OnTest/HeaderForRejection/RejectionHeader.dart';
import '../UpcomingApplicant.dart';
class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
    required this.deviceWidth,
    required this.deviceHeight,
  });

  final double deviceWidth;
  final double deviceHeight;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 20,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            color: const Color(0xFF050A30),
            child: Card(
              color: const Color(0xFF050A30),
              elevation: 10,
              margin: EdgeInsets.zero,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                            height: 200,
                            width: 300,
                            child: Image(
                              alignment: Alignment.centerLeft,
                              image: AssetImage('images/cuteKitty.png'),
                              width: deviceWidth * 0.45,
                              height: deviceHeight * 0.25,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "T E C H  N E R D S",
                          style:  GoogleFonts.yesevaOne(textStyle:TextStyle(color: Colors.white, fontSize: 25)),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                        title: Text(
                          'Home',
                          style:  GoogleFonts.jost(textStyle:TextStyle(color: Colors.white, fontSize: 19)),
                        ),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>TestingHome()));
                          // Navigate to the Home page
                          // Add code to navigate to the Home page
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: ListTile(
                          leading: Icon(
                            Icons.storage_outlined,
                            color: Colors.white,
                          ),
                          title: Text(
                            'DataBase',
                            style: GoogleFonts.jost(textStyle:TextStyle(color: Colors.white, fontSize: 19)),
                          ),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>HeadingOfRejection(onPressedH1: (){}, onPressedH2: (){}, onPressedH3: (){})));}

                            // Navigate to the Home page
                            // Add code to navigate to the Home page
                          ,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Center(
                          child: ListTile(
                            leading: Icon(
                              Icons.add_circle_outline,
                              color: Colors.white,
                            ),
                            title: Text(
                              'New Candidate',
                              style:  GoogleFonts.jost(textStyle:TextStyle(color: Colors.white, fontSize: 19)),
                            ),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>check()));
                              // Navigate to the Home page
                              // Add code to navigate to the Home page
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: ListTile(
                          leading: const Icon(
                            Icons.storage_outlined,
                            color: Colors.white,
                          ),
                          title: Text(
                            'About',
                            style:  GoogleFonts.jost(textStyle:TextStyle(color: Colors.white, fontSize: 19)),
                          ),
                          onTap: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>AboutPage()));
                            // Navigate to the Home page
                            // Add code to navigate to the Home page
                          },
                        ),
                      ),

                    ],
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Text(
                            "Follow Us",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                child: Text(
                                  "  ",
                                  style: TextStyle(color: Colors.white),
                                )),
                            Image.asset('images/insta_icon.gif', width: 20),
                            SizedBox(
                                child: Text(
                                  "  ",
                                  style: TextStyle(color: Colors.white),
                                )),
                            Image.asset(
                              'images/facebook.gif',
                              width: 20,
                            ),
                            SizedBox(
                                child: Text(
                                  "  ",
                                  style: TextStyle(color: Colors.white),
                                )),
                            Image.asset(
                              'images/gmail.gif',
                              width: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
