import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/constants.dart';

import '../NavBar/NavBarWidget.dart';

class AboutPage extends StatelessWidget {
  @override
  double contentSize =16;
  double headingSize =24;
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [
            Container(
              decoration: BoxDecoration(
                  color: containerBg,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(50))),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Padding(
                    padding: const EdgeInsets.only(top:30.0),
                    child: Text(
                      "A B O U T",
                      style: GoogleFonts.yesevaOne(
                          textStyle: TextStyle(fontWeight: FontWeight.bold),
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              color: containerBg,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                   bottomRight: Radius.circular(100)
                        )),
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: deviceWidth,
                          height: deviceHeight / 1.2686,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ListView(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Center(
                                      child: Text(
                                          textAlign: TextAlign.justify,
                                          style: GoogleFonts.yesevaOne(
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: headingSize)),
                                          "Who We Are?")),
                                ),
                                LayoutBuilder(builder: (context, constraints) {
                                  if (deviceWidth > 800)
                                    return Column(children: [
                                      Row(
                                        children: [
                                          Container(
                                            width:
                                                200.0, // Set the desired width
                                            height:
                                                200.0, // Set the desired height
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'images/dms.jpg'),
                                                fit: BoxFit.cover,
                                                alignment: Alignment(0, 0.8),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                  textAlign: TextAlign.justify,
                                                  style: GoogleFonts.jost(
                                                      textStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,fontSize: contentSize)),
                                                  '''      ❝As a dedicated and ambitious pre-final year college student, I am deeply committed to the world of software development, always seeking opportunities to learn, grow, and create. With an impressive track record of developing a wide array of applications and serving as a proficient freelancer, I possess a unique blend of technical expertise and a relentless passion for innovation. I consider myself a steward of technology, driven by the belief that code has the potential to shape our future. Join me on this journey through the dynamic realm of software development, where we turn ideas into solutions, and where the pursuit of excellence is non-negotiable❞ '''          ),
                                          ),)
                                        ],
                                      ),
                                      Text("Why This App?",  style: GoogleFonts.yesevaOne(
                                          textStyle: TextStyle(
                                              fontWeight:
                                              FontWeight.bold,fontSize: headingSize)),),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.all(8.0),
                                              child: Text(
                                                  textAlign: TextAlign.justify,
                                                  style: GoogleFonts.jost(
                                                      textStyle: TextStyle(
                                                          fontWeight:
                                                          FontWeight.w500,fontSize: contentSize)),
                                                  '''      ❝Explore the Interview Management App, a game-changer in candidate recruitment. Simplify your candidate tracking, effortlessly access resumes, and filter applicants by skills. Our user-friendly interface transforms the recruitment journey. Gain insights from past candidates, schedule interviews, and make data-driven decisions. Experience mobile convenience, robust data security, and seamless team collaboration. Unleash your competitive edge with modern recruitment technology❞ '''          ),
                                            ),),
                                          Container(
                                            width:
                                            200.0, // Set the desired width
                                            height:
                                            200.0, // Set the desired height
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'images/cuteKitty.png'),
                                                fit: BoxFit.cover,
                                                alignment: Alignment(0, 0.8),
                                              ),
                                            ),
                                          ),

                                        ],
                                      )
                                    ]);
                                  else
                                    return Column(
                                      children: [
                                        Container(
                                          width:
                                          200.0, // Set the desired width
                                          height:
                                          200.0, // Set the desired height
                                          decoration: BoxDecoration(
                                             shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  'images/dms.jpg'),
                                              fit: BoxFit.cover,
                                              alignment: Alignment(0, 0.8),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.all(8.0),
                                          child: Text(
                                              textAlign: TextAlign.justify,
                                              style: GoogleFonts.jost(
                                                  textStyle: TextStyle(
                                                      fontWeight:
                                                      FontWeight.w500,fontSize: contentSize)),
                                              '''      ❝As a dedicated and ambitious pre-final year college student, I am deeply committed to the world of software development, always seeking opportunities to learn, grow, and create. With an impressive track record of developing a wide array of applications and serving as a proficient freelancer, I possess a unique blend of technical expertise and a relentless passion for innovation. I consider myself a steward of technology, driven by the belief that code has the potential to shape our future. Join me on this journey through the dynamic realm of software development, where we turn ideas into solutions, and where the pursuit of excellence is non-negotiable❞ '''          ),
                                        ),
                                        SizedBox(height: 10,),
                                        Text("Why This App?",  style: GoogleFonts.yesevaOne(
                                            textStyle: TextStyle(
                                                fontWeight:
                                                FontWeight.bold,fontSize: headingSize)),),
                                        Container(
                                          width:
                                          200.0, // Set the desired width
                                          height:
                                          200.0, // Set the desired height
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  'images/cuteKitty.png'),
                                              fit: BoxFit.cover,
                                              alignment: Alignment(0, 0.8),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.all(8.0),
                                          child: Text(
                                              textAlign: TextAlign.justify,
                                              style: GoogleFonts.jost(
                                                  textStyle: TextStyle(
                                                      fontWeight:
                                                      FontWeight.w500,fontSize: contentSize)),
                                              '''      ❝Explore the Interview Management App, a game-changer in candidate recruitment. Simplify your candidate tracking, effortlessly access resumes, and filter applicants by skills. Our user-friendly interface transforms the recruitment journey. Gain insights from past candidates, schedule interviews, and make data-driven decisions. Experience mobile convenience, robust data security, and seamless team collaboration. Unleash your competitive edge with modern recruitment technology❞ '''          ),
                                        ),



                                      ],
                                    );
                                })
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ],),
            Container(
              color: Colors.white,
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                    color: containerBg,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(100))),
                child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      //  Text("helloo")
                        NavBar(),
                      ],
                    )),
              ),
            )
          ],
        ));
  }
}
