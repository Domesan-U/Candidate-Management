import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      drawer: Container(
        decoration: BoxDecoration(
            border: Border.all(
                width: 2,
                color: Colors.white
            )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Drawer(
            elevation: 20,
            child: Card(
              color: Colors.black,
              elevation: 10,
              margin: EdgeInsets.zero,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                border: Border.all(width: 2),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                      blurStyle: BlurStyle.outer,
                                      color: Colors.pink,
                                      blurRadius: 20,
                                      offset: Offset(0, 2)),
                                  BoxShadow(
                                      color: Colors.blue,
                                      blurRadius: 20,
                                      offset: Offset(0, -2)),
                                ],
                                color: Colors.black),
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
                          "TechNerds",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                        title: Text(
                          'Home',
                          style: TextStyle(color: Colors.white, fontSize: 19),
                        ),
                        onTap: () {
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
                            style: TextStyle(color: Colors.white, fontSize: 19),
                          ),
                          onTap: () {
                            // Navigate to the Home page
                            // Add code to navigate to the Home page
                          },
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
                              style: TextStyle(color: Colors.white, fontSize: 19),
                            ),
                            onTap: () {
                              // Navigate to the Home page
                              // Add code to navigate to the Home page
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: ListTile(
                          leading: Icon(
                            Icons.question_mark_outlined,
                            color: Colors.white,
                          ),
                          title: Text(
                            'Creator',
                            style: TextStyle(color: Colors.white, fontSize: 19),
                          ),
                          onTap: () {
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
        ),
      ),
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(12),
                child: (deviceWidth > 576)
                    ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                        onPressed: null,
                        child: Image.asset(
                          'images/triangle.png',
                          height: deviceHeight * 0.1,
                          width: deviceWidth * 0.1,
                        )),
                    Row(
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Home",
                              style: TextStyle(color: Colors.white),
                            )),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "About",
                              style: TextStyle(color: Colors.white),
                            )),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Creator",
                              style: TextStyle(color: Colors.white),
                            )),
                        SizedBox(
                          width: deviceWidth * 0.08,
                        )
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                          _scaffoldKey.currentState?.openDrawer();
                        },
                        icon: Icon(
                          Icons.menu,
                          color: Colors.white,
                        ))

                    // Container(
                    //     padding: EdgeInsets.all(10),
                    //     decoration: BoxDecoration(
                    //       gradient: LinearGradient(
                    //         colors: [Colors.purpleAccent, Colors.green],
                    //         begin: Alignment.centerLeft,
                    //         end: Alignment.centerRight,
                    //       ),
                    //       borderRadius: BorderRadius.circular(8.0),
                    //     ),
                    //     child: const MaterialButton(
                    //       onPressed: null,
                    //       child: Text(
                    //         "Actions",
                    //         style: TextStyle(color: Colors.white),
                    //       ),
                    //       color: Colors.purpleAccent,
                    //     )),
                  ],
                )
                    : Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MaterialButton(
                            onPressed: null,
                            child: Image.asset(
                              'images/triangle.png',
                              height: deviceHeight * 0.1,
                              width: deviceWidth * 0.1,
                            )),
                        Text(
                          "TechNerds \t\t\t\t\t\t  ",
                          style: TextStyle(color: Colors.white),
                        ),
                        IconButton(
                            onPressed: () {
                              _scaffoldKey.currentState?.openDrawer();
                            },
                            icon: Icon(
                              Icons.menu,
                              color: Colors.white,
                            ))
                      ],
                    ),
                    Center(
                      child: SizedBox(
                        width: deviceWidth * 0.4,
                        child: Divider(
                          thickness: 1,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Home",
                              style: TextStyle(color: Colors.white),
                            )),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "About",
                              style: TextStyle(color: Colors.white),
                            )),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Creator",
                              style: TextStyle(color: Colors.white),
                            )),
                      ],
                    ),
                  ],
                )),
            Center(
              child: (deviceWidth > 820)
                  ? Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: deviceWidth * 0.1,
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Row(
                          children: [
                            Text(
                              "Follow Us",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                                child: Text(
                                  "  ",
                                  style: TextStyle(color: Colors.white),
                                )),
                            Image.asset("images/insta_icon.gif",
                                width: deviceWidth * 0.025),
                            SizedBox(
                                child: Text(
                                  "  ",
                                  style: TextStyle(color: Colors.white),
                                )),
                            Image.asset(
                              "images/facebook.gif",
                              width: deviceWidth * 0.025,
                            ),
                            SizedBox(
                                child: Text(
                                  "  ",
                                  style: TextStyle(color: Colors.white),
                                )),
                            Image.asset(
                              "images/gmail.gif",
                              width: deviceWidth * 0.025,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: deviceWidth * 0.6,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        children: [
                          Text(
                            "Candidate DataBase",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: deviceHeight * 0.07,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "Welcome To Console",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: deviceHeight * 0.07,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration:
                      BoxDecoration(borderRadius:BorderRadius.circular(20),color: Colors.black,
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.pink,
                              blurRadius: 20,
                              offset: Offset(0, 2)),
                          BoxShadow(
                              color: Colors.blue,
                              blurRadius: 20,
                              offset: Offset(0, -2)),
                        ],

                      ),
                      child: Image.asset(
                        'images/cuteKitty.png',
                        width: deviceWidth * 0.15,
                        height: deviceHeight * 0.35,
                      ),
                    ),
                  )
                ],
              )
                  : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      decoration:
                      BoxDecoration(borderRadius:BorderRadius.circular(20),color: Colors.black,
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.pink,
                              blurRadius: 20,
                              offset: Offset(0, 2)),
                          BoxShadow(
                              color: Colors.blue,
                              blurRadius: 20,
                              offset: Offset(0, -2)),
                        ],),
                      child: Image.asset(
                        'images/cuteKitty.png',
                        width: deviceWidth * 0.35,
                        height: deviceHeight * 0.35,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Candidate DataBase \n",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: deviceHeight * 0.035,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Welcome To TECHNERDS",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: deviceHeight * 0.04,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
