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

  int weightDisplay = 0;
  String weightUnit = 'lbs';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 100),
        ),
        weightEdit(),
        Padding(
          padding: EdgeInsets.only(top: 50),
        ),
        otherDetails(),
      ],
    );
  }

  otherDetails() {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 10),
        ),
        DetailsItem(
          rList: <String>[
            'Dumbells',
            'Barbell',
            'Machine',
            'Body Weight',
            'Other'
          ],
          hint: 'Equipment',
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
        ),
        DetailsItem(
          rList: ['Overhand', 'Underhand', 'Sumo', 'Other'],
          hint: 'Grip',
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
        ),
        DetailsItem(
          rList: [
            'Slight Incline',
            'Slight Decline',
            'Large Incline',
            'Large Decline'
          ],
          hint: 'Incline?',
        ),
      ],
    );
  }

  Widget weightEdit() {
    return Column(
      children: <Widget>[
        displayWeightNum(),
        Transform.scale(
          scale: .8,
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
