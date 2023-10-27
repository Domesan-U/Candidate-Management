import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:untitled/Drawer/DrawerWidget.dart';
import 'package:untitled/routingPage.dart';
import 'dart:io';
import 'NavBar/NavBarWidget.dart';
import 'constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/multiSelectDialogBox.dart';
import 'rejected.dart';
import 'TextInput.dart';



final _firestore = FirebaseFirestore.instance;
GlobalKey<ScaffoldState> scaffoldKeyForForm = GlobalKey<ScaffoldState>();
class check extends StatefulWidget {
  const check({Key? key}) : super(key: key);

  @override
  State<check> createState() => _checkState();
}

class _checkState extends State<check> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKeyForForm,
      drawer: DrawerWidget(deviceWidth: 0,deviceHeight: 0,),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: containerBg,
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(50)
                      )
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(

                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text("S T O R E  H O U S E",style: GoogleFonts.yesevaOne(textStyle: TextStyle(fontWeight: FontWeight.bold),color: Colors.white),),
                              ),
                            ),

                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: IconButton(
                            icon: const Icon(Icons.menu,color: Colors.white),
                            onPressed: (){
                              scaffoldKeyForForm.currentState?.openDrawer();
                            },
                          ),
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
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(50)
                        )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MediaQuery.of(context).size.width > 576
                            ? Row(
                                children: [
                                  Column(children: [
                                    Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            right: BorderSide(
                                              color: Colors.white,
                                              width: 4.0,
                                            ),
                                          ),
                                        ),
                                        height: MediaQuery.of(context).size.height,
                                        width: MediaQuery.of(context).size.width / 2,
                                        child: Image.asset('images/cuteKitty.png'
                                            )),
                                  ]),
                                  Column(
                                    children: [
                                      Container(
                                          decoration: BoxDecoration(
                                          ),
                                          height: MediaQuery.of(context).size.height,
                                          width: MediaQuery.of(context).size.width / 2,
                                          child: inputDetails()),
                                    ],
                                  )
                                ],
                              )
                            : Column(
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                      ),
                                      height: MediaQuery.of(context).size.height,
                                      width: MediaQuery.of(context).size.width,
                                      child: inputDetails()),
                                ],
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    //        Align(alignment:Alignment.bottomCenter,child: NavBar())
          ],
        ),
      ),
    );
  }
}

class inputDetails extends StatefulWidget {
  const inputDetails({Key? key}) : super(key: key);

  @override
  State<inputDetails> createState() => _inputDetailsState();
}
Color hintTextColor = Colors.black;
var downloadURL = null;

