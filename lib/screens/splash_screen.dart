import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String bodyImg = 'assets/body.png';
  bool absSelected = false;
  Color absColor;
  bool chestSelected = false;
  Color chestColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: buildBody(),
    );
  }

  buildBody() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 20),
        ),
        Container(
          height: 60,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/LogoMain.png'),
                fit: BoxFit.fitHeight),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20),
        ),
        Stack(
          children: <Widget>[
            Container(
              height: 450,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(bodyImg), fit: BoxFit.fitHeight),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 58,
                top: 57,
              ),
              child: Stack(
                children: <Widget>[
                  chestBody(),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 36,
                      left: 50,
                    ),
                    child: abs2(),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }

  chestBody() {
    if (chestSelected == false) {
      chestColor = Colors.red[200];
    } else {
      chestColor = Colors.blueAccent;
    }
    return GestureDetector(
      onTap: (){
        setState(() {
          chestSelected =! chestSelected;
        });
      },
      child: Transform.scale(
        scale: .4,
        child: Row(
          children: <Widget>[
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: chestColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  bottomLeft: Radius.elliptical(60, 40),
                  bottomRight: Radius.circular(30),
                  topRight: Radius.elliptical(20, 40),
                ),
              ),
            ),
            Container(
              width: 10,
            ),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: chestColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  bottomRight: Radius.elliptical(60, 40),
                  bottomLeft: Radius.circular(30),
                  topLeft: Radius.elliptical(20, 40),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  abs2() {
    if (absSelected == false) {
      absColor = Colors.red[200];
    } else {
      absColor = Colors.blueAccent;
    }
    return Transform.scale(
      scale: .5,
      child: GestureDetector(
        onTap: () {
          setState(() {
            absSelected = !absSelected;
          });
        },
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[

                Container(
                  child: ClipPath(
                    clipper: RoundedDiagonalPathClipper3(),
                    child: absContainer(height: 40,width: 40,topL: 30,topR: 10,botL: 5,botR: 5,color: absColor),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5),
                ),
                Container(
                  child: ClipPath(
                    clipper: RoundedDiagonalPathClipper(),
                    child: absContainer(height: 40,width: 40,topL: 10,topR: 30,botL: 5,botR: 5,color: absColor),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[

                Container(
                  child: ClipPath(
                    clipper: AbsClipper22(),
                    child: absContainer(height: 40,width: 40,topL: 10,topR: 10,botL: 5,botR: 5,color: absColor),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5),
                ),
                Container(
                  child: ClipPath(
                    clipper: AbsClipper2(),
                    child: absContainer(height: 40,width: 40,topL: 10,topR: 10,botL: 5,botR: 5,color: absColor),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  child: ClipPath(
                    clipper: AbsClipper33(),
                    child: absContainer(height: 50,width: 40,topL: 10,topR: 20,botL: 50,botR: 5,color: absColor),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5),
                ),
                Container(
                  child: ClipPath(
                    clipper: AbsClipper3(),
                    child: absContainer(height: 50,width: 40,topL: 20,topR: 10,botL: 5,botR: 50,color: absColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RoundedDiagonalPathClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0.0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 35.0)
      ..lineTo(size.height, 15)
      ..arcToPoint(
        Offset(0, 0.0),
      )
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class RoundedDiagonalPathClipper3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0.0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 35.0)
      ..lineTo(size.height, 0.0)
      ..arcToPoint(
        Offset(0.0, 15),
      )
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class AbsClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0.0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 35.0)
      ..lineTo(size.height, 5)
      ..arcToPoint(
        Offset(0, 0.0),
      )
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class AbsClipper22 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0.0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 35.0)
      ..lineTo(size.height, 0)
      ..arcToPoint(
        Offset(0, 5),
      )
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class AbsClipper33 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0.0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 35.0)
      ..lineTo(size.height, 0)
      ..arcToPoint(
        Offset(0, 5),
      )
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class AbsClipper3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0.0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 35.0)
      ..lineTo(size.height, 5)
      ..arcToPoint(
        Offset(0, 0.0),
      )
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

absContainer({double height,
    double width,
    double topR,
    double topL,
    double botL,
    double botR,
    Color color}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(topR),
        bottomRight: Radius.circular(botR),
        bottomLeft: Radius.circular(botL),
        topLeft: Radius.circular(topL),
      ),
      color: color,
    ),
  );
}
