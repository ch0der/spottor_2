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
                      top: 57,
                      left: 5,
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
    return Transform.scale(
      scale: .4,
      child: Row(
        children: <Widget>[
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.blue,
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
              color: Colors.blue,
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
    );
  }

  absBody() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            ClipPath(
              clipper: RoundedDiagonalPathClipper(),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                  ),
                  color: Colors.redAccent,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  abs2() {
    if(absSelected == false){
      absColor = Colors.redAccent;
    }else{absColor = Colors.lime;}
    return Transform.scale(
      scale: .5,
      child: GestureDetector(
        onTap: (){
          setState(() {
            absSelected =! absSelected;
          });
        },
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 70),
            ),
            Container(
              child: ClipPath(
                clipper: RoundedDiagonalPathClipper3(),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                      topLeft: Radius.circular(30),
                    ),
                    color: absColor,
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 5),),
            Container(
              child: ClipPath(
                clipper: RoundedDiagonalPathClipper(),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                      topLeft: Radius.circular(10),
                    ),
                    color: absColor,
                  ),
                ),
              ),
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
      ..lineTo(0.0,size.height)
      ..lineTo(size.width,size.height)
      ..lineTo(size.width, 35.0)
      ..lineTo(size.height, 15)
      ..arcToPoint(Offset(0,0.0),)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class RoundedDiagonalPathClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..quadraticBezierTo(size.width - 1, 0.0, size.width - 2, size.height - 20)
      ..lineTo(size.width, 35)
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
      ..lineTo(0.0,size.height)
      ..lineTo(size.width,size.height)
      ..lineTo(size.width, 35.0)
      ..lineTo(size.height, 0.0)
      ..arcToPoint(Offset(0.0, 15),)
      ..close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
