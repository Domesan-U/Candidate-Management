import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/OnTest/HeaderForRejection/OnClicKCandidate/ForMobile.dart';
import 'package:untitled/constants.dart' as k;
import 'package:untitled/rejected.dart';

import '../../FullDetailedPage.dart';
import '../../constants.dart';
import '../../multiSelectDialogBox.dart';
import '../../shimmer.dart';

var querySnapshot;

final _firestore = FirebaseFirestore.instance;
int current_applicant = -1;

List<Map<String, dynamic>> app_rollno = [];

class HeadingOfRejection extends StatefulWidget {
  void Function()? onPressedH1;
  void Function()? onPressedH2;
  void Function()? onPressedH3;
  HeadingOfRejection(
      {required this.onPressedH1,
      required this.onPressedH2,
      required this.onPressedH3});

  @override
  State<HeadingOfRejection> createState() => _HeadingOfRejectionState();
}

class _HeadingOfRejectionState extends State<HeadingOfRejection> {
  Future<List<Map<String, dynamic>>> getApplicants(int currentPgVar) async {
    try {
      print("Trying $currentPgVar skills: $querySnapshot");
      kFull_appRollno = querySnapshot!.docs
          .where((doc) =>
              doc.get('applic_detail')['status'] == currentPgVar &&
              (doc.get('applic_detail')['skills'] != null) &&
              filter.every((skill) =>
                  List<String>.from(doc.get('applic_detail')['skills'])
                      .contains(skill)))
          .map<Map<String, dynamic>>(
              (doc) => doc.get('applic_detail') as Map<String, dynamic>)
          .toList();
      return kFull_appRollno;
    } catch (error) {
      print('Error retrievieegeeng applicants: $error');
      return []; // Return an empty list as a fallback in case of an error
    }
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
        filter;
      });
    }
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> init() async {
    querySnapshot =
        await FirebaseFirestore.instance.collection('applicants').get();
    setState(() {
      Screen_option;
      querySnapshot;
    });
    for (var doc in querySnapshot!.docs) {
      print(doc['applic_detail']['name']);
    }
    print("queryBro ${querySnapshot.docs}");
    return querySnapshot;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    querySnapshot = init();
  }
  Widget build(BuildContext context) {
    setter() {
      setState(() {
        current_applicant;
      });
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Color(0xFF050A30),
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(50))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: containerBg,
                  ),
                  width: 280,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top:45.0),
                        child: Text(
                          "S T O R E  H O U S E",
                          style: GoogleFonts.yesevaOne(
                              textStyle:
                                  TextStyle(fontSize: 23, color: Colors.white)),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: (k.Screen_option != 0)
                                  ? containerBg
                                  : selectedColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 20),
                              child: TextButton(
                                child: const Text(
                                  "Selected",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  widget.onPressedH1!();
                                  setState(() {
                                    k.Screen_option = 0;
                                    current_applicant = -1;
                                    print(k.Screen_option);
                                  });
                                },
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: (k.Screen_option != 1)
                                  ? containerBg
                                  : selectedColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 20),
                              child: TextButton(
                                  child: Text("Rejected",
                                      style: TextStyle(color: Colors.white)),
                                  onPressed: () {
                                    widget.onPressedH2!();
                                    setState(() {
                                      current_applicant = -1;
                                      k.Screen_option = 1;
                                    });
                                  }),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: (k.Screen_option != 2)
                                  ? containerBg
                                  : selectedColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 20),
                              child: TextButton(
                                  child: Text("Pending",
                                      style: TextStyle(color: Colors.white)),
                                  onPressed: () {
                                    widget.onPressedH1!();
                                    setState(() {
                                      current_applicant = -1;
                                      k.Screen_option = 2;
                                    });
                                  }),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            color: containerBg,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(100))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(width: 15),
                  Expanded(
                    child: SingleChildScrollView(
                      reverse: true,
                      scrollDirection: Axis.horizontal,
                      child: Wrap(
                        alignment: WrapAlignment.end,
                        children: filter
                            .map((e) => Container(
                          height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          color: containerBg, width: 1)),
                                  child: Chip(
                                      backgroundColor: Colors.white,
                                      deleteIcon: Icon(Icons.cancel),
                                      onDeleted: (){
                                        setState(() {
                                          Screen_option;
                                          filter.remove(e);
                                        });
                                      },
                                      label: Text(e,style: GoogleFonts.jost(textStyle: TextStyle(fontSize: 12)),)),
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Text("Filter",
                        style: GoogleFonts.jost(
                            textStyle: TextStyle(fontSize: 20))),
                  ),
                  MaterialButton(
                    child: Image.asset(
                      'images/filterIcon.png',
                      width: 20,
                      height: 20,
                    ),
                    onPressed: _showMultiSelect,
                  )
                ],
              ),
            ),
          ),
          (MediaQuery.of(context).size.width < 800)
              ? Padding(
                padding: const EdgeInsets.all(5.0),
                child: SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 1.37,
                      child: FutureBuilderCreated(),
                    ),
                  ),
              )
              : Row(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.height / 1.35,
                          child: FutureBuilderCreated(
                            onTapCreated: () {
                              setState(() {
                                current_applicant;
                                kFull_appRollno;
                                app_rollno;
                                print("this is set State $app_rollno");
                              });
                            },
                            fn: setter,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: MediaQuery.of(context).size.height / 1.35,
                        child: (app_rollno.isNotEmpty && current_applicant != -1)
                            ? FullDetailPage(
                                fullDetailVar: app_rollno[current_applicant])
                            : Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height/1.3,
                                    width: MediaQuery.of(context).size.width/2,

                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: containerBg
                                        )),
                                  child: Center(child: Text("CLick here")),
                              ),
                                )),
                      ),
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
  FutureBuilderCreated({this.onTapCreated, this.fn});
  @override
  State<FutureBuilderCreated> createState() => _FutureBuilderCreatedState();
}
class _FutureBuilderCreatedState extends State<FutureBuilderCreated> {
  @override
  Future<List<Map<String, dynamic>>> getApplicants(int currentPgVar) async {
    try {
      print("Trying $currentPgVar skills: $querySnapshot");
      kFull_appRollno = querySnapshot!.docs
          .where((doc) =>
              doc.get('applic_detail')['status'] == currentPgVar &&
              (doc.get('applic_detail')['skills'] != null) &&
              filter.every((skill) =>
                  List<String>.from(doc.get('applic_detail')['skills'])
                      .contains(skill)))
          .map<Map<String, dynamic>>(
              (doc) => doc.get('applic_detail') as Map<String, dynamic>)
          .toList();
      return kFull_appRollno;
    } catch (error) {
      print('Error retrievieegeeng applicants: $error');
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
            return (kFull_appRollno.length>0)?ListView.builder(
              itemCount: kFull_appRollno.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, right: 10, bottom: 5),
                  child: Container(
                    decoration: BoxDecoration(
                        color: current_applicant == index
                            ? selectedColor
                            : Colors.white,
                        border: Border.all(color: containerBg),
                        borderRadius: BorderRadius.circular(10)),
                    child: Card(
                      color: current_applicant == index
                          ? selectedColor
                          : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      margin: EdgeInsets.zero,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            kFull_appRollno[index]['name']
                                .toString()
                                .toUpperCase(),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.yesevaOne(
                                textStyle: TextStyle(
                              color: (index == current_applicant)
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                            )),
                          ),
                          subtitle: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text('Rollno: ',
                                      style: GoogleFonts.yesevaOne(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  (index == current_applicant)
                                                      ? Colors.white
                                                      : Colors.black))),
                                  Text(
                                      kFull_appRollno[index]['rollno'] ??
                                          ''.toString(),
                                      style: GoogleFonts.yesevaOne(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  (index == current_applicant)
                                                      ? Colors.white
                                                      : Colors.black))),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Experience: ',
                                    style: GoogleFonts.jost(
                                        textStyle: TextStyle(
                                      color: (index == current_applicant)
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: FontWeight.bold,
                                    )),
                                  ),
                                  Text(kFull_appRollno[index]['exp'].toString(),
                                      style: GoogleFonts.jost(
                                          textStyle: TextStyle(
                                        color: (index == current_applicant)
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ))),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'College: ',
                                    style: GoogleFonts.jost(
                                        textStyle: TextStyle(
                                      color: (index == current_applicant)
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: FontWeight.bold,
                                    )),
                                  ),
                                  Text(kFull_appRollno[index]['college'] ?? '',
                                      style: GoogleFonts.jost(
                                          color: (index == current_applicant)
                                              ? Colors.white
                                              : Colors.black,
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ))),
                                ],
                              ),
                            ],
                          ),
                          onTap: () {
                            setState(() {
                              current_applicant = index;
                              app_rollno = kFull_appRollno;
                              if (app_rollno.isNotEmpty &&
                                  MediaQuery.of(context).size.width < 800) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ForMobileClick(
                                            app_rollno[current_applicant])));
                              } else {
                                print("Else exeucuted $app_rollno");
                                widget.onTapCreated!();
                              }
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
            ):Container(
              child: Center(
                child: Text(
                  "No Data Found",
                  style: GoogleFonts.jost(
                    fontSize: 20
                  ),
                ),
              ),
            );
          } else {
            return Shimmer();
          }
        });
  }
}
