import 'package:flutter/material.dart';

import '../constants.dart';
class ScrollingFloater extends StatefulWidget {
   const ScrollingFloater( this.scrollController);
  final ScrollController scrollController;
  @override
  State<ScrollingFloater> createState() => _ScrollingFloaterState();
}

class _ScrollingFloaterState extends State<ScrollingFloater> {
  bool _isAtTop = true;
  bool _scrollListener() {
    var middleThreshold = widget.scrollController.position.maxScrollExtent / 2;
    if (widget.scrollController.position.pixels ==0) {
      setState((){
        _isAtTop = true;
      });
      return true;
    } else{
      setState(() {
        _isAtTop = false;
      });
      return false;
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Positioned(
      bottom: 16,
      right: 16,
      child: FloatingActionButton(
        backgroundColor: containerBg,
        onPressed: (){

         _scrollListener()?widget.scrollController.animateTo(
           widget.scrollController.position.maxScrollExtent,
            duration: Duration(seconds: 1), // Adjust the duration as needed
            curve: Curves.ease,
          ):widget.scrollController.animateTo(
           0,
           duration: Duration(seconds: 1), // Adjust the duration as needed
           curve: Curves.ease,
         );
        },
        child: _scrollListener()?Icon(Icons.arrow_downward_sharp,size: 30,):Icon(Icons.arrow_upward,size: 30,),
      ),
    )
    ;
  }
}
