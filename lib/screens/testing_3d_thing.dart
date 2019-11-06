import 'dart:ui' as prefix0;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spottor_2/screens/pad.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class S02E02 extends StatefulWidget {
  @override
  _S02E02State createState() => _S02E02State();
}

class _S02E02State extends State<S02E02> {
  final List imgList = [
    'assets/imgs/stockphotos/workout1.jpg',
    'assets/imgs/stockphotos/workout2.jpg',
    'assets/imgs/stockphotos/workout3.jpg'
  ];

  final List bookList = [
    padpenis(
      day: 'monday',
    ),
    padpenis(
      day: 'teus',
    ),
  ];
  String dayOfWeekQ;
  String bodyPartQ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        searchFilter(),
        Container(
          height: 150,
        ),
        swiperText(),
      ],
    );
  }

  searchFilter() {
    return Row(
      children: <Widget>[
        Container(
          width: 100,
          child: Text(
            'FILTER BY',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15),
          ),
        ),
        Container(
          width: 125,
          child: DropdownButtonFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 2),
                labelText: 'Day',
              ),
              items: <String>[
                'Sunday',
                'Monday',
                'Tuesday',
                'Wednesday',
                'Thursday',
                'Friday',
                'Saturday'
              ].map<DropdownMenuItem<String>>(
                (String value) {
                  return DropdownMenuItem(
                    child: Text(value),
                    value: value,
                  );
                },
              ).toList(),
              onChanged: (value) {
                setState(() {
                  dayOfWeekQ = value;
                });
              },
              value: dayOfWeekQ),
        ),
        Container(
          width: 20,
        ),
        bodyPartDetail(),
      ],
    );
  }
  swiperText(){
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        final item = bookList[index];
        return (Container(
          child: item,
        ));
      },
      itemCount: bookList.length,
      itemWidth: 150,
      itemHeight: 230,
      layout: SwiperLayout.STACK,
    );
  }
  bodyPartDetail() {
    return Container(
      width: 150,
      child: DropdownButtonFormField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 2),
            labelText: 'Body Part',
          ),
          items: <String>[
            'Abdominal/Core',
            'Back',
            'Biceps',
            'Calves',
            'Chest',
            'Forearms',
            'Glutes',
            'Hamstrings',
            'Lats',
            'Quads',
            'Shoulders/Delts',
            'Traps',
            'Triceps',
          ].map<DropdownMenuItem<String>>(
                (String value) {
              return DropdownMenuItem(
                child: Text(value),
                value: value,
              );
            },
          ).toList(),
          onChanged: (value) {
            setState(() {
              bodyPartQ = value;
            });
          },
          value: bodyPartQ),
    );
  }
}

class padpenis extends StatelessWidget {
  padpenis({Key key, this.day}) : super(key: key);

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
    return (Container);
  }

  testCont(Color color) {
    return (Container(
      width: 150,
      height: 150,
      color: color,
    ));
  }
}
