import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';
import 'package:spottor_2/widgets/background_pad.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:spottor_2/resources/blocs/workoutBloc.dart';
import 'package:spottor_2/newWorkoutModel.dart';
import 'dart:async';

class BuildEditor extends StatefulWidget {
  @override
  _BuildEditorState createState() => _BuildEditorState();
}

class _BuildEditorState extends State<BuildEditor> {




  @override

  // variables for 'details' section
  int weightDisplay = 0;
  double bottomPaddingDetail = 2;
  String weightUnit = 'lbs';
  String equipmentQ;
  String positionQ;
  String gripQ;
  String grip2Q;
  String inclineQ;
  String bodyPartQ;
  String workoutName;
  String commentText;
  String nicknameText = 'Description';
  RangeValues weightValues = RangeValues(0, 0);
  RangeLabels weightLabels = RangeLabels('0', '500');
  RangeValues setValues = RangeValues(0, 0);
  RangeLabels setLabels = RangeLabels('0', '50');
  RangeValues repValues = RangeValues(0, 0);
  RangeLabels repLabels = RangeLabels('0', '50');
  ScrollPhysics scroll;

  double singleRepValue = 0;
  bool checkRepBool = false;
  bool sliderRepBool = true;
  bool secondRepSliderBool = false;
  String secondRepLabel;

  double singleSetValue = 0;
  bool checkSetBool = false;
  bool sliderSetBool = true;
  bool secondSetSliderBool = false;
  String secondSetLabel;
  String wtUnit = 'lbs';

  double singleWeightValue = 0;
  bool checkWeightBool = false;
  bool sliderWeightBool = true;
  bool secondWeightSliderBool = false;
  String secondWeightLabel;
  String emptyLabel = '-';
  int emptyLabelInt = 0;

  final double sliderWidth = .72;
  String previewFont = 'PT';
  final Color switchColor = Colors.green;

  Exercise exerciseTest;

