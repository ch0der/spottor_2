import 'package:flutter/material.dart';
import 'dart:async';

class PadDemo extends StatefulWidget {

  @override
  _PadDemoState createState() => _PadDemoState();
}

class _PadDemoState extends State<PadDemo> {

  bool isVisible = false;
  bool isVisible2 = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
    );
  }

  buildBody() {
    return Container(
      decoration: BoxDecoration(),
      child: Stack(
        children: <Widget>[
          buildNotebook(),
          Positioned(
            left: 70,
            top: 80,
            child: textTest(),
          ),
          Positioned(
            left: 70,
            top: 115,
            child: text2(),
          ),
          Positioned(
            left: 150,
            top: 115,
            child: iconTest(),
          ),
        ],
      ),
    );
  }

  iconTest() {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: (){
            setState(() {
              isVisible = !isVisible;
            },);
            Future.delayed(Duration(milliseconds: 1000),(){
              setState(() {
                isVisible = false;
              });
            },);
    },
          child: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/imgs/detailIcons/barbell.png'),
              ),
            ),
          ),
        ),
        Container(width: 45,child: appearingTextBox(),),
      ],
    );
  }

  appearingTextBox() {
    return Visibility(
      visible: isVisible,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.lightGreen
        ),
        child: Text('barbell'),
      ),
    );
  }

  buildNotebook() {
    return Stack(
      children: <Widget>[
        blueLines(),
        Positioned(
          left: MediaQuery.of(context).size.width*.125,
          child: redLines(),
        ),
      ],
    );
  }

  redLines() {
    return Row(
      children: <Widget>[
        Container(
          width: 1,
          height: 1000,
          color: Colors.red[200].withOpacity(.8),
        ),
        Container(
          width: 3,
        ),
        Container(
          width: 1,
          height: 1000,
          color: Colors.red[200].withOpacity(.8),
        )
      ],
    );
  }

  blueLines() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 42),
        ),
        blueLinesEditor(),
        blueLinesEditor(),
        blueLinesEditor(),
        blueLinesEditor(),
        blueLinesEditor(),
        blueLinesEditor(),
        blueLinesEditor(),
        blueLinesEditor(),
        blueLinesEditor(),
        blueLinesEditor(),
        blueLinesEditor(),
      ],
    );
  }

  blueLinesEditor() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 31),
        ),
        Container(
          height: 1,
          color: Colors.blue[300],
        ),
        Padding(
          padding: EdgeInsets.only(top: 31),
        ),
        Container(
          height: 1,
          color: Colors.blue[300],
        ),
      ],
    );
  }

  hinges() {
    final double spacing = 40;
    return Transform.scale(
      scale: .7,
      child: (Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: spacing),
          ),
          hinge(),
          Padding(
            padding: EdgeInsets.only(top: spacing),
          ),
          hinge(),
          Padding(
            padding: EdgeInsets.only(top: spacing),
          ),
          hinge(),
          Padding(
            padding: EdgeInsets.only(top: spacing),
          ),
          hinge(),
          Padding(
            padding: EdgeInsets.only(top: spacing),
          ),
          hinge(),
          Padding(
            padding: EdgeInsets.only(top: spacing),
          ),
          hinge(),
          Padding(
            padding: EdgeInsets.only(top: spacing),
          ),
          hinge(),
          Padding(
            padding: EdgeInsets.only(top: spacing),
          ),
          hinge(),
          Padding(
            padding: EdgeInsets.only(top: spacing),
          ),
          hinge(),
          Padding(
            padding: EdgeInsets.only(top: spacing),
          ),
          hinge(),
          Padding(
            padding: EdgeInsets.only(top: spacing),
          ),
          hinge(),
          Padding(
            padding: EdgeInsets.only(top: spacing),
          ),
          hinge(),
          Padding(
            padding: EdgeInsets.only(top: spacing),
          ),
          hinge(),
          Padding(
            padding: EdgeInsets.only(top: spacing),
          ),
          hinge(),
          Padding(
            padding: EdgeInsets.only(top: spacing),
          ),
          hinge(),
          Padding(
            padding: EdgeInsets.only(top: spacing),
          ),
          hinge(),
          Padding(
            padding: EdgeInsets.only(top: spacing),
          ),
          hinge(),
          Padding(
            padding: EdgeInsets.only(top: spacing),
          ),
          hinge(),
        ],
      )),
    );
  }

  hinge() {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Positioned(
          bottom: -2.5,
          left: 38,
          child: Container(
            height: 17,
            width: 7,
            decoration: BoxDecoration(
              color: Colors.black87.withOpacity(.3),
              borderRadius: BorderRadius.all(
                Radius.circular(4),
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.black87.withOpacity(.4),
                    spreadRadius: 3,
                    blurRadius: 1)
              ],
            ),
          ),
        ),
        Column(
          children: <Widget>[
            Container(
              height: 6,
              width: 45,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.grey[600],
                    Colors.grey[300],
                    Colors.grey,
                  ],
                  stops: [
                    0,
                    .5,
                    1,
                  ],
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black87.withOpacity(.3),
                      offset: Offset(0, 1),
                      blurRadius: 2)
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 3),
            ),
            Container(
              height: 6,
              width: 45,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.grey[600],
                  Colors.grey[300],
                  Colors.grey,
                ], stops: [
                  0,
                  .5,
                  1
                ]),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black87.withOpacity(.3),
                      offset: Offset(0, 1),
                      blurRadius: 2,
                      spreadRadius: 2)
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  textTest() {
    return Column(
      children: <Widget>[
        Container(
          child: Text(
            'Description           Set  Reps   Wt',
            style: TextStyle(
                fontFamily: 'Handlee',
                fontSize: 25,
                decoration: TextDecoration.underline),
          ),
        )
      ],
    );
  }

  text2() {
    return Column(
      children: <Widget>[
        Container(
          child: Text(
            'Deadlift                          1        10         50',
            style: TextStyle(fontFamily: 'Handlee', fontSize: 21),
          ),
        ),
        Container(
          child: Text(
            '      ~                                2        10         50',
            style: TextStyle(fontFamily: 'Handlee', fontSize: 21),
          ),
        ),
        Container(
          child: Text(
            '      ~                                3        10         50',
            style: TextStyle(fontFamily: 'Handlee', fontSize: 21),
          ),
        ),
        Container(
          child: Text(
            '      ~                                4        10         50',
            style: TextStyle(fontFamily: 'Handlee', fontSize: 21),
          ),
        ),
      ],
    );
  }
}
