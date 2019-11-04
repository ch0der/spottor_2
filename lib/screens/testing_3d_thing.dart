import 'package:flutter/material.dart';
import 'package:spottor_2/screens/pad.dart';

class S02E02 extends StatelessWidget {
  final imgList = [
   padpenis(),
    Container(height: 200,width: 100,color: Colors.red,),
    padpenis(),
    padpenis(),
    padpenis(),

  ];
  ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 20,

      child: ListWheelScrollView(

        squeeze:1,
        perspective: .01,
        offAxisFraction: .25,
        controller: controller,
        itemExtent: 250.0,
        physics: BouncingScrollPhysics(),
        children:
        imgList.map(
              (i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  child: i,
                );
              },
            );
          },
        ).toList(),
      ),
    );
  }

}
class padpenis extends StatefulWidget {
  @override
  _padpenisState createState() => _padpenisState();
}

class _padpenisState extends State<padpenis> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Container(
            height: 215,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.green[200],
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.6),
                  offset: Offset.fromDirection(10.0, -5.0),
                  spreadRadius: 0,
                  blurRadius: 5.0,
                ),
              ],
            ),
          ),
          Positioned(top: -240, left: -20, child: hinges()),
          Positioned(
            bottom: 0,
            right: 10,
            child: Visibility(
              visible: false,
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/imgs/icon.white.png'),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 33,
            child: Container(
              height: 40,
              width: 90,
              decoration: BoxDecoration(
                color: Colors.white70,
              ),
              child: Center(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                        child: Text(
                          'MONDAY',
                          style: TextStyle(
                            fontFamily: 'Marker',
                            fontSize: 18,

                          ),
                        ),
                      ),
                      Text(
                        'Back & Biceps',
                        style: TextStyle(fontSize: 11,fontFamily: 'Marker'),
                      ),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
  hinges() {
    double spacing = 20;

    return Transform.scale(
      scale: .3,
      child: Column(
        children: <Widget>[
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
        ],
      ),
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
}
