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
          onTap:(){
            if(bodyImg == 'assets/body.png'){
              setState(() {
                bodyImg = 'assets/chest.png';
              });
            } else{setState(() {
              bodyImg = 'assets/body.png';
            });}
          },
          child: Container(
            height: 400,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(bodyImg),
                  fit: BoxFit.fitHeight),
            ),
          ),
        ),
      ],
    );
  }
}