class _inputDetailsState extends State<inputDetails> {
  PlatformFile? pickedFile;
  double progress = 0.0;
  @override
  Widget build(BuildContext context) {
    void _showMultiSelect() async {
      final List<String>? results = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return MultiSelect(kSelectedItems: kSelectedItems,);
        },
      );
      if (results != null) {
        setState(() {
          kSelectedItems;
        });
      }
    }

    Future selectFile() async {
      final result;
      result = await FilePicker.platform.pickFiles();
      if (result == null) return;
      setState(() {
        pickedFile = result.files.first;
      });
    }

    Future<void> delay() async {
      await Future.delayed(Duration(seconds: 3));
      setState(() {
        knew_fileError = ""; // Add a 2-second delay
      });
      // Code to execute after the delay
      print('Delay complete!');
    }

    UploadTask task;
    Future uploadFile() async {

      print(pickedFile);
      if (pickedFile == null) {
        setState(() {
          knew_fileError = "Select your file properly";
          delay();
        });
      } else if (knew_email == "") {
        setState(() {
          knew_fileError = "Please enter valid email ";
          delay();
        });
      }
      else if (pickedFile != null && knew_email != "") {
        bool boolean = await isUserPresentAlready(knew_email);
        if (boolean) {
          setState(() {
            knew_fileError = "User Already Present";
            delay();
          });
        }
        else {
          final fileBytes = pickedFile?.bytes;
          final fileName = pickedFile?.name;
          print("ffgf $fileName");
          if (kIsWeb) {
            task = FirebaseStorage.instance
                .ref()
                .child('files/$knew_email${fileName?.substring(fileName.indexOf('.'))}')
                .putData(fileBytes!);
          } else {
            final file = File(pickedFile!.path!);
            task = FirebaseStorage.instance
                .ref()
                .child('files/$knew_email${fileName?.substring(fileName.indexOf('.'))}')
                .putFile(file);
          }
          progress = 0.0;
          task.snapshotEvents.listen((TaskSnapshot snapshot) async {
            // Check the task state
            if (snapshot.state == TaskState.running) {
              // Calculate the progress percentage
              //await Future.delayed(Duration(milliseconds: 0));

              // Update the progress variable
              setState(() {
                knew_disable = true;
                progress =
                    (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
              });
            } else if (snapshot.state == TaskState.success) {
              Reference ref =
              FirebaseStorage.instance.ref().child('files/$knew_email${fileName?.substring(fileName.indexOf('.'))}');
              downloadURL = await ref.getDownloadURL();
              setState(() {
                  progress = 0.0;
                  knew_disable = false;
 });
              // File transfer completed
              setState(()  {
                downloadURL;
                progress = 0.0;
                print("Downloaded Url $downloadURL");
                knew_disable = false;
              });
            }
          }, onError: (Object e) {
            // Handle any errors during the file transfer
            print("File transfer failed: $e");
          });
        }
      }
    }

    var w = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Scrollbar(
        scrollbarOrientation: ScrollbarOrientation.right,
        thickness: 5,
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          EdgeInsets padding = EdgeInsets.only(
              top: 25,
              bottom: 10,
              left: w > 576 ? 40 : 15,
              right: w > 576 ? 40 : 20);
          // (MediaQuery.of(context).size.width>576)?{}:w=MediaQuery.of(context).size.width;
          return Padding(
            padding: padding,
            child: Form(
              key: knew_formkey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 20),
                    child: Text(
                      "Welcome",
                      style: TextStyle(
                          color: allColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: Form(
                      key: knew_namekey,
                      child: TextInputCreated(
                        inputFormattersC: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[a-zA-Z ]')),
                        ],
                            IconDataC: Icons.person,
                            labelTextC: 'Name',
                            hintTextC: 'Enter your Full Name',
                        onChangedC: (value) {
                          setState(() {
                            knew_name = value;
                            knew_namekey.currentState?.validate();
                          });
                        },
                        ValidatorC: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              knew_name == "") {
                            return "Enter your full name";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: Row(
                      children: [
                        SizedBox(
                            width: (w > 576) ? w / 2 * 0.35 : w * 0.35,
                            child: Form(
                              key: knew_dobkey,
                              child: TextFormField(
                                style: TextStyle(color: allColor),
                                controller: knew_ageController,
                                keyboardType: TextInputType.datetime,
                                decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.calendar_today,
                                      color: allColor,
                                    ),
                                    labelText: kIsWeb
                                        ? "Date of Birth"
                                        : "Date of birth",
                                    hintStyle: TextStyle(color: allColor),
                                    labelStyle: TextStyle(color: allColor),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: allColor)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: allColor))),
                                readOnly: true,
                                onTap: () async {
                                  DateTime? pickDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime(2000),
                                      firstDate: DateTime(1923),
                                      lastDate: DateTime.now());
                                  if (pickDate != null) {
                                    knew_dob = pickDate;
                                  }
                                  setState(() {
                                    knew_ageController.text =
                                        DateFormat('yyyy-MM-dd')
                                            .format(pickDate!);
                                    print(knew_dob?.difference(DateTime.now()));
                                    if (knew_dob != null) {
                                      final ageDuration =
                                          DateTime.now().difference(knew_dob!);
                                      final ageYears =
                                          (ageDuration.inDays / 365).floor();
                                      knew_ageDiff = ageYears;
                                    }
                                  });
                                },
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty ||
                                      knew_dob == null ||
                                      knew_ageDiff < 18) {
                                    return "Date of birth is required";
                                  }
                                  if (knew_ageDiff < 18) {
                                    return "Age Should be Greater than 18";
                                  }
                                  return null;
                                },
                              ),
                            )),
                        SizedBox(
                          width: (w > 576) ? w / 2 * 0.35 : w * 0.35,
                          child: Padding(
                            padding: EdgeInsets.only(
                                bottom: 25.0, left: 10, right: 10),
                            child: Text(
                              "\n\nAge: ${knew_ageDiff.toString()}",
                              textAlign: TextAlign.end,
                              style: TextStyle(color: allColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: TextInputCreated(
                      inputFormattersC: [
                        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]')),
                      ],
                          IconDataC:Icons.home_filled,
                          labelTextC: 'College Name',
                          hintTextC: 'Enter your Exact College Name',
                        onChangedC: (value) {
                        setState(() {
                          knew_collegename = value;
                        });
                      },
                      ValidatorC: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            knew_collegename == "") {
                          return "Enter your College name";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: TextInputCreated(
                      inputFormattersC: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'[0-9a-zA-Z]')),
                      ],
                          IconDataC: Icons.app_registration,
                          labelTextC: 'RollNo',
                          hintTextC: 'Your college rollno',
                          onChangedC: (value) {
                        setState(() {
                          knew_rollno = value;
                        });
                      },
                      ValidatorC: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            knew_rollno == "") {
                          return "Enter your College Rollno";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: TextInputCreated(
                      keyboardTypeC: TextInputType.emailAddress,
                      inputFormattersC: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'[0-9a-zA-Z@.]')),
                      ],
                          IconDataC:Icons.email_outlined,
                          labelTextC: 'Email',
                          hintTextC: 'Enter your Email',
                         onChangedC: (value) {
                        setState(() {
                          if(validateEmail(value))
                            {knew_email = value;}
                        });
                      },
                      ValidatorC: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            knew_email == "" || !validateEmail(knew_email)) {
                          return "Enter your Email Address";
                        }
                        return null;
                      },
                    ),
                  ),
                  CheckboxListTile(
                    title: Text(
                      "Not attended Interview?",
                      textAlign: TextAlign.right,
                      style: TextStyle(color: allColor),
                    ),
                    contentPadding: EdgeInsets.zero,
                    controlAffinity: ListTileControlAffinity.trailing,
                    value: knew_isChecked,
                    onChanged: (value) {
                      setState(() {
                        knew_isChecked = value!;
                        if (knew_isChecked)
                          knew_statusRadiobox = 2;
                        else
                          knew_statusRadiobox = -1;
                      });
                    },
                  ),

                  (knew_isChecked)
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 25.0),
                          child: Wrap(
                            children: [
                              Form(
                                key: knew_interviewDateKey,
                                child: TextFormField(
                                  style: TextStyle(color: allColor),
                                  controller: knew_interviewController,
                                  keyboardType: TextInputType.datetime,
                                  decoration: InputDecoration(
                                      icon: Icon(
                                        Icons.calendar_today,
                                        color: allColor,
                                      ),
                                      labelText: "Interview Date",
                                      hintStyle: TextStyle(color: allColor),
                                      labelStyle:
                                          TextStyle(color: allColor),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: allColor)),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: allColor))),
                                  readOnly: true,
                                  onTap: () async {
                                    DateTime? pickDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime(2050));
                                    if (pickDate != null) {
                                      knew_interviewDate = pickDate;
                                    }
                                    setState(() {
                                      knew_interviewController.text =
                                          DateFormat('yyyy-MM-dd')
                                              .format(pickDate!);
                                    });
                                  },
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        knew_interviewDate == null) {
                                      return "Interview Date is required";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: RadioListTile(
                                value: 0,
                                groupValue: knew_statusRadiobox,
                                title: Text('Rejected'),
                                onChanged: (value) {
                                  setState(() {
                                    knew_statusRadiobox = value as int;
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              child: RadioListTile(
                                value: 1,
                                groupValue: knew_statusRadiobox,
                                title: Text('Selected'),
                                onChanged: (value) {
                                  setState(() {
                                    knew_statusRadiobox = value as int;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                  // Padding(
                  //   padding: const EdgeInsets.only(bottom: 25.0),
                  //   child: TextInputCreated(
                  //     inputFormattersC: [
                  //       FilteringTextInputFormatter.allow(
                  //           RegExp(r'[a-zA-Z. ]')),
                  //     ],
                  //         IconDataC: Icons.school_outlined,
                  //         labelTextC: 'Degree',
                  //         hintTextC: 'Degree',
                  //      onChangedC: (value) {
                  //       setState(() {
                  //         knew_degree = value;
                  //       });
                  //     },
                  //     ValidatorC: (value) {
                  //       if (value == null ||
                  //           value.isEmpty ||
                  //           knew_degree == "") {
                  //         return "Enter your Degree";
                  //       }
                  //       return null;
                  //     },
                  //   ),
                  // ),
                   Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: TextInputCreated(
                      inputFormattersC: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'[a-zA-Z. ]')),
                      ],
                      keyboardTypeC: TextInputType.emailAddress,
                          IconDataC:Icons.work,
                          labelTextC: 'Position',
                          hintTextC: 'Position applied for',
                         onChangedC: (value) {
                        setState(() {
                          knew_pos = value;
                        });
                      },
                      ValidatorC: (value) {
                        if (value == null || value.isEmpty || knew_pos == "") {
                          return "Enter the position you applied for";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: TextInputCreated(
                      inputFormattersC: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      keyboardTypeC: TextInputType.number,
                          IconDataC:Icons.phone,
                          labelTextC: 'phone number',
                          hintTextC: 'phone number',
                          onChangedC: (value) {
                        setState(() {
                          knew_ph = value;
                        });
                      },
                      ValidatorC: (value) {
                        if (value == null || value.isEmpty || knew_ph == "" || !validatePhoneNumber(knew_ph)) {
                          return "Enter your phone number";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: TextInputCreated(
                      keyboardTypeC: TextInputType.number,
                      inputFormattersC: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                          IconDataC: Icons.menu_book_sharp,
                          labelTextC: 'Year of passed out',
                          hintTextC: 'year of passed out',
                          onChangedC: (value) {
                        setState(() {
                          knew_passedout = int.parse(value) ?? 0;
                        });
                      },
                      ValidatorC: (value) {
                        if ((value != null) &&
                            (int.tryParse(value!) == null ||
                                int.parse(value) < 1950 ||
                                int.parse(value) > 2050)) {
                          return "Enter year only in number";
                        }
                        return null;
                      },
                    ),
                  ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right:18.0),
                      child: Icon(Icons.school,color: allColor,),
                    ),

                    Container(
                    //  alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: allColor,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: DropdownButton<String>(
                        icon: Icon(
                          Icons.arrow_drop_down, // Default dropdown arrow icon
                          color: allColor, // Set the desired color for the arrow
                        ),
                        borderRadius: BorderRadius.circular(1),
                        underline: Container(),
                        style: TextStyle(color: allColor), // Set the text color
                        value: selectedDegree,
                        onChanged: (String? value) {
                          setState(() {
                            selectedDegree = value??"";
                            knew_degree = value??"";
                          });
                        },
                        items: degrees.map((String degree) {
                          return DropdownMenuItem<String>(
                            value: degree,
                            child: Text(degree),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right:18.0),
                          child: Icon(Icons.school,color: allColor),
                        ),
                        Container(
                          //  alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: allColor,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: DropdownButton<String>(
                            icon: Icon(
                              Icons.arrow_drop_down, // Default dropdown arrow icon
                              color: allColor, // Set the desired color for the arrow
                            ),
                            borderRadius: BorderRadius.circular(1),
                            underline: Container(),
                            style: TextStyle(color: allColor), // Set the text color

                            value: selectedExperience,
                            onChanged: (String? value) {
                              setState(() {
                                selectedExperience = value??"";
                                knew_yoexp = value??"";
                              });
                            },
                            items: experience.map((String exp) {
                              return DropdownMenuItem<String>(
                                value: exp,
                                child: Text(exp),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.only(bottom: 25.0),
                  //   child: Form(
                  //     key: knew_yofexpKey,
                  //     child: TextInputCreated(
                  //         keyboardTypeC: TextInputType.number,
                  //         inputFormattersC: [
                  //           FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  //         ],
                  //              IconDataC: Icons.person,
                  //             labelTextC: 'Experience',
                  //             hintTextC: 'Experience',
                  //             onChangedC: (value) {
                  //           setState(() {
                  //             if (knew_yofexpKey.currentState!.validate()) {
                  //               print("valid form");
                  //             }
                  //             knew_yoexp = int.parse(value);
                  //           });
                  //         },
                  //         ValidatorC: (value) {
                  //           if (int.tryParse(value!) == null) {
                  //             return "Enter your experience in number";
                  //           }
                  //           if (knew_yoexp < 0 || knew_yoexp >= 100) {
                  //             return "Please enter valid number";
                  //           }
                  //           return null;
                  //         }),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: _showMultiSelect,
                      child: const Text('Select Your Skills'),
                    ),
                  ),
                  Wrap(
                    children: kSelectedItems
                        .map((e) => Chip(
                            backgroundColor: Colors.purpleAccent,
                            deleteIcon: Icon(Icons.cancel),
                            onDeleted: () {
                              setState(() {
                                kSelectedItems.remove(e);
                              });
                            },
                            label: Text(e)))
                        .toList(),
                  ),
                  Text(
                    pickedFile?.name ?? "",
                  ),
                  Text(
                    knew_fileError ?? "",
                    style: TextStyle(color: Colors.red),
                  ),
                  Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    spacing: 70,
                    runSpacing: 20,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 25.0),
                        child: Container(
                          decoration:BoxDecoration(
                              color: containerBg,

                              borderRadius: BorderRadius.circular(50)
                          ),
                          child: ElevatedButton(
                              onPressed: selectFile,
                              child: Text("Select Resume",
                                  style: TextStyle(color: Colors.white))),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(bottom: 25.0),
                          child: Column(
                            children: [
                              Container(
                                decoration:BoxDecoration(
                                 borderRadius: BorderRadius.circular(20)
                                ),
                                child: ElevatedButton(
                                    onPressed: uploadFile,
                                    child: Text("Upload Resume",
                                        style: TextStyle(color: Colors.white))),
                              ),
                              if (progress != 0.0)
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    width: 80,
                                    child: Builder(
                                      builder: (BuildContext context) {
                                        return LinearProgressIndicator(
                                          value: progress / 100,
                                          backgroundColor:
                                              Colors.purpleAccent.shade700,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Colors.green),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                            ],
                          )),
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: (){
                              Navigator.pop(context);
                            }, child: Text("Back"),
                          ),
                          Container(
                              color: (knew_disable)?Colors.transparent:Color(0xFFC54B8C),
                            child: ElevatedButton(
                              onPressed: (knew_disable)?null:() {
                                print("pressed");
                                if (pickedFile == null || downloadURL == null || downloadURL == "") {
                                  setState(() {
                                    knew_fileError = "Please upload Resume";
                                    delay();
                                  });
                            }   else if (knew_formkey.currentState!
                                        .validate() &&
                                    knew_ageDiff > 17 &&
                                    knew_yoexp!="" && knew_degree!=""&&
                                    kSelectedItems.isNotEmpty &&
                                    downloadURL != null &&
                                    knew_dob != null && knew_statusRadiobox!=-1 &&
                                    ((knew_statusRadiobox != 2)
                                        ? knew_interviewDate == null
                                        : knew_interviewDate != null)) {
                                  print("selectedITems $kSelectedItems");
                                        _firestore
                                            .collection("applicants")
                                            .doc("$knew_email")
                                            .set({
                                          'applic_detail': {
                                            "rollno": knew_rollno.trim().toLowerCase(),
                                            "name": knew_name.trim().toLowerCase(),
                                            "college": knew_collegename.trim().toLowerCase(),
                                            "exp": knew_yoexp,
                                            "url": downloadURL,
                                            "degree": knew_degree.trim().toLowerCase(),
                                            "position": knew_pos.trim().toLowerCase(),
                                            "phone": knew_ph,
                                            "email": knew_email.trim().toLowerCase(),
                                            "passedOut": knew_passedout,
                                            "age": knew_ageDiff,
                                            "skills": kSelectedItems,
                                            "status": knew_statusRadiobox,
                                            "interviewDate":
                                                knew_interviewDate ?? null
                                          }
                                        }).whenComplete(() {
                                          setState(() {
                                            knew_fileError = "";
                                            pickedFile = null;
                                          });
                                          knew_formkey.currentState?.reset();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      RoutingPage()));
                                        }).catchError((){
                                          print("Errorr in catch of submit");
                                        });

                                } else {
                                  if (knew_statusRadiobox == 2 &&
                                      knew_interviewDate == null) {
                                    setState(() {
                                      knew_fileError = "Enter the interview Date";
                                      delay();
                                    });
                                  } else if (knew_statusRadiobox == -1) {
                                    setState(() {
                                      knew_fileError =
                                          "Enter the Interview Status";
                                      delay();
                                    });
                                  } else if (knew_dob == null) {
                                    setState(() {
                                      knew_fileError = "Enter the dob ";
                                      delay();
                                    });
                                  } else if (kSelectedItems.isEmpty) {
                                    setState(() {
                                      knew_fileError = "Enter your skills ";
                                      delay();
                                    });
                                  } else if (knew_ageDiff < 18) {
                                    setState(() {
                                      knew_fileError = "Age should be above 17";
                                      delay();
                                    });
                                  } else {
                                    setState(() {
                                      knew_fileError =
                                          "Enter the details properly";
                                      delay();
                                    });
                                  }
                                }
                              },
                              child: Text("Submit"),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
