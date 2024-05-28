import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/About/about.dart';
import 'package:untitled/OnTest/HeaderForRejection/RejectionHeader.dart';
import 'package:untitled/SplashScreen/SplashScreenWidget.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/routingPage.dart';
import 'NavBar/NavBarWidget.dart';
import 'OnTest/TestingHomePage.dart';
import 'homepage.dart';
import 'login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'new applicants.dart';
import 'UpcomingApplicant.dart';
import 'dart:html' as html;
import 'rejected.dart';
void main() async{
  html.document.title = 'HR DATABASE';

  if (!kIsWeb) {
    print("Running in Android..........................");
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      //options: DefaultFirebaseOptions.currentPlatform,
    );
  }
  else if(kIsWeb){
    print("running in web..............");
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: FirebaseOptions(apiKey: "AIzaSyB_89GYRwgeMmdxIhLi8OB-dBWiNPAu9KA", appId: "1:912029516841:web:77e05450142b92db5c8838", messagingSenderId: "912029516841", projectId: "hr-rejection",storageBucket: "hr-rejection.appspot.com")
    );
  }
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent
  ));
  SystemUiOverlayStyle(statusBarColor: Colors.transparent);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {

    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final MaterialColor customSwatch = MaterialColor(
    0xFF002147,
    <int, Color>{
      50: Color(0xFF002147),
      100: Color(0xFF002147),
      200: Color(0xFF002147),
      300: Color(0xFF002147),
      400: Color(0xFF002147),
      500: Color(0xFF002147),
      600: Color(0xFF002147),
      700: Color(0xFF002147),
      800: Color(0xFF002147),
      900: Color(0xFF002147),
    },
  );
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    print("main");
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: customSwatch,
            unselectedWidgetColor: Colors.black,
        radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.all(selectedColor),
      ),
        checkboxTheme: CheckboxThemeData(

          overlayColor: MaterialStateProperty.all(selectedColor)
        )
        // Change the circle color to white
          ),
      debugShowCheckedModeBanner: false,
      home:  SplashScreen(),
     // title: 'Flutter Demo',
      //theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
       // primarySwatch: Colors.blue,
     // ),

    );
  }
}

