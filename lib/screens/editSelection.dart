import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:async';

class EditSelector extends StatefulWidget {
  @override
  _EditSelectorState createState() => _EditSelectorState();
}

final List<Image> imgList = [
  Image(image: NetworkImage('https://image.shutterstock.com/image-photo/portrait-boxer-girl-boxing-ring-600w-1505458532.jpg'),),
  Image(image: NetworkImage('https://image.shutterstock.com/image-photo/fit-young-man-sportswear-focused-600w-1043370892.jpg'),),
  Image(image: NetworkImage('https://image.shutterstock.com/image-photo/closeup-partial-view-sportswoman-lifting-600w-643296271.jpg'),),
  Image(image: NetworkImage('https://image.shutterstock.com/image-photo/attractive-sports-people-working-out-600w-609102833.jpg'),),
  Image(image: NetworkImage('https://image.shutterstock.com/image-photo/vertical-shot-female-crossfit-athlete-600w-775002940.jpg'),),
];
final List<Image> imgList2 = [
  Image(image: NetworkImage('https://image.shutterstock.com/image-photo/salad-fresh-vegetables-plate-on-600w-716415874.jpg'),),
  Image(image: NetworkImage('https://image.shutterstock.com/image-photo/green-beans-fried-chicken-meatballs-600w-292880753.jpg'),),
  Image(image: NetworkImage('https://image.shutterstock.com/image-photo/golden-lasagne-meat-tomatoes-cheese-600w-150017666.jpg'),),
  Image(image: NetworkImage('https://image.shutterstock.com/image-photo/salad-fresh-vegetables-plate-on-600w-716415874.jpg'),),
  Image(image: NetworkImage('https://image.shutterstock.com/image-photo/green-beans-fried-chicken-meatballs-600w-292880753.jpg'),),
];
int playDuration = 4;

class _EditSelectorState extends State<EditSelector> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              child:
              CarouselSlider(
                autoPlay: true,
                height: 245.0,
                viewportFraction: 1.0,
                autoPlayInterval: Duration(milliseconds: 5000),
                aspectRatio: MediaQuery.of(context).size.aspectRatio,

                items: imgList.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                          ),
                          child: i
                      );
                    },
                  );
                }).toList(),
              )
            ),
            Container(
              color: Colors.black45,
                child:
                Opacity(
                  opacity: .6,
                  child: CarouselSlider(
                    autoPlayInterval: Duration(seconds: playDuration),
                    initialPage: 3,
                    autoPlay: true,
                    height: 300,
                    viewportFraction: 1.0,
                    aspectRatio: MediaQuery.of(context).size.aspectRatio,

                    items: imgList2.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                              ),
                              child: i
                          );
                        },
                      );
                    }).toList(),
                  ),
                )
            ),
          ],
        ),
        Positioned.fill(
          top: 190,
          child: Align(
            alignment: Alignment.center,
            child: Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.black87.withOpacity(.5),

              ),
              child: Center(child: Text('Meal Plan',textAlign: TextAlign.center,style: TextStyle(fontSize: 60,color: Colors.white.withOpacity(.8)),)),
            ),
          ),
        ),
      ],
    );
  }
}
