import 'package:flutter/material.dart';
import 'package:untitled/About/about.dart';
import 'package:untitled/OnTest/HeaderForRejection/RejectionHeader.dart';
import 'package:untitled/OnTest/TestingHomePage.dart';
import 'package:untitled/homepage.dart';
import 'package:untitled/rejected.dart';

import '../UpcomingApplicant.dart';

class NavBar extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    double iconSize = 20;
    return Container(
        width: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(10)
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TestingHome()));
                },
                icon: Icon(
                  Icons.home_filled,
                  color: Colors.white,
                  size: iconSize
                ),
              )),
          SizedBox(width: 10,),
          Container(
              decoration: BoxDecoration(
                color: Colors.orange,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: IconButton(
                splashColor: Colors.grey,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutPage()));
                },
                icon: Icon(
                  Icons.home_work,
                  color: Colors.white,
                    size: iconSize

                ),
              )),
          SizedBox(width: 10,),

          Container(
              decoration: BoxDecoration(
                color: Colors.purple,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HeadingOfRejection(onPressedH1: (){}, onPressedH2:(){}, onPressedH3: (){})));
                },
                icon: Icon(
                  Icons.storage_outlined,
                  color: Colors.white,
                    size: iconSize

                ),
              )),
          SizedBox(width: 10,),

          Container(
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => check()));
                },
                icon: Icon(
                  Icons.person_add,
                  color: Colors.white,
                    size: iconSize

                ),
              ))
        ],
      ),
    );
  }
}
