import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuildEditor extends StatefulWidget {
  @override
  _BuildEditorState createState() => _BuildEditorState();
}

class _BuildEditorState extends State<BuildEditor> {
  @override
  initState() {
    super.initState();
  }

  // variables for 'details' section
  int weightDisplay = 0;
  double bottomPaddingDetail = 2;
  String weightUnit = 'lbs';
  String equipmentQ;
  String gripQ;
  String grip2Q;
  String inclineQ;
  String bodyPartQ;
  String workoutName;
  RangeValues weightValues = RangeValues(0, 0);
  RangeLabels weightLabels = RangeLabels('0', '500');
  RangeValues setValues = RangeValues(0, 0);
  RangeLabels setLabels = RangeLabels('0', '50');
  RangeValues repValues = RangeValues(0, 0);
  RangeLabels repLabels = RangeLabels('0', '50');

  double singleRepValue = 0;
  bool checkRepBool = false;
  bool sliderRepBool = true;
  bool secondRepSliderBool = false;

  double singleSetValue = 0;
  bool checkSetBool = false;
  bool sliderSetBool = true;
  bool secondSetSliderBool = false;
  String secondSetLabel;

  double singleWeightValue = 0;
  bool checkWeightBool = false;
  bool sliderWeightBool = true;
  bool secondWeightSliderBool = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 5),
        ),
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Row(
            children: <Widget>[
              Container(
                width: 10,
              ),
              bodyPartDetail(),
              Container(
                width: 10,
              ),
              specificWorkout(),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
        Padding(
          padding: EdgeInsets.only(top: 50),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            'Additional Details\n(Leave blank for default)',
            style: TextStyle(),
            textAlign: TextAlign.center,
          ),
        ),
        otherDetails(),
        Padding(
          padding: EdgeInsets.only(top: 15),
        ),
        addComment(),
        addWeight2(),
        setsNreps(),
      ],
    );
  }

  weightSwitch() {
    return Switch(
      value: sliderWeightBool,
      onChanged: (newVal) {
        setState(
          () {
            sliderWeightBool = newVal;
            secondWeightSliderBool = !secondWeightSliderBool;
            singleWeightValue = weightValues.end;
          },
        );
      },
    );
  }

  setsSwitch() {
    return Container(
      width: MediaQuery.of(context).size.width * .15,
      child: Switch(
        value: sliderSetBool,
        onChanged: (newVal) {
          setState(
            () {
              sliderSetBool = newVal;
              secondSetSliderBool = !secondSetSliderBool;
              singleSetValue = setValues.end;
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
        value: sliderRepBool,
        onChanged: (newVal) {
          setState(
            () {
              sliderRepBool = newVal;
              secondRepSliderBool = !secondRepSliderBool;
              singleRepValue = repValues.end;
            },
          );
        },
      ),
    );
  }

  addComment() {
    return Container(
      height: 50,
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
        onChanged: null,
      ),
    );
  }

  setsNreps() {
    return Container(
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          setsWithSwitch(),
          rangeWithSwitch(),
          Container(
            height: 20,
            child: Text('${weightLabels.end}'),
          ),
        ],
      ),
    );
  }

  addWeight2() {
    return Container(
      height: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * .84,
                child: RangeSlider(
                  inactiveColor: Colors.grey,
                  activeColor: Colors.lightGreen,
                  labels: weightLabels,
                  min: 0,
                  max: 500,
                  values: weightValues,
                  divisions: 100,
                  onChanged: (value) {
                    setState(
                      () {
                        weightValues = value;
                        weightLabels = RangeLabels(
                          '${value.start.toInt()}',
                          '${value.end.toInt()}',
                        );
                      },
                    );
                  },
                ),
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
      width: MediaQuery.of(context).size.width * .55,
      child: DropdownButtonFormField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: bottomPaddingDetail),
            labelText: 'Excercise',
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
    return FittedBox(
      fit: BoxFit.fitWidth,
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
          width: 125,
          child: DropdownButtonFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: bottomPaddingDetail),
                labelText: 'Equipment',
              ),
              items: <String>[
                'Dumbells',
                'Barbell',
                'Machine',
                'Body Weight',
                'Other'
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

  gripDetail() {
    return Container(
      width: 125,
      child: DropdownButtonFormField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: bottomPaddingDetail),
            labelText: 'Grip',
          ),
          items: <String>[
            'Narrow',
            'Wide',
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
      width: 125,
      child: DropdownButtonFormField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: bottomPaddingDetail),
            labelText: 'Grip',
          ),
          items: <String>[
            'Overhand',
            'Underhand',
            'Sumo',
            'Other',
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
      width: 125,
      child: DropdownButtonFormField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: bottomPaddingDetail),
            labelText: 'Incline',
          ),
          items: <String>[
            'Slight Incline',
            'Slight Decline',
            'Large Incline',
            'Large Decline',
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
      width: 150,
      child: DropdownButtonFormField(
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

  rangeWithSwitch() {
    return Row(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * .84,
          child: Stack(
            children: <Widget>[
              Visibility(
                visible: sliderRepBool,
                child: RangeSlider(
                  inactiveColor: Colors.grey[400],
                  activeColor: Colors.lightGreen,
                  labels: repLabels,
                  min: 0,
                  max: 50,
                  values: repValues,
                  divisions: 100,
                  onChanged: (value) {
                    setState(
                      () {
                        repValues = RangeValues(value.start, value.end);
                        repLabels = RangeLabels(
                            '${value.start.toInt()}', '${value.end.toInt()}');
                      },
                    );
                  },
                ),
              ),
              Visibility(
                visible: secondRepSliderBool,
                child: Slider(
                  value: singleRepValue,
                  inactiveColor: Colors.grey[400],
                  activeColor: Colors.lightGreen,
                  min: 0,
                  max: 50,
                  divisions: 100,
                  onChanged: (value) {
                    setState(
                      () {
                        singleRepValue = value;
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        repsSwitch(),
      ],
    );
  }

  setsWithSwitch() {
    return Row(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Visibility(
              visible: sliderSetBool,
              child: Container(
                width: MediaQuery.of(context).size.width * .84,
                child: RangeSlider(
                  inactiveColor: Colors.grey[400],
                  activeColor: Colors.lightGreen,
                  labels: setLabels,
                  min: 0,
                  max: 50,
                  values: setValues,
                  divisions: 100,
                  onChanged: (value) {
                    setState(
                      () {
                        setValues = value;
                        setLabels = RangeLabels(
                            '${value.start.toInt()}', '${value.end.toInt()}');
                      },
                    );
                  },
                ),
              ),
            ),
            Visibility(
              visible: secondSetSliderBool,
              child: Container(
                width: MediaQuery.of(context).size.width * .84,
                child: Slider(
                  label: secondSetLabel,
                  value: singleSetValue,
                  inactiveColor: Colors.grey[400],
                  activeColor: Colors.lightGreen,
                  min: 0,
                  max: 50,
                  divisions: 100,
                  onChanged: (value) {
                    setState(
                      () {
                        singleSetValue = value;
                        secondSetLabel = ('${value.toInt()}');
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        setsSwitch(),
      ],
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
            width: MediaQuery.of(context).size.width * .84,
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
