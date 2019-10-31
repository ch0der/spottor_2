import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:async';

class EditSelector extends StatefulWidget {
  @override
  _EditSelectorState createState() => _EditSelectorState();
}

final List<Image> imgList = [
  Image(image: AssetImage('assets/imgs/stockphotos/workout1.jpg'),),
  Image(image: AssetImage('assets/imgs/stockphotos/workout2.jpg'),),
  Image(image: AssetImage('assets/imgs/stockphotos/workout3.jpg'),),
  Image(image: AssetImage('assets/imgs/stockphotos/workout1.jpg'),),
  Image(image: AssetImage('assets/imgs/stockphotos/workout2.jpg'),),
];
final List<Widget> imgList2 = [
  Image(image: AssetImage('assets/imgs/stockphotos/food1.jpg'),),
  Image(image: AssetImage('assets/imgs/stockphotos/food2.jpg'),),
  Image(image: AssetImage('assets/imgs/stockphotos/food3.jpg'),),
  Image(image: AssetImage('assets/imgs/stockphotos/food1.jpg'),),
  Image(image: AssetImage('assets/imgs/stockphotos/food2.jpg'),),

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
                  child: CarouselSlider(
                autoPlay: true,
                viewportFraction: 1.0,
                autoPlayInterval: Duration(milliseconds: 5000),
                aspectRatio: MediaQuery.of(context).size.aspectRatio,
                height: 700,
                items: imgList.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        child: Transform.scale(
                          scale: 1.15,
                          child: i,
                        ),
                      );
                    },
                  );
                }).toList(),
              )),
              Expanded(
                  child: Opacity(opacity: .6,
                    child: CarouselSlider(
                autoPlay: true,
                viewportFraction: 1.0,
                initialPage: 3,
                autoPlayInterval: Duration(seconds: playDuration),
                aspectRatio: MediaQuery.of(context).size.aspectRatio,
                height: 700,
                items: imgList2.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Transform.scale(
                            scale: 1.15,
                            child: i,
                          ),
                        );
                      },
                    );
                }).toList(),
              ),
                  )),
            ],
          ),
          Positioned.fill(
            top: 250,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.black87.withOpacity(.5),
                ),
                child: Center(
                    child: Text(
                  'Meal Plan',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 60, color: Colors.white.withOpacity(.8)),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
