import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/mailer.dart';
import 'package:untitled/multiSelectDialogBox.dart';
import 'package:untitled/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';


class FullDetailPage extends StatefulWidget {
  Map<String, dynamic>? fullDetailVar;
  FullDetailPage({required this.fullDetailVar});
  @override
  State<FullDetailPage> createState() => _FullDetailPageState();
}

class _FullDetailPageState extends State<FullDetailPage> {
  @override
  Widget build(BuildContext context) {
    bool hideApply = false;

    print("FullDetail page called");

    // void _showMultiSelect() async {
    //   final List<String>? results = await showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return MultiSelect();
    //     },
    //   );
    // }
     var w=MediaQuery.of(context).size.width/2;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration:  BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
          height: MediaQuery.of(context).size.height-20,
          width: MediaQuery.of(context).size.width -2/ 2,
          child: (kFull_appRollno.length > 0)
              ? Padding(
                padding: EdgeInsets.only(top:10.0,bottom: 10,left:30,right: 30),
                child: ListView(children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Center(
                        child: Text(
                          widget.fullDetailVar!['name'].toString() ?? "",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 25.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Name: ",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Expanded(
                                  child: Wrap(
                                    crossAxisAlignment: WrapCrossAlignment.start,
                                    children: [
                                      Text(
                                        widget.fullDetailVar!['name'].toString(),
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 25.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Email: ",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Expanded(
                                  child: Wrap(
                                    crossAxisAlignment: WrapCrossAlignment.start,
                                    children: [
                                      Text(
                                  widget.fullDetailVar!['email'].toString(),
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 25.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "College: ",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Expanded(
                                  child: Wrap(
                                    crossAxisAlignment: WrapCrossAlignment.start,
                                    children: [
                                      Text(
                                        widget.fullDetailVar!['college'].toString(),
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 25.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Degree: ",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Expanded(
                                  child: Wrap(
                                    crossAxisAlignment: WrapCrossAlignment.start,
                                    children: [
                                      Text(
                                        widget.fullDetailVar!['degree'].toString(),
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 25.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Phone: ",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Expanded(
                                  child: Wrap(
                                    crossAxisAlignment: WrapCrossAlignment.start,
                                    children: [
                                      Text(
                                        widget.fullDetailVar!['phone'].toString(),
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 25.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Age: ",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Expanded(
                                  child: Wrap(
                                    crossAxisAlignment: WrapCrossAlignment.start,
                                    children: [
                                      Text(
                                        widget.fullDetailVar!['age'].toString(),
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom:25.0),
                            child: Row(mainAxisAlignment:MainAxisAlignment.start,children: [
                              Text("Status: ",textAlign: TextAlign.start,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                              Expanded(
                                child: Wrap(
                                  children: [
                                    Text(widget.fullDetailVar![(knew_statusRadiobox==0)?"Rejected":(knew_statusRadiobox==1)?"Selected":"Pending"].toString() ?? "",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),),
                                  ],
                                ),
                              ),
                            ],),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom:25.0),
                                child: Text("Skills: ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                              ),

                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom:25.0),
                              child: Wrap(
                                spacing: 8.0, // Horizontal spacing between items
                                runSpacing: 8.0, // Vertical spacing between lines
                                children: List.generate(
                                  widget.fullDetailVar!['skills'].length,
                                      (index) => Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      widget.fullDetailVar!['skills'][index].toString(),
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),         ],
                      ),

                      (widget.fullDetailVar!['status']==2)?
                          Padding(
                            padding: const EdgeInsets.only(bottom:25.0),
                            child: Row(children: [
                              Text("InterviewDate: ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                              Expanded(
                                child: Wrap(
                                  children: [
                                    Text(DateFormat('yyyy-MM-dd').format(widget.fullDetailVar!['interviewDate'].toDate()),style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),),
                                  ],
                                ),
                              ),
                            ],),
                          ):Container(),
                          (widget.fullDetailVar!['status']==2 && widget.fullDetailVar!['interviewDate'].toDate().isBefore(DateTime.now()))?Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom:25.0),
                                child: Text("Looks like Interview Date is passed.  Didn't Attend the interview? Make a decision",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
                              ),
                            ],
                          ):Container(),
                          (widget.fullDetailVar!['status']==2)?Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: RadioListTile(
                                      value: 0,
                                      groupValue: interviewDatePassedStatus,
                                      title: Text('Rejected',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500)),
                                      onChanged: (value) {
                                        setState(() {
                                          interviewDatePassedStatus = value as int;
                                        });
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: RadioListTile(
                                      activeColor: Colors.white,
                                      value: 1,
                                      groupValue: interviewDatePassedStatus,
                                      title: Text('Selected',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500),),
                                      onChanged: (value) {
                                        setState(() {
                                          interviewDatePassedStatus = value as int;
                                        });
                                      },
                                    ),
                                  ),


                                ],
                              )
,
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: TextButton(onPressed: (){sendEmail(widget.fullDetailVar!['email']!);},child: Text((interviewDatePassedStatus==1)?"Send selected Email":"Send Rejected Email",style: TextStyle(decoration: TextDecoration.underline,color: Colors.blueAccent,fontSize: 18,),)),
                              ),
                            ],
                          ):Container(),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 25.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Position applied for:  ",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Expanded(
                                  child: Wrap(
                                    crossAxisAlignment: WrapCrossAlignment.start,
                                    children: [
                                      Text(
                                        widget.fullDetailVar!['position'].toString(),
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom:25.0),
                            child: Row(children: [
                              Text("Passed out Year: ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                              Expanded(
                                child: Wrap(
                                  children: [
                                    Text(widget.fullDetailVar!['passedOut'].toString()??'',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),),
                                  ],
                                ),
                              ),
                            ],),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ElevatedButton(onPressed:(!hideApply)?()async {
                              final Uri url = Uri.parse(widget.fullDetailVar!['url']);
                              await launchUrl(url);
                            }:null,
                                child: Text("Download Resume")),
                          ),

                          (widget.fullDetailVar!['status']==2)?  Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ElevatedButton(onPressed: (){
                                  FirebaseFirestore.instance.collection("applicants")
                                      .doc(widget.fullDetailVar!['email'])
                                      .set({
                                    'applic_detail':{
                                      'status': interviewDatePassedStatus
                                    }
                                  },SetOptions(merge: true)).whenComplete(() => setState((){hideApply=true;}));


                                }, child: Text("Apply Changes")),
                              )
                            ],
                          ):Container()
                        ],
                      ),
                    )
                  ]),
              )
              : Shimmer()),
    );
  }
}
