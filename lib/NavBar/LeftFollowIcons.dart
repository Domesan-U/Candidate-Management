import 'package:flutter/material.dart';
class LeftFollowIcons extends StatelessWidget {
  const LeftFollowIcons({
    super.key,
    required this.deviceWidth,
  });

  final double deviceWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: deviceWidth * 0.1,
      child: RotatedBox(
        quarterTurns: 1,
        child: Row(
          children: [
            Text(
              "Follow Us ---->",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
                child: Text(
                  "  ",
                  style: TextStyle(color: Colors.white),
                )),
            Image.asset("images/instagram2.png",
                width: deviceWidth * 0.025),
            SizedBox(
                child: Text(
                  "  ",
                  style: TextStyle(color: Colors.white),
                )),
            Image.asset(
              "images/facebook2.png",
              width: deviceWidth * 0.025,
            ),
            SizedBox(
                child: Text(
                  "  ",
                  style: TextStyle(color: Colors.white),
                )),
            Image.asset(
              "images/gmail.png",
              width: deviceWidth * 0.025,
            ),
          ],
        ),
      ),
    );
  }
}
