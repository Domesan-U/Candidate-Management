import 'package:flutter/material.dart';
import 'package:untitled/rejected.dart';

import 'UpcomingApplicant.dart';

class RoutingPage extends StatefulWidget {
  const RoutingPage({Key? key}) : super(key: key);

  @override
  State<RoutingPage> createState() => _RoutingPageState();
}

class _RoutingPageState extends State<RoutingPage> {
  @override
  Widget build(BuildContext context) {
    String url = "https://images.pexels.com/photos/7130473/pexels-photo-7130473.jpeg?auto=compress&cs=tinysrgb&w=600";    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
                stops: [0.4,0.7,0.9],
                colors: [Colors.purple.shade400,Colors.purple.shade600,Colors.purple.shade800]
            ),
          ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Material(
                  elevation: 40,
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.lightBlueAccent,
                  child: MaterialButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>check()));
                  }, child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("  Add candidate  ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),),
                  )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Material(
                  elevation: 40,
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.lightBlueAccent,
                  child: MaterialButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Rejection()));
                  }, child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Candidate Database",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white)),
                  )),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
