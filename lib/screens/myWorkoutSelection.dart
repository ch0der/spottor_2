
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:spottor_2/screens/pad.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:spottor_2/widgets/primaryPad.dart';
import 'package:random_color/random_color.dart';

class MyWorkoutPage extends StatefulWidget {


  @override
  _MyWorkoutPageState createState() => _MyWorkoutPageState();
}
RandomColor _randomColor = RandomColor();

class _MyWorkoutPageState extends State<MyWorkoutPage> {
  final List imgList = [
    'assets/imgs/stockphotos/workout1.jpg',
    'assets/imgs/stockphotos/workout2.jpg',
    'assets/imgs/stockphotos/workout3.jpg'
  ];


  final List bookList = [
    WorkoutPad(
      day: 'monday',
      description: 'Back & Biceps',
      color: _randomColor.randomColor(colorSaturation: ColorSaturation.mediumSaturation,colorBrightness: ColorBrightness.light)
    ),
    WorkoutPad(
      day: 'monday',
      description: 'Back & Biceps',
      color: _randomColor.randomColor(colorSaturation: ColorSaturation.mediumSaturation,colorBrightness: ColorBrightness.light)
    ),
    WorkoutPad(
      day: 'monday',
      description: 'Back & Biceps',
      color: _randomColor.randomColor(colorSaturation: ColorSaturation.mediumSaturation,colorBrightness: ColorBrightness.light)
    ),
    WorkoutPad(
      day: 'monday',
      description: 'Back & Biceps',
      color: _randomColor.randomColor(colorSaturation: ColorSaturation.mediumSaturation,colorBrightness: ColorBrightness.light)
    ),
    WorkoutPad(
      day: 'mday',
      description: 'Back & Biceps',
      color: _randomColor.randomColor(colorSaturation: ColorSaturation.mediumSaturation,colorBrightness: ColorBrightness.light)
    ),
  ];
  String dayOfWeekQ;
  String bodyPartQ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          child: searchFilter(),
        ),
        Container(height: 35,width: MediaQuery.of(context).size.width,child: Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text('Workouts',textAlign: TextAlign.left,style: TextStyle(fontSize: 30,fontFamily: 'Coiny'),),
        ),),
        Padding(padding: EdgeInsets.only(top: 10),child: swiperText(),),
        Container(
          height: 10,
        ),
      ],
    );
  }
  swiperText(){
    return Container(
      height: 250,
      child: ListView.separated(
        separatorBuilder: (context,index) => Container(width: 20,),
        itemCount: bookList.length,
        itemBuilder: (BuildContext context, int index){
          final item = bookList[index];
          return Container(child: item,);
        },


        scrollDirection: Axis.horizontal,

      ),
    );
  }

  searchFilter() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: Row(
        children: <Widget>[
          Container(
            width: 90,
            child: Text(
              'FILTER BY',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
          ),
          Flexible(
            child: Container(
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
          ),
          Container(
            width: 20,
          ),
          Flexible(fit: FlexFit.tight, child: bodyPartDetail()),
        ],
      ),
    );
  }


  bodyPartDetail() {
    return DropdownButtonFormField(
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
              child: Text(
                value,
                style: TextStyle(),
              ),
              value: value,
            );
          },
        ).toList(),
        onChanged: (value) {
          setState(() {
            bodyPartQ = value;
          });
        },
        value: bodyPartQ);
  }

  changeViewText() {
    return Container(
      child: Text(
        'View All',
        style: TextStyle(fontSize: 15),
        textAlign: TextAlign.center,
      ),
    );
  }
}