import 'package:flutter/material.dart';
import 'package:spottor_2/screens/pad.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class S02E02 extends StatelessWidget {

  final List imgList = [
    'assets/imgs/stockphotos/workout1.jpg',
    'assets/imgs/stockphotos/workout2.jpg',
    'assets/imgs/stockphotos/workout3.jpg'
  ];
  final List bookList = [
   padpenis(day: 'monday',),
    padpenis(day: 'teus',),
  ];

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        final item = bookList[index];
        return(Container(child: item,));
      },
      itemCount: bookList.length,
      itemWidth: 150,
      itemHeight: 150,
      layout: SwiperLayout.STACK,
    );
  }
}

class padpenis extends StatelessWidget{
  padpenis({Key key,this.day}) :super(key: key);

  final String day;

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
                      day,
                      style: TextStyle(
                        fontFamily: 'Marker',
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Text(
                    'Back & Biceps',
                    style: TextStyle(fontSize: 11, fontFamily: 'Marker'),
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
    return (Container);  }
  testCont(Color color){
    return(Container(
      width: 150,
      height: 150,
      color: color,
    ));
  }
}