  final bloc = ExerciseBloc2();



  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 5)),
          workoutNickname(),
          Padding(
            padding: EdgeInsets.only(top: 15),
          ),
          Row(
            children: <Widget>[
              Container(
                width: 10,
              ),
              bodyPartDetail(),
              Container(
                width: 10,
              ),
              specificWorkout(),
              Container(
                width: 10,
              ),
              equipmentDetail2(),
            ],
          ),
          otherDetails(),
          Padding(
            padding: EdgeInsets.only(bottom: 5),
          ),
          Container(
            padding: EdgeInsets.only(right: 8),
            height: 15,
            alignment: Alignment.bottomRight,
            child: Text('Range'),
          ),
          addWeight2(),
          setsNreps(),
          addComment(),
          Container(
            height: 30,
          ),
          workoutPreview(),
          submitIcon(),

        ],
      ),
    );
  }



  submitIcon(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(

          iconSize:60,
          icon: Icon(Icons.clear),
          onPressed: (){},
        ),
        IconButton(

          iconSize:60,
          icon: Icon(Icons.save),
          onPressed: ()async{

            submitHelper();

            Exercise rnd = Exercise(bodyPart: bodyPartQ,nickname: nicknameText,weight: weightValues.start.toInt(),exercise: workoutName,equipment: equipmentQ,position: positionQ,grip: gripQ,incline: inclineQ,
                note: commentText,weight2: weightValues.end.toInt(),sets2: 20,sets:0,lbs: true,reps2: repValues.end.toInt(),reps: repValues.start.toInt(),);
            bloc.add(rnd);

            print('working');


          },
        ),
      ],
    );
  }
  submitHelper(){
    if(bodyPartQ == null){setState(() {
      bodyPartQ = emptyLabel;
    });} else{}

    if(nicknameText == null){setState(() {
      nicknameText = emptyLabel;
    });} else{}

    if(workoutName == null){setState(() {
      workoutName = emptyLabel;
    });} else{}

    if(equipmentQ == null){setState(() {
      equipmentQ = emptyLabel;
    });} else{}

    if(positionQ == null){setState(() {
      positionQ = emptyLabel;
    });} else{}

    if(gripQ == null){setState(() {
      gripQ = emptyLabel;
    });} else{}

    if(inclineQ == null){setState(() {
      inclineQ = emptyLabel;
    });} else{}

    if( commentText == null){setState(() {
      commentText = emptyLabel;
    });} else{}



  }

  liftImg() {
    return Container(
      height: 200,
      child: Image(
        image: AssetImage('assets/imgs/liftimg1.png'),
      ),
    );
  }

  refresh(value) {
    setState(
      () {
        weightValues = RangeValues(value.start, value.end);
        weightLabels =
            RangeLabels('${value.start.toInt()}', '${value.end.toInt()}');
      },
    );
  }

  weightSwitch() {
    return Container(
      width: MediaQuery.of(context).size.width * .15,
      child: Switch(
        activeColor: switchColor,
        value: sliderWeightBool,
        onChanged: (newVal) {
          if (singleWeightValue != weightValues.end) {
            setState(() {
              singleWeightValue = weightValues.end;
            });
          }
          setState(
            () {
              sliderWeightBool = newVal;
              secondWeightSliderBool = !secondWeightSliderBool;
            },
          );
        },
      ),
    );
  }

  setsSwitch() {
    return Container(
      width: MediaQuery.of(context).size.width * .15,
      child: Switch(
        activeColor: switchColor,
        value: sliderSetBool,
        onChanged: (newVal) {
          if (singleSetValue != setValues.end) {
            setState(() {
              singleSetValue = setValues.end;
            });
          }
          setState(
            () {
              sliderSetBool = newVal;
              secondSetSliderBool = !secondSetSliderBool;
            },
          );
        },
      ),
    );
  }

  repsSwitch() {
    return Container(
      width: MediaQuery.of(context).size.width * .15,
      child: Switch(
        activeColor: switchColor,
        value: sliderRepBool,
        onChanged: (newVal) {
          if (singleRepValue != repValues.end) {
            setState(() {
              singleRepValue = repValues.end;
            });
          }
          setState(
            () {
              sliderRepBool = newVal;
              secondRepSliderBool = !secondRepSliderBool;
            },
          );
        },
      ),
    );
  }

  workoutNickname() {

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width*.75,
            height: 35,
            child: (nicknameText != null ? TextField(
                decoration: InputDecoration(
                  hintText: 'Enter a nickname',
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                ),
                maxLines: 1,
                textAlign: TextAlign.center,
                onChanged: (text) {
                  setState(() {
                    nicknameText = text;
                  });
                }) : Container()),
          ),
        ],
      ),
    );
  }

  addComment() {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width * .85,
      child: TextField(
          decoration: InputDecoration(
            hintText: 'Additional Comments',
            hintStyle: TextStyle(
              color: Colors.grey[400],
            ),
          ),
          maxLines: 3,
          textAlign: TextAlign.center,
          onChanged: (text) {
            setState(() {
              commentText = text;
            });
          }),
    );
  }

  setsNreps() {
    return Container(
      height: 105,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          setsWithSwitch(),
          repsWithSwitch(),
        ],
      ),
    );
  }

  addWeight2() {
    return Container(
      height: 50,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                child: Text(
                  'Weight',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Slid(
                sliderBool: sliderWeightBool,
                values: weightValues,
                labels: weightLabels,
                secondLabel: secondWeightLabel,
                secondValue: singleWeightValue,
                secondSliderbool: secondWeightSliderBool,
                max: 500,
                notifParent: (value) {
                  setState(
                    () {
                      weightValues = RangeValues(value.start, value.end);
                      weightLabels = RangeLabels(
                          '${value.start.toInt()}', '${value.end.toInt()}');
                    },
                  );
                },
                notifParent2: (value) {
                  setState(
                    () {
                      weightValues = RangeValues(0, value);
                      singleWeightValue = value;
                      secondWeightLabel = ('${value.toInt()}');
                    },
                  );
                },
              ),
              weightSwitch(),
            ],
          ),
          /*Container(
            child: Text(
              'Weight Range',
              style: TextStyle(
                color: Colors.grey[500],
              ),
            ),
          ),*/
        ],
      ),
    );
  }

  specificWorkout() {
    return Container(
      width: detailWidth(context),
      child: DropdownButtonFormField(
          isExpanded: true,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: bottomPaddingDetail),
            labelText: 'Excercise',
          ),
          items: <String>[
            'Deadlift',
            'Back',
            'Biceps',
            'Calves',
            'Chest',
            'Forearms',
            'Glutes',
            'Hamstrings',
            'Lats',
            'Quads',
            'Shoulders',
            'Delts',
            'Traps',
            'Triceps',
            emptyLabel,
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
              workoutName = value;
            });
          },
          value: workoutName),
    );
  }

  checkBoxItems() {
    return Container(
      child: Row(
        children: <Widget>[],
      ),
    );
  }

  otherDetails() {
    return Container(
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10),
          ),
          equipmentDetail(),
          Padding(
            padding: EdgeInsets.only(left: 10),
          ),
          gripDetail(),
          Padding(
            padding: EdgeInsets.only(left: 10),
          ),
          inclineDetail(),
        ],
      ),
    );
  }

  Widget weightEdit() {
    return Column(
      children: <Widget>[
        displayWeightNum(),
        Transform.scale(
          scale: .7,
          child: addWeight(),
        ),
      ],
    );
  }

  displayWeightNum() {
    return Container(
      height: 50,
      width: 100,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 10),
            ),
            Text(
              weightDisplay.toString(),
              style: TextStyle(fontSize: 40),
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 25),
                ),
                SizedBox(
                  height: 15,
                  child: Text(
                    weightUnit,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  addWeight() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 40,
          width: 60,
          child: Center(
            child: RaisedButton(
              color: Color.fromRGBO(130, 227, 135, 1),
              shape: CircleBorder(
                side: BorderSide(style: BorderStyle.none),
              ),
              onPressed: () {
                setState(() {
                  weightDisplay = weightDisplay - 5;
                });
              },
              child: Center(
                child: Container(
                  color: Colors.white70,
                  height: 3,
                  width: 15,
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 40,
          width: 60,
          child: Center(
            child: RaisedButton(
              color: Color.fromRGBO(130, 227, 135, 1),
              shape: CircleBorder(
                side: BorderSide(style: BorderStyle.none),
              ),
              onPressed: () {
                setState(() {
                  weightDisplay = weightDisplay + 5;
                });
              },
              child: Center(
                child: Text(
                  '+',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                      color: Colors.white70),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  equipmentDetail() {
    return Column(
      children: <Widget>[
        Container(
          width: detailWidth(context),
          child: DropdownButtonFormField(
              isExpanded: true,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: bottomPaddingDetail),
                labelText: 'Position',
              ),
              items: <String>[
                'Bench',
                'Standing',
                'Sitting',
                'Laying Down',
                'Other',
                emptyLabel,
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
                  positionQ = value;
                });
              },
              value: positionQ),
        ),
      ],
    );
  }

  equipmentDetail2() {
    return Column(
      children: <Widget>[
        Container(
          width: detailWidth(context),
          child: DropdownButtonFormField(
              isExpanded: true,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: bottomPaddingDetail),
                labelText: 'Equipment',
              ),
              items: <String>[
                'Dumbells',
                'Barbell',
                'Machine',
                'Body Weight',
                'Other',
                emptyLabel,
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
                  equipmentQ = value;
                });
              },
              value: equipmentQ),
        ),
      ],
    );
  }

  dropDownDetails() {
    return Container(
      child: Column(
        children: <Widget>[
          equipmentQ != null
              ? Text(equipmentQ)
              : Container(
                  child: Text(''),
                ),
          positionQ != null
              ? Text(positionQ)
              : Container(
                  child: Text(''),
                ),
          gripQ != null
              ? Text('$gripQ')
              : Container(
                  child: Text(''),
                ),
        ],
      ),
    );
  }

  gripDetail() {
    return Container(
      width: detailWidth(context),
      child: DropdownButtonFormField(
          isExpanded: true,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: bottomPaddingDetail),
            labelText: 'Grip',
          ),
          items: <String>[
            'Narrow',
            'Wide',
            emptyLabel,
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
              gripQ = value;
            });
          },
          value: gripQ),
    );
  }

  grip2Detail() {
    return Container(
      width: detailWidth(context),
      child: DropdownButtonFormField(
          isExpanded: true,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: bottomPaddingDetail),
            labelText: 'Grip',
          ),
          items: <String>[
            'Overhand',
            'Underhand',
            'Sumo',
            'Other',
            emptyLabel,
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
              grip2Q = value;
            });
          },
          value: grip2Q),
    );
  }

  inclineDetail() {
    return Container(
      width: detailWidth(context),
      child: DropdownButtonFormField(
          isExpanded: true,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: bottomPaddingDetail),
            labelText: 'Incline',
          ),
          items: <String>[
            'Slight Incline',
            'Slight Decline',
            'Large Incline',
            'Large Decline',
            emptyLabel,
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
              inclineQ = value;
            });
          },
          value: inclineQ),
    );
  }

  bodyPartDetail() {
    return Container(
      width: detailWidth(context),
      child: DropdownButtonFormField(
          isExpanded: true,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: bottomPaddingDetail),
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
            emptyLabel,
          ].map<DropdownMenuItem<String>>(
            (String value) {
              return DropdownMenuItem(
                child: AutoSizeText(
                  value,
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
          value: bodyPartQ),
    );
  }

  setsWithSwitch() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          child: Text(
            'Sets',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Slid(
          sliderBool: sliderSetBool,
          values: setValues,
          labels: setLabels,
          secondLabel: secondSetLabel,
          secondValue: singleSetValue,
          max: 50,
          secondSliderbool: secondSetSliderBool,
          notifParent: (value) {
            setState(
              () {
                setValues = RangeValues(value.start, value.end);
                setLabels = RangeLabels(
                    '${value.start.toInt()}', '${value.end.toInt()}');
              },
            );
          },
          notifParent2: (value) {
            setState(
              () {
                setValues = RangeValues(0, value);
                singleSetValue = value;
                secondSetLabel = ('${value.toInt()}');
              },
            );
          },
        ),
        setsSwitch(),
      ],
    );
  }

  repsWithSwitch() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          child: Text(
            'Reps',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Slid(
          sliderBool: sliderRepBool,
          values: repValues,
          labels: repLabels,
          secondLabel: secondRepLabel,
          secondValue: singleRepValue,
          max: 50,
          secondSliderbool: secondRepSliderBool,
          notifParent: (value) {
            setState(
              () {
                repValues = RangeValues(value.start, value.end);
                repLabels = RangeLabels(
                    '${value.start.toInt()}', '${value.end.toInt()}');
              },
            );
          },
          notifParent2: (value) {
            setState(
              () {
                repValues = RangeValues(0, value);
                singleRepValue = value;
                secondRepLabel = ('${value.toInt()}');
              },
            );
          },
        ),
        repsSwitch(),
      ],
    );
  }

  workoutPreview() {
    String name = 'test';
    String description = 'Excercise';
    String sets = '-';
    String reps = '-';
    if (sliderWeightBool == true) {
      setState(() {
        name =
            '${weightValues.start.toInt()}' '-' '${weightValues.end.toInt()}';
      });
    } else if (sliderWeightBool == false) {
      setState(() {
        name = '${singleWeightValue.toInt()}';
      });
    }
    if (workoutName == null) {
      setState(() {
        description = 'Exercise';
      });
    } else {
      setState(() {
        description = workoutName;
      });
    }
    if (sliderSetBool == true) {
      setState(() {
        sets = '${setValues.start.toInt()}' '-' '${setValues.end.toInt()}';
      });
    } else if (sliderSetBool == false) {
      setState(() {
        sets = '${singleSetValue.toInt()}';
      });
    }
    if (sliderRepBool == true) {
      setState(() {
        reps = '${repValues.start.toInt()}' '-' '${repValues.end.toInt()}';
      });
    } else if (sliderRepBool == false) {
      setState(() {
        reps = '${singleRepValue.toInt()}';
      });
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 120,
                child: AutoSizeText(
                  nicknameText,
                  style: TextStyle(fontFamily: previewFont, fontSize: 25),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                description,
                style: TextStyle(fontFamily: previewFont, fontSize: 20),
              ),
              dropDownDetails(),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 30),
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: 65,
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Sets',
                          style:
                              TextStyle(fontFamily: previewFont, fontSize: 25),
                        ),
                        Text(
                          sets,
                          style:
                              TextStyle(fontFamily: previewFont, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 65,
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Reps',
                          style:
                              TextStyle(fontFamily: previewFont, fontSize: 25),
                        ),
                        Text(
                          reps,
                          style:
                              TextStyle(fontFamily: previewFont, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 90,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              'Wt',
                              style:
                                  TextStyle(fontFamily: previewFont, fontSize: 25),
                            ),
                            Text(wtUnit,style: TextStyle(fontSize: 14),),
                          ],
                        ),
                        Text(
                          name,
                          style:
                              TextStyle(fontFamily: previewFont, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: 50,
                width: 220,
                child: (commentText != null ? Text(commentText) : Container()),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double detailWidth(
    BuildContext context,
  ) {
    return (screenSize(context).width * .3);
  }

  slider1(
    bool sliderBool,
    RangeLabels labels,
    RangeValues values,
    bool secondSlider,
    String secondLabel,
    double secondValue,
  ) {
    return Container(
      width: MediaQuery.of(context).size.width * sliderWidth,
      child: Stack(
        children: <Widget>[
          Visibility(
            visible: sliderBool,
            child: RangeSlider(
              inactiveColor: Colors.grey[400],
              activeColor: Colors.lightGreen,
              labels: labels,
              min: 0,
              max: 500,
              values: values,
              divisions: 100,
              onChanged: (value) {
                setState(
                  () {
                    values = RangeValues(value.start, value.end);
                    labels = RangeLabels(
                        '${value.start.toInt()}', '${value.end.toInt()}');
                  },
                );
              },
            ),
          ),
          Visibility(
            visible: secondSlider,
            child: Container(
              width: MediaQuery.of(context).size.width * sliderWidth,
              child: Slider(
                label: secondLabel,
                value: secondValue,
                inactiveColor: Colors.grey[400],
                activeColor: Colors.lightGreen,
                min: 0,
                max: 50,
                divisions: 100,
                onChanged: (value) {
                  setState(
                    () {
                      secondValue = value;
                      secondLabel = ('${value.toInt()}');
                    },
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Slid extends StatefulWidget {
  Slid(
      {Key key,
      @required this.sliderBool,
      @required this.values,
      @required this.notifParent,
      @required this.notifParent2,
      @required this.secondLabel,
      @required this.secondValue,
      @required this.secondSliderbool,
      @required this.max,
      @required this.labels});

  final bool sliderBool;
  final RangeValues values;
  final Function(RangeValues) notifParent;
  final Function(double) notifParent2;
  final RangeLabels labels;
  final bool secondSliderbool;
  final String secondLabel;
  final double secondValue;
  final double max;
  @override
  _SlidState createState() => _SlidState();
}

class _SlidState extends State<Slid> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .72,
      child: Stack(
        children: <Widget>[
          Visibility(
            visible: widget.sliderBool,
            child: RangeSlider(
              inactiveColor: Colors.grey[400],
              activeColor: Colors.lightGreen,
              labels: widget.labels,
              min: 0,
              max: widget.max,
              values: widget.values,
              divisions: 100,
              onChanged: (value) {
                widget.notifParent(value);
              },
            ),
          ),
          Visibility(
            visible: widget.secondSliderbool,
            child: Container(
              width: MediaQuery.of(context).size.width * .72,
              child: Slider(
                label: widget.secondLabel,
                value: widget.secondValue,
                inactiveColor: Colors.grey[400],
                activeColor: Colors.lightGreen,
                min: 0,
                max: widget.max,
                divisions: 100,
                onChanged: (value) {
                  widget.notifParent2(value);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DetailsItem extends StatefulWidget {
  DetailsItem(
      {Key key, this.items, @required this.rList, this.label, this.hint})
      : super(key: key);

  final List<DropdownMenuItem> items;
  final List<String> rList;
  final String label;
  final String hint;

  @override
  _DetailsItemState createState() => _DetailsItemState();
}

class _DetailsItemState extends State<DetailsItem> {
  @override
  initState() {
    super.initState();
  }

  String value1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125,
      child: DropdownButtonFormField(
        isExpanded: true,
        decoration: InputDecoration(
          labelText: widget.label,
          hintText: widget.hint,
        ),
        items: widget.rList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem(
            child: Text(value),
            value: value,
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            value1 = value;
          });
        },
        value: value1,
      ),
    );
  }
}

class _CheckBoxItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Checkbox(value: null, onChanged: null),
          Container(
            width: 150,
            child: TextField(),
          ),
        ],
      ),
    );
  }
}

class SliderWithSwitcher extends StatefulWidget {
  SliderWithSwitcher(
      {Key key,
      this.rangeValues,
      this.rangeLabels,
      this.sliderBool1,
      this.sliderBool2,
      this.singleValue,
      this.startValue,
      this.endValue,
      this.startLabel,
      this.endLabel})
      : super(key: key);

  final RangeValues rangeValues;
  final RangeLabels rangeLabels;
  final bool sliderBool1;
  final bool sliderBool2;
  final double singleValue;
  final double startValue;
  final double endValue;
  final String startLabel;
  final String endLabel;

  @override
  _SliderWithSwitcherState createState() => _SliderWithSwitcherState();
}

class _SliderWithSwitcherState extends State<SliderWithSwitcher> {
  Widget sliderTest() {
    RangeValues rangeValues = RangeValues(widget.startValue, widget.endValue);
    RangeLabels rangeLabels = RangeLabels(widget.startLabel, widget.endLabel);

    return RangeSlider(
      inactiveColor: Colors.grey[400],
      activeColor: Colors.lightGreen,
      labels: rangeLabels,
      min: widget.startValue,
      max: widget.endValue,
      values: rangeValues,
      divisions: 100,
      onChanged: (value) {
        setState(
          () {
            rangeValues = value;
            rangeLabels =
                RangeLabels('${value.start.toInt()}', '${value.end.toInt()}');
          },
        );
      },
    );
  }

  Widget slider2() {
    double repValue = widget.singleValue;

    return Slider(
      value: repValue,
      inactiveColor: Colors.grey[400],
      activeColor: Colors.lightGreen,
      min: widget.startValue,
      max: widget.endValue,
      divisions: 100,
      onChanged: (value) {
        setState(
          () {
            repValue = value;
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * .72,
            child: Stack(
              children: <Widget>[
                Visibility(
                  visible: widget.sliderBool1,
                  child: sliderTest(),
                ),
                Visibility(
                  visible: widget.sliderBool2,
                  child: slider2(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
