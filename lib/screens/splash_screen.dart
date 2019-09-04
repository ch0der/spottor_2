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

  bool chestVis = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: buildPage(),
    );
  }

  buildPage() {
    return Column(
      children: <Widget>[
        title(),
        Row(
          children: <Widget>[
            Container(
              child: buildBody(),
            ),
            Container(
              height: 400,
              width: 200,
              color: Colors.teal,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 20),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: bottomBar(),
        )
      ],
    );
  }

  title() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/LogoMain.png'), fit: BoxFit.fitHeight),
      ),
    );
  }

  buildBody() {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Container(
                height: 450,
                width: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(bodyImg), fit: BoxFit.scaleDown),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 60),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(),
                    child: chestBody(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 36,
                      left: 43,
                    ),
                    child: abs2(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  chestBody() {
    if (chestSelected == false) {
      chestColor = Colors.red[200];
      chestVis = false;
    } else {
      chestColor = Colors.blueAccent;
      chestVis = true;
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          chestSelected = !chestSelected;
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
                    child: absContainer(
                        height: 40,
                        width: 40,
                        topL: 30,
                        topR: 10,
                        botL: 5,
                        botR: 5,
                        color: absColor),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5),
                ),
                Container(
                  child: ClipPath(
                    clipper: RoundedDiagonalPathClipper(),
                    child: absContainer(
                        height: 40,
                        width: 40,
                        topL: 10,
                        topR: 30,
                        botL: 5,
                        botR: 5,
                        color: absColor),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  child: ClipPath(
                    clipper: AbsClipper22(),
                    child: absContainer(
                        height: 40,
                        width: 40,
                        topL: 10,
                        topR: 10,
                        botL: 5,
                        botR: 5,
                        color: absColor),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5),
                ),
                Container(
                  child: ClipPath(
                    clipper: AbsClipper2(),
                    child: absContainer(
                        height: 40,
                        width: 40,
                        topL: 10,
                        topR: 10,
                        botL: 5,
                        botR: 5,
                        color: absColor),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  child: ClipPath(
                    clipper: AbsClipper33(),
                    child: absContainer(
                        height: 50,
                        width: 40,
                        topL: 10,
                        topR: 20,
                        botL: 50,
                        botR: 5,
                        color: absColor),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5),
                ),
                Container(
                  child: ClipPath(
                    clipper: AbsClipper3(),
                    child: absContainer(
                        height: 50,
                        width: 40,
                        topL: 20,
                        topR: 10,
                        botL: 5,
                        botR: 50,
                        color: absColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  bottomBar() {
    return Row(
      children: <Widget>[
        partContainer2(chestVis),
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

absContainer(
    {double height,
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
partContainer(String text, String part,bool visible){
  return Visibility(
    visible: visible,
    child: Container(
      height: 20,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.black38,
      ),child: Text(text),
    ),
  );
}
partContainer2(bool visible){
  return HomepageButton(
    text: 'Chest',
    paused:  visible,
  );
}

class HomepageButton extends StatefulWidget {
  HomepageButton({
    Key key,
    this.text,
    this.paused,

}) : super(key: key);

  final String text;
  final bool paused;


  @override
  _HomepageButtonState createState() => _HomepageButtonState();
}

class _HomepageButtonState extends State<HomepageButton> with TickerProviderStateMixin {
  Animation<double> buttonAnimation1;
  AnimationController buttonController1;
  double value1 = 1.0;
  double value2 = 2.0;

  @override
  void dispose(){
    super.dispose();
  }
  @override
  void initState(){
  super.initState();

  buttonController1 = AnimationController(
    vsync: this,
    duration: Duration(seconds: 1),
  );
  buttonAnimation1 = Tween(
    begin: value1,
    end: value2,
  ).animate(CurvedAnimation(parent: buttonController1,curve: Curves.easeInCubic),);
  buttonAnimation1.addStatusListener((status){
    if (widget.paused == false){buttonController1.forward();}
  });


  }


  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context,child){
        if(widget.paused == true){buttonController1.forward();}
        return Transform.scale(scale: buttonAnimation1.value,child: child,);
      },
      animation: buttonAnimation1,
      child: GestureDetector(
        onDoubleTap: (){
          buttonController1.forward();
        },
        child: Container(
          height: 100,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.black38,
          ),child: Text(widget.text),
        ),
      ),
    );
  }
}

