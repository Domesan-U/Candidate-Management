import 'package:flutter/material.dart';
import 'Drawer/DrawerWidget.dart';
import 'HomePage/content.dart';
import 'KittyImage/KittyImageWidget.dart';
import 'NavBar/LeftFollowIcons.dart';
import 'constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    //print("$deviceWidth deviceHeight: $deviceHeight");
    return Scaffold(
      key: scaffoldKey,
      drawer: Container(
        decoration:
            BoxDecoration(border: Border.all(width: 2, color: Colors.white)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: DrawerWidget(
              deviceWidth: deviceWidth, deviceHeight: deviceHeight),
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.zero,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      padding: EdgeInsets.zero,
                      onPressed: null,
                      child: Image.asset(
                        'images/triangle.png',
                        height: 60,
                        width: 40,
                      ),
                    ),
                    const Text(
                      "TechNerds",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        scaffoldKey?.currentState?.openDrawer();
                      },
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                 const FractionalTranslation(
                  translation: Offset(0.27, 0.5),
                  child:  SizedBox(
                    width: 60,
                    child: Divider(
                      thickness: 1,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      (deviceWidth>820)?Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: LeftFollowIcons(deviceWidth: deviceWidth),
                        ),
                      ):Container(),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                        Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: FractionalTranslation(
                              translation:(deviceWidth<820)?const Offset(0.19, 0.0):const Offset(-0.23, 0.0) ,
                              child: KittyImage(
                                  deviceWidth: deviceWidth,
                                  deviceHeight: deviceHeight),
                            )),
                          ],
                        ),
                      )
                    ],
                  ),
          Flexible(
            child: Container(
              height: deviceHeight*0.4,
              child: Align(
                alignment: (deviceWidth<820)?const Alignment(0.15,0):const Alignment(0.05,0),
                child: homePageContent(deviceHeight: deviceHeight,deviceWidth: deviceWidth,),
              ),
            ),
          )


    ],
      ),
    );
  }
}

