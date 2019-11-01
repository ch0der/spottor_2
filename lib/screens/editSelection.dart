import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:async';

class EditSelector extends StatefulWidget {
  @override
  _EditSelectorState createState() => _EditSelectorState();
}

final List<Image> imgList = [
  Image(
    image: AssetImage('assets/imgs/stockphotos/workout1.jpg'),
    fit: BoxFit.fill,
  ),
  Image(
    image: AssetImage('assets/imgs/stockphotos/workout2.jpg'),
    fit: BoxFit.fill,
  ),
  Image(
    image: AssetImage('assets/imgs/stockphotos/workout3.jpg'),
    fit: BoxFit.fill,
  ),
  Image(
    image: AssetImage('assets/imgs/stockphotos/workout1.jpg'),
    fit: BoxFit.fill,
  ),
  Image(
    image: AssetImage('assets/imgs/stockphotos/workout2.jpg'),
    fit: BoxFit.fill,
  ),
];
final List<Widget> imgList2 = [
  Image(
    image: AssetImage('assets/imgs/stockphotos/food1.jpg'),
    fit: BoxFit.fill,
  ),
  Image(
    image: AssetImage('assets/imgs/stockphotos/food2.jpg'),
    fit: BoxFit.fill,
  ),
  Image(
    image: AssetImage('assets/imgs/stockphotos/food3.jpg'),
    fit: BoxFit.fill,
  ),
  Image(
    image: AssetImage('assets/imgs/stockphotos/food1.jpg'),
    fit: BoxFit.fill,
  ),
  Image(
    image: AssetImage('assets/imgs/stockphotos/food2.jpg'),
    fit: BoxFit.fill,
  ),
];
int playDuration = 4;

class _EditSelectorState extends State<EditSelector> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  children: <Widget>[
                    CarouselSlider(
                      autoPlay: true,
                      viewportFraction: 1.0,
                      height: 1000,
                      autoPlayInterval: Duration(milliseconds: 5000),
                      aspectRatio: MediaQuery.of(context).size.aspectRatio,
                      items: imgList.map(
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
                    selectionText('Workouts'),
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  children: <Widget>[
                    Opacity(
                      opacity: .6,
                      child: CarouselSlider(
                        autoPlay: true,
                        viewportFraction: 1.0,
                        initialPage: 3,
                        autoPlayInterval: Duration(seconds: playDuration),
                        height: 1000,
                        items: imgList2.map(
                          (i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: i,
                                );
                              },
                            );
                          },
                        ).toList(),
                      ),
                    ),
                    selectionText('Meal Plan'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  selectionText(String text){
    return Align(
      alignment: Alignment.center,
      child: Material(
        color: Colors.black87.withOpacity(.4),
        child: RaisedButton(
          splashColor: Colors.green.withOpacity(.25),
          onPressed: (){
          },
          color: Colors.black87.withOpacity(.25),
          child: Container(
            height: 80,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
            ),
            child: Center(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 60, color: Colors.white.withOpacity(.9)),
                )),
          ),
        ),
      ),
    );
  }
}
