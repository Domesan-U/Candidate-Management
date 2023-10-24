import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled/UpcomingApplicant.dart' as mf;
final List<String> kSelectedItems = [];
bool afterUpdateCaller = true;
bool knew_disable = true;

List<Map<String, dynamic>>  kFull_rollnoCopy =[];
List<Map<String, dynamic>> kFull_appRollno = [];
TextEditingController knew_ageController = TextEditingController();
TextEditingController knew_interviewController = TextEditingController();
List<String> items = [
  'C',
  'C++',
  'Java',
  'Python',
  'JavaScript',
  'Ruby',
  'Swift',
  'Go',
  'Rust',
  'Networks',
  'Database',
  'DataScience',
  'AI',
  'Intelligent Process Automation',
  'Infrastructure Services',
  'Performance Engineering',
  'Product Engineering',
  'Testing',
  'Cyber Security',
  'Cloud'
];
bool validateEmail(String email) {
  RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
  return emailRegex.hasMatch(email);
}
bool validatePhoneNumber(String phoneNumber) {
  RegExp phoneRegex = RegExp(r'^\d{10}$');
  return phoneRegex.hasMatch(phoneNumber);
}
Future<bool> isUserPresentAlready(email)  async {
  bool boolean;
  print("Entered............");
  try {
    var documentRef = FirebaseFirestore.instance.collection('applicants').doc(
        email);
    var snapshot = await documentRef.get();
    // var documentRef = FirebaseFirestore.instance
    //     .collection('applicants')
    //     .doc(email);
    // await documentRef
    //     .get()
    //     .then((DocumentSnapshot snapshot) {
    if (snapshot.exists) {
      print("User Prsent");
      return true;
      // The document with the given documentId exists in Firestore
    } else {
      return false;
    }
  }
  catch (Exception) {
    print("Error in isUserPresentAleready: $Exception");
    return false;
    }

}
final List<String> filter = [];var knew_statusRadiobox=-1;
var knew_ageDiff =0;
int interviewDatePassedStatus = 0;
var knew_name ="";
final knew_formkey = GlobalKey<FormState>();
final knew_namekey = GlobalKey<FormState>();
final knew_rollkey = GlobalKey<FormState>();
final knew_dobkey = GlobalKey<FormState>();
final knew_interviewDateKey = GlobalKey<FormState>();

final knew_passedoutkey = GlobalKey<FormState>();
DateTime? knew_dob;
final knew_yofexpKey = GlobalKey<FormState>();
bool knew_isChecked = false;
var knew_yoexp = "";
var knew_interviewDate;
var knew_rollno ="";
var knew_passedout=0;
var knew_email ="";
var knew_degree="";
var knew_pos ="";
var knew_ph ="";
var knew_collegename="";
var knew_fileError;
List<Widget> skillWidgets = [];
int Screen_option = 0;
String selectedExperience = experience[0];
String selectedDegree = degrees[0];

List<String> experience = [
  'Select Your Experience',
  'No Prior Experience',
  'Less than 5 years',
  'More than 5 years',
  'More than 10 years',
];

List<String> degrees = [
  'Select Degree',
  'BE CSE/IT/ECE',
  'BE MECH',
  'BCA CS',
  'BSc',
  'others',
];
