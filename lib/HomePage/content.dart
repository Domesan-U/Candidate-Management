import 'package:flutter/material.dart';
class homePageContent extends StatelessWidget {
  const homePageContent({
    super.key,
    required this.deviceHeight,
    required this.deviceWidth
  });

  final double deviceHeight;
  final double deviceWidth;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              "     Candidate Database \n",
              style: TextStyle(
                color: Colors.white,
                fontSize: (deviceWidth<572)?deviceHeight * 0.045: deviceWidth*0.035,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Center(
            child: Text(
              "Welcome To TECHNERDS",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: (deviceWidth<572)?deviceHeight * 0.045: deviceWidth*0.02,
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
        ),
    //     Padding(
    //       padding: const EdgeInsets.all(10.0),
    //       child: Text(
    //         "What You can do here?",
    //         style: TextStyle(
    //           color: Colors.white,
    //           fontSize: (deviceWidth<572)?deviceHeight * 0.035: deviceWidth*0.03,
    //           fontWeight: FontWeight.w200,
    //         ),
    //       ),
    //     ),
    //     Padding(
    //       padding: const EdgeInsets.all(30.0),
    //       child: Center(
    //         child: Text(
    //
    //           "This page is completely To update and View the Candidate database. You can instantaneously check the availability of candidates based on the skill set ",
    //           textAlign: TextAlign.justify,
    // style: TextStyle(
    //             color: Colors.white,
    //             fontSize: (deviceWidth<572)?deviceHeight * 0.030: deviceWidth*0.02,
    //             fontWeight: FontWeight.w200,
    //           ),
    //         ),
    //       ),
    //     )


      ],
    );
  }
}
