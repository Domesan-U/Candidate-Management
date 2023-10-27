import 'package:flutter/material.dart';
import 'package:untitled/homepage.dart';
import 'package:untitled/rejected.dart';

import '../UpcomingApplicant.dart';

class NavBar extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(20)),
      width: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white)),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                icon: Icon(
                  Icons.home_filled,
                  color: Colors.white,
                ),
              )),
          Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white)),
              ),
              child: IconButton(
                splashColor: Colors.grey,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.close_rounded,
                  color: Colors.white,
                ),
              )),
          Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white)),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Rejection()));
                },
                icon: Icon(
                  Icons.storage_outlined,
                  color: Colors.white,
                ),
              )),
          Container(
              decoration: BoxDecoration(
                border: Border(left: BorderSide(color: Colors.white)),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => check()));
                },
                icon: Icon(
                  Icons.add_circle_outline,
                  color: Colors.white,
                ),
              ))
        ],
      ),
    );
  }
}
