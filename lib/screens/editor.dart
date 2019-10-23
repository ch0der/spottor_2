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


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 300),),
        otherDetails(),
      ],
    );
  }
  otherDetails(){
    return Row(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(left: 10),),
        DetailsItem(
          rList: <String>['Dumbells', 'Barbell', 'Machine','Body Weight','Other'],
          hint: 'Equipment',
        ),
        Padding(padding: EdgeInsets.only(left: 10),),
        DetailsItem(
          rList: ['Overhand','Underhand','Sumo','Other'],
          hint: 'Grip',
        ),
        Padding(padding: EdgeInsets.only(left: 10),),
        DetailsItem(
          rList: ['Slight Incline','Slight Decline','Large Incline','Large Decline'],
          hint: 'Incline?',
        ),
      ],
    );
  }
}

class DetailsItem extends StatefulWidget {
  DetailsItem({
    Key key,
    this.items,
    @required this.rList,
    this.label,
    this.hint

  }) : super(key: key);

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
        decoration: InputDecoration(labelText: widget.label,hintText: widget.hint,),
        items: widget.rList
            .map<DropdownMenuItem<String>>((String value) {
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
