import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
  String bodyImg = 'assets/body.png';
  bool absSelected = false;
  Color absColor;
  bool chestSelected = false;
  Color chestColor = Colors.red[200];
  bool test2 = false;
  Color penis = Colors.red[200];
  Color balls = Colors.blue;

  bool chestVis = false;
  Animation<double> buttonAnimation1;
  Animation<double> buttonAnimation2;
  AnimationController chestbuttonController1;

  double value1 = 0;
  double value2 = 1;
  @override
  void dispose(){
    super.dispose();
  }
  @override
  void initState(){
    super.initState();

    chestbuttonController1 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    buttonAnimation1 = Tween(
      begin: value1,
      end: value2,
    ).animate(CurvedAnimation(parent: chestbuttonController1,curve: Curves.fastOutSlowIn),);

    buttonAnimation2 = Tween(
      begin: value2,
      end: value1,
    ).animate(CurvedAnimation(parent: chestbuttonController1,curve: Curves.easeInCubic),);


  }
  bodyOnTap(bool selected, AnimationController controller){
    setState(() {
      selected = !selected;
    });
    controller.stop();
    if(controller.status == AnimationStatus.dismissed){
      controller.forward();
    }
    else if(controller.status == AnimationStatus.completed){
      controller.reverse();
    }
    else if(controller.status == AnimationStatus.forward){
      controller.reverse();
    }
    else if(controller.status == AnimationStatus.reverse){
      controller.forward();
    }
  }

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
                    child: TestBody(child: chestBody(chestSelected,chestbuttonController1),)
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

  chestBody(bool selected, AnimationController controller) {
     bool selectTest = selected;
     Color color1 = chestColor;
     Color partColor = Colors.amber;

    return GestureDetector(
      onTap: (){
        if (chestColor == Colors.red[200]) {
          setState(() {
            chestColor = Colors.blue;
          });
        } else if (chestColor == Colors.blue){
          setState(() {
            chestColor = Colors.red[200];
          });
        }
        controller.stop();
        if(controller.status == AnimationStatus.dismissed){
          controller.forward();
        }
        else if(controller.status == AnimationStatus.completed){
          controller.reverse();
        }
        else if(controller.status == AnimationStatus.forward){
          controller.reverse();
        }
        else if(controller.status == AnimationStatus.reverse){
          controller.forward();
        }
      },
      child: Transform.scale(
        scale: .4,
        child: Row(
          children: <Widget>[
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: color1,
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
                color: partColor,
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
        bodyPartButton('chest',buttonAnimation1),

      ],
    );
  }

  Widget bodyPartButton(String text,Animation animation){
    return AnimatedBuilder(
      builder: (context,child){
        return Transform.scale(scale: animation.value,child: child,);
      },
      animation: animation,
      child: Container(
        height: 30,
        width: 75,
        decoration: BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),child: Center(child: Text(text)),
      ),
    );
  }
  Widget bodyPartWrapper(){
    return(Container());
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
      width: 30,
      decoration: BoxDecoration(
        color: Colors.black38,
      ),child: Text(text),
    ),
  );
}
class TestBody extends StatefulWidget {
  TestBody({this.child});

  final Widget child;
  @override
  _TestBodyState createState() => _TestBodyState();
}

class _TestBodyState extends State<TestBody> {
  Color unSelected = Colors.yellow;
  Color isSelected = Colors.black;
  bool selected = false;


  @override
  Widget build(BuildContext context) {
    Color color1 = unSelected;

    return Theme(
      data: ThemeData(primaryColor: color1),
      child: GestureDetector(
        onTap: (){
          if(color1 == unSelected){
            setState(() {
              color1 = isSelected;
            });
          } else {setState(() {
            color1 = unSelected;
          });}
        },
        child: Container(
          child: widget.child,

        ),
      ),
    );
  }
}


