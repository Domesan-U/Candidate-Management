import 'package:flutter/material.dart';
import 'constants.dart' as k;
import 'rejected.dart';
class HeadingRejected extends StatefulWidget {

  void Function()? onPressedH1;
  void Function()? onPressedH2;
  void Function()? onPressedH3;
   HeadingRejected({required this.onPressedH1,required this.onPressedH2, required this.onPressedH3});
  @override
  State<HeadingRejected> createState() => _HeadingRejectedState();
}

class _HeadingRejectedState extends State<HeadingRejected> {

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return   Container(
      height: MediaQuery.of(context).size.height * 0.08,
      child: Padding(
        padding: const EdgeInsets.only(top:10.0,bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  color:  (k.Screen_option!=0)?Color(0xFF202123):Color(0xFF444654),
                  border: Border.all(
                    color: Colors.white, // Border color
                    width: 1.0, // Border width
                  ),
                  borderRadius: BorderRadius.circular(10)
              ),
              width:
              (w>576)?(w/2)/3 : w/3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    child: Center(child: Text("Rejected",style: TextStyle(color: Colors.white,fontSize: 19),)),
                    onPressed: (){widget.onPressedH1!();setState(() {
                      k.Screen_option = 0;
                    });}
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color:   (k.Screen_option!=1)?Color(0xFF202123):Color(0xFF444654),
                  border: Border.all(
                    color: Colors.white, // Border color
                    width: 1.0, // Border width
                  ),
                  borderRadius: BorderRadius.circular(10)
              ),
              width:
              (w>576)?(w/2)/3 : w/3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    child: Center(child: Text("Selected",style: TextStyle(color: Colors.white,fontSize: 19))),
                    onPressed: (){widget.onPressedH2!();
                    setState(() {
                     k.Screen_option = 1;
                    });}
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color:  (k.Screen_option!=2)?Color(0xFF202123):Color(0xFF444654),
                  border: Border.all(
                    color: Colors.white, // Border color
                    width: 1.0, // Border width
                  ),
                  borderRadius: BorderRadius.circular(10)
              ),
              width:
              (w>576)?(w/2)/3 : w/3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    child: Center(child: Text("Pending",style: TextStyle(color: Colors.white,fontSize: 19))),
                    onPressed: () {
                      widget.onPressedH3!();
                      setState(() {
                     k.Screen_option=2;
                      });
                    }
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    )
    ;
  }
}


