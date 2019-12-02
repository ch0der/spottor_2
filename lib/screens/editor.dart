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
  RangeValues values = RangeValues(0,0);
  RangeLabels labels = RangeLabels('0', '500');
  RangeValues setValues = RangeValues(0,0);
  RangeLabels setLabels = RangeLabels('0', '50');
  RangeValues repValues = RangeValues(0,0);
  RangeLabels repLabels = RangeLabels('0', '50');
  bool checkBool = false;

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

  addComment() {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width * .9,
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
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width*.9,
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
                    setLabels = RangeLabels('${value.start.toInt()}','${value.end.toInt()}');
                  },
                );
              },
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width*.9,
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
                    repValues = RangeValues(value.start,value.end);
                    repLabels = RangeLabels('${value.start.toInt()}','${value.end.toInt()}');
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
  addWeight2() {
    return Container(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width*.9,
            child: RangeSlider(
              inactiveColor: Colors.grey,
              activeColor: Colors.lightGreen,
              labels: labels,
              min: 0,
              max: 500,
              values: values,
              divisions: 100,
              onChanged: (value) {
                setState(
                      () {
                    values = value;
                    labels = RangeLabels(value.start.toString(),value.end.toString(),);
                  },
                );
              },
            ),
          ),
          Container(
            child: Text('Weight Range',style: TextStyle(color: Colors.grey[500],),),
          ),
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
