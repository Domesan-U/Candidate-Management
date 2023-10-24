import 'package:flutter/material.dart';
import 'package:untitled/routingPage.dart';
import 'login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'new applicants.dart';
import 'UpcomingApplicant.dart';
import 'rejected.dart';
void main() async{
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
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("main");
    return MaterialApp(
      theme: ThemeData(
            unselectedWidgetColor: Colors.black, // Change the circle color to white
          ),
      debugShowCheckedModeBanner: false,
      home: RoutingPage(),
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

