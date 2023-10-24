import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart' as Shimmerr;
class Shimmer extends StatefulWidget {
  const Shimmer({Key? key}) : super(key: key);

  @override
  State<Shimmer> createState() => _ShimmerState();
}

class _ShimmerState extends State<Shimmer> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h =MediaQuery.of(context).size.height*0.95;
    return Container(
      width: w/2,
      height: h,
      child: ListView.builder(itemCount: 7,itemBuilder: (context,index){
        return Padding(padding: EdgeInsets.symmetric(horizontal: 15),
        child:SizedBox(
          height: h/7,
          child: Shimmerr.Shimmer.fromColors(
            child: Card(),
            baseColor: Colors.grey.withOpacity(0.5), 
            highlightColor: Colors.white,
          ),
        )

        );
      }),
    );
  }
}
