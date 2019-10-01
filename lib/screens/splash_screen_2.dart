import 'package:flutter/material.dart';

class SplashScreen2 extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: buildBody(),

    );
  }
  buildBody(){
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/imgs/splash_background.jpg'),
          colorFilter: ColorFilter.mode(Colors.lightGreen[100].withOpacity(1), BlendMode.modulate),
        ),
      ),
      child: loginBody(),
    );
  }
  loginBody(){
    return Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 45),),
        mainLogo(),
        Padding(
          padding: EdgeInsets.only(top: 100),
        ),
        GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, '/second');
            print('test');
          },
          child: Container(height: 30,width: 100,color: Colors.orange,),
        ),
      ],

    );
  }
  mainLogo(){
    return  Container(
      height: 80,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(.5)
      ),
      child: Transform.scale(
        scale: .9,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/imgs/newLogo.png'),
            ),
          ),
        ),
      ),
    );

  }
}
