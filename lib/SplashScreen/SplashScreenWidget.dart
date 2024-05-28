import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/OnTest/TestingHomePage.dart';
import 'package:untitled/constants.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int progress = 0;

  @override
  void initState() {
    super.initState();
    // Simulate a 3-second delay for demonstration
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TestingHome()));
    });

    // Simulate progress from 0% to 100% during the 3 seconds
    for (var i = 0; i <= 100; i++) {
      Future.delayed(Duration(milliseconds: 10 * i), () {
        setState(() {
          if(progress>100) progress=100;
          progress = progress+1;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width:
              200.0, // Set the desired width
              height:
              200.0, // Set the desired height
              decoration: BoxDecoration(
                border: Border.all(
                  color: containerBg,
                  width: 7
                ),
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                      'images/cuteKitty.png'),
                  fit: BoxFit.cover,
                  alignment: Alignment(0, 0),
                ),
              ),
            ),

            SizedBox(height: 16.0),
            Text("${progress}%",style: GoogleFonts.yesevaOne(textStyle: TextStyle(fontWeight: FontWeight.bold),color: Colors.black))
          ],
        ),
      ),
    );
  }
}
