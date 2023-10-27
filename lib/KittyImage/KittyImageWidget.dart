import 'package:flutter/material.dart';
class KittyImage extends StatelessWidget {
  const KittyImage({
    super.key,
    required this.deviceWidth,
    required this.deviceHeight,
  });

  final double deviceWidth;
  final double deviceHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration:
        BoxDecoration(borderRadius:BorderRadius.circular(20),color: Colors.black,
          boxShadow: const [
            BoxShadow(
                color: Colors.pink,
                blurRadius: 20,
                offset: Offset(0, 2)),
            BoxShadow(
                color: Colors.blue,
                blurRadius: 20,
                offset: Offset(0, -2)),
          ],

        ),
        child: Image.asset(
          'images/cuteKitty.png',
          width: (deviceWidth<820)?deviceWidth * 0.30:deviceWidth * 0.15,
          height: (deviceWidth<820)?deviceWidth * 0.45:deviceWidth * 0.25,
        ),
      ),
    );
  }
}
