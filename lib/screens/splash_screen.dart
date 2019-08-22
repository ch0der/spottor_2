import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String bodyImg = 'assets/body.png';

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
        GestureDetector(
          onTap: () {
            if (bodyImg == 'assets/body.png') {
              setState(() {
                bodyImg = 'assets/chest.png';
              });
            } else {
              setState(() {
                bodyImg = 'assets/body.png';
              });
            }
          },
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(bodyImg), fit: BoxFit.fitHeight),
            ),
          ),
        ),
        chestBody(),
        abs2(),
      ],
    );
  }

  chestBody() {
    return Transform.scale(
      scale: .5,
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
  abs2(){
    return Row(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(left: 100),),
        Container(
          child: ClipPath(
            clipper: RoundedDiagonalPathClipper2(),
            child: Container(
              height: 40,
              width: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
                color: Colors.redAccent,
              ),
            ),
          ),
        ),

        Container(
          child: ClipPath(
            clipper: RoundedDiagonalPathClipper(),
            child: Container(
              height: 40,
              width: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
                color: Colors.redAccent,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
class RoundedDiagonalPathClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0.0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 20.0)
      ..quadraticBezierTo(size.width, 0.0, size.width-80.0, 0.0)
      ..lineTo(20.0, 70.0)
      ..quadraticBezierTo(10.0, 40.0, 0.0, 40.0)
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
      ..lineTo(0.0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, size.height-10)
      ..quadraticBezierTo(size.width, 0.0, size.width-80.0, 0.0)
      ..lineTo(20.0, 70.0)
      ..quadraticBezierTo(10.0, 40.0, 0.0, 40.0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
