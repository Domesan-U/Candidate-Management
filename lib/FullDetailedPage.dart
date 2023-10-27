import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:untitled/OnTest/HeaderForRejection/RejectionHeader.dart';
import 'package:untitled/OnTest/TestingHomePage.dart';
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
  Color innerTableValueColour = Colors.black;
   double innerTableRowSpace = 20;
   double mobileFont=15 ;
   double  webFont=20;
  @override
  Widget build(BuildContext context) {
    print("broooo i am inside Fulldetailed ${widget.fullDetailVar}");
    bool hideApply = false;
    var w = MediaQuery.of(context).size.width;
    if (w > 800) w = w / 2;

    return (kFull_appRollno.length > 0)
        ? Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: MediaQuery.of(context).size.height/1.3,

            decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: containerBg
          )
      ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: ListView(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height/1.5,
                      width: w,
                      alignment: Alignment.centerRight,
                      child: Center(
                        child: Container(
                          width: (MediaQuery.of(context).size.width<800)?w:w/1.5,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Table(
                              children: [
                                TableRow(
                                  children: [
                                    TableCell(
                                      child: Text(
                                        "Name: ",
                                        style: GoogleFonts.yesevaOne(fontSize: MediaQuery.of(context).size.width<600?mobileFont:webFont,color:innerTableValueColour ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Text(
                                        widget.fullDetailVar!['name'].toString() ?? "",
                                        style: GoogleFonts.jost(fontSize: MediaQuery.of(context).size.width<600?mobileFont:webFont,color:innerTableValueColour),
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    TableCell(
                                      child: SizedBox(height: innerTableRowSpace,)
                                    ),
                                    TableCell(
                                      child:SizedBox(height: innerTableRowSpace,)
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    TableCell(
                                      child: Text(
                                        "Email",
                                        style: GoogleFonts.yesevaOne(fontSize: MediaQuery.of(context).size.width<600?mobileFont:webFont,color:innerTableValueColour),
                                      ),
                                    ),
                                    TableCell(
                                      child: Text(
                                        widget.fullDetailVar!['email'].toString() ?? "",
                                        style: GoogleFonts.jost(fontSize: MediaQuery.of(context).size.width<600?mobileFont:webFont,color:innerTableValueColour),
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    TableCell(
                                        child: SizedBox(height: innerTableRowSpace,)
                                    ),
                                    TableCell(
                                        child:SizedBox(height: innerTableRowSpace,)
                                    ),
                                  ],
                                ),

                                TableRow(
                                  children: [
                                    TableCell(
                                      child: Text(
                                        "Degree",
                                        style: GoogleFonts.yesevaOne(fontSize: MediaQuery.of(context).size.width<600?mobileFont:webFont,color:innerTableValueColour),
                                      ),
                                    ),
                                    TableCell(
                                      child: Text(
                                        widget.fullDetailVar!['degree'].toString() ?? "",
                                        style: GoogleFonts.jost(fontSize: MediaQuery.of(context).size.width<600?mobileFont:webFont,color:innerTableValueColour),
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    TableCell(
                                        child: SizedBox(height: innerTableRowSpace,)
                                    ),
                                    TableCell(
                                        child:SizedBox(height: innerTableRowSpace,)
                                    ),
                                  ],
                                ),

                                TableRow(
                                  children: [
                                    TableCell(
                                      child: Text(
                                        "Experience",
                                        style: GoogleFonts.yesevaOne(fontSize: MediaQuery.of(context).size.width<600?mobileFont:webFont,color:innerTableValueColour),
                                      ),
                                    ),
                                    TableCell(
                                      child: Text(
                                        widget.fullDetailVar!['exp'].toString() ?? "",
                                        style: GoogleFonts.jost(fontSize: MediaQuery.of(context).size.width<600?mobileFont:webFont,color:innerTableValueColour),
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    TableCell(
                                        child: SizedBox(height: innerTableRowSpace,)
                                    ),
                                    TableCell(
                                        child:SizedBox(height: innerTableRowSpace,)
                                    ),
                                  ],
                                ),

                                TableRow(
                                  children: [
                                    TableCell(
                                      child: Text(
                                        "Position Applied For",
                                        style: GoogleFonts.yesevaOne(fontSize: MediaQuery.of(context).size.width<600?mobileFont:webFont,color:innerTableValueColour),
                                      ),
                                    ),
                                    TableCell(
                                      child: Text(
                                        widget.fullDetailVar!['position'].toString() ?? "",
                                        style: GoogleFonts.jost(fontSize: MediaQuery.of(context).size.width<600?mobileFont:webFont,color:innerTableValueColour),
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    TableCell(
                                        child: SizedBox(height: innerTableRowSpace,)
                                    ),
                                    TableCell(
                                        child:SizedBox(height: innerTableRowSpace,)
                                    ),
                                  ],
                                ),

                                TableRow(
                                  children: [
                                    TableCell(
                                      child: Text(
                                        "PassedOut",
                                        style: GoogleFonts.yesevaOne(fontSize: MediaQuery.of(context).size.width<600?mobileFont:webFont,color:innerTableValueColour),
                                      ),
                                    ),
                                    TableCell(
                                      child: Text(
                                        widget.fullDetailVar!['passedOut'].toString() ?? "",
                                        style: GoogleFonts.jost(fontSize: MediaQuery.of(context).size.width<600?mobileFont:webFont,color:innerTableValueColour),
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    TableCell(
                                        child: SizedBox(height: innerTableRowSpace,)
                                    ),
                                    TableCell(
                                        child:SizedBox(height: innerTableRowSpace,)
                                    ),
                                  ],
                                ),

                                TableRow(
                                  children: [
                                    TableCell(
                                      child: Text(
                                        "Phone",
                                        style: GoogleFonts.yesevaOne(fontSize: MediaQuery.of(context).size.width<600?mobileFont:webFont,color:innerTableValueColour),
                                      ),
                                    ),
                                    TableCell(
                                      child: Text(
                                        widget.fullDetailVar!['phone'].toString() ?? "",
                                        style: GoogleFonts.jost(fontSize: MediaQuery.of(context).size.width<600?mobileFont:webFont,color:innerTableValueColour),
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    TableCell(
                                        child: SizedBox(height: innerTableRowSpace,)
                                    ),
                                    TableCell(
                                        child:SizedBox(height: innerTableRowSpace,)
                                    ),
                                  ],
                                ),

                                TableRow(
                                  children: [
                                    TableCell(
                                      child: Text(
                                        "Skills",
                                        style: GoogleFonts.yesevaOne(fontSize: MediaQuery.of(context).size.width<600?mobileFont:webFont,color:innerTableValueColour),
                                      ),
                                    ),
                                    TableCell(
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: List.generate(
                                            widget.fullDetailVar!['skills'].length,
                                                (index) {
                                              return Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(
                                                  widget.fullDetailVar!['skills'][index],
                                                  style: GoogleFonts.jost(textStyle: TextStyle(fontSize: MediaQuery.of(context).size.width<600?mobileFont:webFont,color:innerTableValueColour)),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    TableCell(
                                        child: SizedBox(height: innerTableRowSpace,)
                                    ),
                                    TableCell(
                                        child:SizedBox(height: innerTableRowSpace,)
                                    ),
                                  ],
                                ),

                                (widget.fullDetailVar!['status'] == 2)
                                    ? TableRow(
                                  children: [
                                    TableCell(
                                      child: Text(
                                        "InterView Date",
                                        style: GoogleFonts.yesevaOne(fontSize: MediaQuery.of(context).size.width<600?mobileFont:webFont,color:innerTableValueColour),
                                      ),
                                    ),
                                    TableCell(
                                      child: Tooltip(
                                        message: (widget.fullDetailVar!['status'] == 2 &&
                                            widget.fullDetailVar!['interviewDate']
                                                .toDate()
                                                .isBefore(DateTime.now()))?"Interview Date is Passed":"Interview Date",
                                        child: Text(
                                          DateFormat('yyyy-MM-dd').format(
                                              widget.fullDetailVar!['interviewDate'].toDate()),
                                          style: GoogleFonts.jost(
                                              color: (widget.fullDetailVar!['status'] == 2 &&
                                                  widget.fullDetailVar!['interviewDate']
                                                      .toDate()
                                                      .isBefore(DateTime.now()))?Colors.red:innerTableValueColour,
                                              fontSize: MediaQuery.of(context).size.width<600?mobileFont:webFont),
                                        ),
                                      ),
                                    ),

                                  ],
                                )
                                    : TableRow(
                                  children:[
                                  TableCell(
                                    child: Container(),
                                  ),
                                    TableCell(
                                      child: Container(),
                                    )
                ]
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
       (widget.fullDetailVar!['status'] == 2 &&
                            widget.fullDetailVar!['interviewDate']
                                .toDate()
                                .isBefore(DateTime.now()))
                        ? Column(
                            children: [

                              Row(
                                  children: [

                                Flexible(
                                  child: SizedBox(
                                    height: 50,
                                    width: 150,
                                    child: RadioListTile(
                                      value: 0,
                                      groupValue: interviewDatePassedStatus,
                                      title: Text(
                                        'Select',
                                        style: GoogleFonts.jost(
                                            textStyle: TextStyle(
                                                fontSize: MediaQuery.of(context).size.width<600?mobileFont:webFont,
                                                fontWeight: FontWeight.w400)),
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          interviewDatePassedStatus = value as int;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: SizedBox(
                                    width: 150,
                                    height: 50,
                                    child: RadioListTile(
                                      value: 1,
                                      groupValue: interviewDatePassedStatus,
                                      title: Text('Reject',
                                          style: GoogleFonts.jost(
                                              textStyle: TextStyle(
                                                  fontSize: MediaQuery.of(context).size.width<600?mobileFont:webFont,
                                                  fontWeight: FontWeight.w400))),
                                      onChanged: (value) {
                                        setState(() {
                                          interviewDatePassedStatus = value as int;
                                        });
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>TestingHome()));
                                      },
                                    ),
                                  ),
                                ),
                              ])
                            ],
                          )
                        : Container(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Flexible(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: containerBg,
                                  borderRadius: BorderRadius.circular(20)),
                              child: TextButton(
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Text("Dowload Resume",style: GoogleFonts.jost(
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300))),
                                ),
                                onPressed: () async {
                                  final Uri url = Uri.parse(widget.fullDetailVar!['url']);
                                  await launchUrl(url);
                                },
                              ),
                            ),
                          ),
                          SizedBox(width:10),
                          (widget.fullDetailVar!['status']==2)?  Flexible(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: containerBg,
                                  borderRadius: BorderRadius.circular(20)),
                              child: TextButton(
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Text("Apply Changes",style: GoogleFonts.jost(
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300))),
                                ),
                                onPressed: () {
                                  FirebaseFirestore.instance
                                      .collection("applicants")
                                      .doc(widget.fullDetailVar!['email'])
                                      .set({
                                    'applic_detail': {'status': interviewDatePassedStatus}
                                  }, SetOptions(merge: true)).whenComplete(
                                          () => setState(() {
                                                hideApply = true;
                                              }));
                                },
                              ),
                            ),
                          ):Container()
                        ],
                      ),
                    )
                  ],
                ),
            ),
          ),
        )
        : Container(
            child: Center(
              child: Text("click"),
            ),
          );
  }
}

// Padding(
// padding: const EdgeInsets.all(10),
// child: Container(
// decoration:  BoxDecoration(
// border: Border.all(
// color: Colors.white,
// width: 2.0,
// ),
// borderRadius: BorderRadius.circular(25.0),
// ),
// height: MediaQuery.of(context).size.height-20,
// width: MediaQuery.of(context).size.width -2/ 2,
// child: (kFull_appRollno.length > 0)
// ? Padding(
// padding: EdgeInsets.only(top:10.0,bottom: 10,left:30,right: 30),
// child: ListView(children: [
// Padding(
// padding: const EdgeInsets.all(20),
// child: Center(
// child: Text(
// widget.fullDetailVar!['name'].toString() ?? "",
// style: TextStyle(
// color: Colors.white,
// fontWeight: FontWeight.bold,
// fontSize: 25),
// ),
// ),
// ),
// Padding(
// padding: const EdgeInsets.only(left:15.0),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Padding(
// padding: const EdgeInsets.only(bottom: 25.0),
// child: Row(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// "Name: ",
// style: TextStyle(
// fontSize: 18,
// fontWeight: FontWeight.bold,
// color: Colors.white,
// ),
// ),
// Expanded(
// child: Wrap(
// crossAxisAlignment: WrapCrossAlignment.start,
// children: [
// Text(
// widget.fullDetailVar!['name'].toString(),
// style: TextStyle(
// fontSize: 20,
// fontWeight: FontWeight.w500,
// color: Colors.white,
// ),
// ),
// ],
// ),
// ),
// ],
// ),
// ),
// Padding(
// padding: const EdgeInsets.only(bottom: 25.0),
// child: Row(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// "Email: ",
// style: TextStyle(
// fontSize: 18,
// fontWeight: FontWeight.bold,
// color: Colors.white,
// ),
// ),
// Expanded(
// child: Wrap(
// crossAxisAlignment: WrapCrossAlignment.start,
// children: [
// Text(
// widget.fullDetailVar!['email'].toString(),
// style: TextStyle(
// fontSize: 20,
// fontWeight: FontWeight.w500,
// color: Colors.white,
// ),
// ),
// ],
// ),
// ),
// ],
// ),
// ),
// Padding(
// padding: const EdgeInsets.only(bottom: 25.0),
// child: Row(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// "College: ",
// style: TextStyle(
// fontSize: 18,
// fontWeight: FontWeight.bold,
// color: Colors.white,
// ),
// ),
// Expanded(
// child: Wrap(
// crossAxisAlignment: WrapCrossAlignment.start,
// children: [
// Text(
// widget.fullDetailVar!['college'].toString(),
// style: TextStyle(
// fontSize: 20,
// fontWeight: FontWeight.w500,
// color: Colors.white,
// ),
// ),
// ],
// ),
// ),
// ],
// ),
// ),
// Padding(
// padding: const EdgeInsets.only(bottom: 25.0),
// child: Row(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// "Degree: ",
// style: TextStyle(
// fontSize: 18,
// fontWeight: FontWeight.bold,
// color: Colors.white,
// ),
// ),
// Expanded(
// child: Wrap(
// crossAxisAlignment: WrapCrossAlignment.start,
// children: [
// Text(
// widget.fullDetailVar!['degree'].toString(),
// style: TextStyle(
// fontSize: 20,
// fontWeight: FontWeight.w500,
// color: Colors.white,
// ),
// ),
// ],
// ),
// ),
// ],
// ),
// ),
// Padding(
// padding: const EdgeInsets.only(bottom: 25.0),
// child: Row(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// "Phone: ",
// style: TextStyle(
// fontSize: 18,
// fontWeight: FontWeight.bold,
// color: Colors.white,
// ),
// ),
// Expanded(
// child: Wrap(
// crossAxisAlignment: WrapCrossAlignment.start,
// children: [
// Text(
// widget.fullDetailVar!['phone'].toString(),
// style: TextStyle(
// fontSize: 20,
// fontWeight: FontWeight.w500,
// color: Colors.white,
// ),
// ),
// ],
// ),
// ),
// ],
// ),
// ),
// Padding(
// padding: const EdgeInsets.only(bottom: 25.0),
// child: Row(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// "Age: ",
// style: TextStyle(
// fontSize: 18,
// fontWeight: FontWeight.bold,
// color: Colors.white,
// ),
// ),
// Expanded(
// child: Wrap(
// crossAxisAlignment: WrapCrossAlignment.start,
// children: [
// Text(
// widget.fullDetailVar!['age'].toString(),
// style: TextStyle(
// fontSize: 20,
// fontWeight: FontWeight.w500,
// color: Colors.white,
// ),
// ),
// ],
// ),
// ),
// ],
// ),
// ),
// Padding(
// padding: const EdgeInsets.only(bottom:25.0),
// child: Row(mainAxisAlignment:MainAxisAlignment.start,children: [
// Text("Status: ",textAlign: TextAlign.start,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
// Expanded(
// child: Wrap(
// children: [
// Text(widget.fullDetailVar![(knew_statusRadiobox==0)?"Rejected":(knew_statusRadiobox==1)?"Selected":"Pending"].toString() ?? "",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),),
// ],
// ),
// ),
// ],),
// ),
// Row(
// children: [
// Padding(
// padding: const EdgeInsets.only(bottom:25.0),
// child: Text("Skills: ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
// ),
//
// Expanded(
// child: Padding(
// padding: const EdgeInsets.only(bottom:25.0),
// child: Wrap(
// spacing: 8.0, // Horizontal spacing between items
// runSpacing: 8.0, // Vertical spacing between lines
// children: List.generate(
// widget.fullDetailVar!['skills'].length,
// (index) => Container(
// padding: const EdgeInsets.all(8.0),
// child: Text(
// widget.fullDetailVar!['skills'][index].toString(),
// style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,color: Colors.white),
// ),
// ),
// ),
// ),
// ),
// ),],
// ),
//
// (widget.fullDetailVar!['status']==2)?
// Padding(
// padding: const EdgeInsets.only(bottom:25.0),
// child: Row(children: [
// Text("InterviewDate: ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
// Expanded(
// child: Wrap(
// children: [
// Text(DateFormat('yyyy-MM-dd').format(widget.fullDetailVar!['interviewDate'].toDate()),style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),),
// ],
// ),
// ),
// ],),
// ):Container(),
// (widget.fullDetailVar!['status']==2 && widget.fullDetailVar!['interviewDate'].toDate().isBefore(DateTime.now()))?Column(
// children: [
// Padding(
// padding: const EdgeInsets.only(bottom:25.0),
// child: Text("Looks like Interview Date is passed.  Didn't Attend the interview? Make a decision",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
// ),
// ],
// ):Container(),
// (widget.fullDetailVar!['status']==2)?Column(
// children: [
// Row(
// children: [
// Expanded(
// child: RadioListTile(
// value: 0,
// groupValue: interviewDatePassedStatus,
// title: Text('Rejected',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500)),
// onChanged: (value) {
// setState(() {
// interviewDatePassedStatus = value as int;
// });
// },
// ),
// ),
// Expanded(
// child: RadioListTile(
// activeColor: Colors.white,
// value: 1,
// groupValue: interviewDatePassedStatus,
// title: Text('Selected',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500),),
// onChanged: (value) {
// setState(() {
// interviewDatePassedStatus = value as int;
// });
// },
// ),
// ),
//
//
// ],
// )
// ,
// Padding(
// padding: const EdgeInsets.all(15.0),
// child: TextButton(onPressed: (){sendEmail(widget.fullDetailVar!['email']!);},child: Text((interviewDatePassedStatus==1)?"Send selected Email":"Send Rejected Email",style: TextStyle(decoration: TextDecoration.underline,color: Colors.blueAccent,fontSize: 18,),)),
// ),
// ],
// ):Container(),
// Padding(
// padding: const EdgeInsets.only(bottom: 25.0),
// child: Row(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// "Position applied for:  ",
// style: TextStyle(
// fontSize: 18,
// fontWeight: FontWeight.bold,
// color: Colors.white,
// ),
// ),
// Expanded(
// child: Wrap(
// crossAxisAlignment: WrapCrossAlignment.start,
// children: [
// Text(
// widget.fullDetailVar!['position'].toString(),
// style: TextStyle(
// fontSize: 20,
// fontWeight: FontWeight.w500,
// color: Colors.white,
// ),
// ),
// ],
// ),
// ),
// ],
// ),
// ),
// Padding(
// padding: const EdgeInsets.only(bottom:25.0),
// child: Row(children: [
// Text("Passed out Year: ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
// Expanded(
// child: Wrap(
// children: [
// Text(widget.fullDetailVar!['passedOut'].toString()??'',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),),
// ],
// ),
// ),
// ],),
// ),
// Padding(
// padding: const EdgeInsets.all(10.0),
// child: ElevatedButton(onPressed:(!hideApply)?()async {
// final Uri url = Uri.parse(widget.fullDetailVar!['url']);
// await launchUrl(url);
// }:null,
// child: Text("Download Resume")),
// ),
//
// (widget.fullDetailVar!['status']==2)?  Row(
// mainAxisAlignment: MainAxisAlignment.end,
// children: [
// Padding(
// padding: const EdgeInsets.all(10.0),
// child: ElevatedButton(onPressed: (){
// FirebaseFirestore.instance.collection("applicants")
//     .doc(widget.fullDetailVar!['email'])
//     .set({
// 'applic_detail':{
// 'status': interviewDatePassedStatus
// }
// },SetOptions(merge: true)).whenComplete(() => setState((){hideApply=true;}));
//
//
// }, child: Text("Apply Changes")),
// )
// ],
// ):Container()
// ],
// ),
// )
// ]),
// )
// : Shimmer()),
// )
