import 'dart:async';
import 'package:untitled/routingPage.dart';

import 'headingRejected.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled/shimmer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:searchfield/searchfield.dart';
import 'package:untitled/multiSelectDialogBox.dart';
import 'FullDetailedPage.dart';
import 'constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/widgets.dart';

GlobalKey<_FutureBuilderCreatedState> checkKey = GlobalKey<_FutureBuilderCreatedState>();


final _firestore = FirebaseFirestore.instance;
int current_applicant = 0;

var querySnapshot;

List<Map<String, dynamic>> app_rollno=[];

class Rejection extends StatefulWidget {

  const Rejection({Key? key}) : super(key: key);
  @override


  State<Rejection> createState() => _RejectionState();
}

class _RejectionState extends State<Rejection> {

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> init()async{
    print("Running and calling firebase from init");
    querySnapshot = await FirebaseFirestore.instance
        .collection('applicants')
        .get();
setState(() {
  Screen_option;
});
    print("querysnapshot $querySnapshot");
    return querySnapshot;
  }

  void _showMultiSelect() async {
    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(kSelectedItems: filter);
      },
    );
    if (results != null) {

      setState(() {
        Screen_option;
        print("Filter $filter");
        filter;
      });
    }
  }
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }
  Widget build(BuildContext context) {
    setter(){
      setState(() {
        current_applicant;
      });
      print("called");
    }
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFF202123),
      body: Row(
        children: [
          MediaQuery.of(context).size.width > 576
              ? Row(
                  children: [
                    Container(
                      width: w/2 ,
                      child: Column(
                        children: [
                         HeadingRejected(onPressedH1: (){setState(() {
                           Screen_option=0;

                           });} ,onPressedH2: (){setState(() {
                           Screen_option=1;

                         });},onPressedH3: (){setState(() {
                           Screen_option=2;

                         });} ,),
                          Row(mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextButton(onPressed: _showMultiSelect, child: Text("Apply filters",style: TextStyle(color: Colors.blueAccent),)),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom:8.0),
                            child: Wrap(
                              alignment: WrapAlignment.start,
                              children: filter
                                  .map((e) => Chip(
                                  backgroundColor: Colors.white.withOpacity(0.0),
                                  deleteIcon: Icon(Icons.cancel),
                                  onDeleted: () {
                                    setState(() {
                                      Screen_option;
                                      filter.remove(e);
                                    });
                                  },
                                  label: Text(e)))
                                  .toList(),
                            ),
                          ),
                          SingleChildScrollView(
                            child: Container(
                              width: w/ 2,
                              height: (filter.isNotEmpty)?MediaQuery.of(context).size.height * 0.74:MediaQuery.of(context).size.height * 0.84,
                             child: FutureBuilderCreated(onTapCreated: (){setState(() {
                               current_applicant;
                               kFull_appRollno;
                            });},fn: setter,)),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: w/2,
                      child: Column(
                        children: [
                          (app_rollno.isNotEmpty)
                              ? FullDetailPage(
                                  fullDetailVar:
                                      app_rollno[current_applicant])
                              : Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                            height: MediaQuery.of(context).size.height-20,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1
                                )
                            ),
                            child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Click on candidate to view details',style: TextStyle(color: Colors.white,fontSize: 14),
                                    ),
                                  ],
                                ),
                            ),
                          ),
                              )
                        ],
                      ),
                    )
                  ],
                )
              : Column(
                  children: [
                    HeadingRejected(onPressedH1: (){setState(() {
                      Screen_option=0;
                    });} ,onPressedH2: (){setState(() {
                      Screen_option=1;
                    });},onPressedH3: (){setState(() {
                      Screen_option=2;
                    });} ,),
                    Row(mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton(onPressed: _showMultiSelect, child: Text("Apply filters",style: TextStyle(color: Colors.blueAccent),)),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom:8.0),
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        children: filter
                            .map((e) => Chip(
                            backgroundColor: Colors.white.withOpacity(0.0),
                            deleteIcon: Icon(Icons.cancel),
                            onDeleted: () {
                              setState(() {
                                Screen_option;
                                filter.remove(e);
                              });
                            },
                            label: Text(e)))
                            .toList(),
                      ),
                    ),


                    SingleChildScrollView(
                      child: Container(
                        width: w,
                        height: (filter.isNotEmpty)?MediaQuery.of(context).size.height * 0.74:MediaQuery.of(context).size.height * 0.84,
                        child: FutureBuilderCreated()),
                    )
                  ],
                )
        ],
      ),
    );
  }
}
class FutureBuilderCreated extends StatefulWidget {

  void Function()? onTapCreated;
  void Function()? fn;
  FutureBuilderCreated({this.onTapCreated,this.fn});

  @override
  State<FutureBuilderCreated> createState() => _FutureBuilderCreatedState();
}

class _FutureBuilderCreatedState extends State<FutureBuilderCreated> {

  @override
  Future<List<Map<String, dynamic>>> getApplicants(int currentPgVar) async {
    try {
      print("Trying");
      kFull_appRollno = querySnapshot!.docs
          .where((doc) =>
      doc.get('applic_detail')['status'] == currentPgVar &&
          (doc.get('applic_detail')['skills'] != null) &&
          filter
              .every((skill) => List<String>.from(doc.get('applic_detail')['skills']).contains(skill)))
          .map<Map<String, dynamic>>((doc) =>
      doc.get('applic_detail') as Map<String, dynamic>)
          .toList();
        return kFull_appRollno;
    } catch (error) {
      print('Error retrieving applicants: $error');
      return []; // Return an empty list as a fallback in case of an error
    }
  }

  Widget build(BuildContext context) {

    print("Screenpoption : ${Screen_option}");
    return FutureBuilder<List<Map<String, dynamic>>>(
        future: getApplicants(Screen_option),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
              kFull_appRollno = snapshot.data!;
            return ListView.builder(
              itemCount: kFull_appRollno.length,
              itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.only(left:10.0,right: 10,bottom: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      color:  (app_rollno.isNotEmpty && kFull_appRollno[index]['email'] == app_rollno[current_applicant]['email'])
                          ? Color(0xFF444654)
                          : Color(0xFF202123),
                      border: Border.all(color:(app_rollno.isNotEmpty && kFull_appRollno[index]['email'] == app_rollno[current_applicant]['email'])?
                          Color(0xFF202123)
                          : Color(0xFF444654)),borderRadius: BorderRadius.circular(10)
                    ),
                    child: Card(
                      color: (app_rollno.isNotEmpty && kFull_appRollno[index]['email'] == app_rollno[current_applicant]['email'])
                          ? Color(0xFF444654)
                          : Color(0xFF202123),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      margin: EdgeInsets.zero,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            kFull_appRollno[index]['name'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          tileColor: (app_rollno.isNotEmpty && kFull_appRollno[index]['email'] == app_rollno[current_applicant]['email'])
                              ? Color(0xFF444654)
                              : Color(0xFF202123),
                          subtitle: Column(
                            mainAxisAlignment:
                            MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Rollno: ',
                                    style: TextStyle(
                                        fontWeight:
                                        FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                      kFull_appRollno[index]
                                      ['rollno'] ??
                                          ''.toString(),
                                      style: TextStyle(
                                        color: Colors.white,
                                      )),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Experience: ',
                                    style: TextStyle(
                                        fontWeight:
                                        FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                      kFull_appRollno[index]
                                      ['exp']
                                          .toString(),
                                      style: TextStyle(
                                        color: Colors.white,
                                      )),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'College: ',
                                    style: TextStyle(
                                        fontWeight:
                                        FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                      kFull_appRollno[index]
                                      ['college'] ??
                                          '',
                                      style: TextStyle(
                                        color: Colors.white,
                                      )),
                                ],
                              ),
                            ],
                          ),
                          onTap: () {
                            setState(() {
                              current_applicant = index;
                              app_rollno = kFull_appRollno;
                              if (app_rollno.isNotEmpty && MediaQuery.of(context).size.width<576) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context)  { return
                                          Scaffold(
                                            backgroundColor: Colors.black,
                                            body: FullDetailPage(
                                                fullDetailVar:
                                                app_rollno[
                                                current_applicant]),
                                          );}));
                              }
                              else   widget.onTapCreated!();

                            });
                            // Handle tap on the card
                            // You can navigate to a detailed view or perform other actions
                          },
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Shimmer();
          }
        })
    ;
  }
}


