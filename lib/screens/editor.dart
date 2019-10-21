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
        DetailsItem(
          rList: <String>['item1', 'item2', 'item3'],
          hint: 'hint',
          label: 'label',
        ),
        DetailsItem(
          rList: ['pen','is'],
          hint: 'hint',
          label: 'label',
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
      width: 100,
      child: DropdownButtonFormField(
        decoration: InputDecoration(labelText: widget.label),
        hint: Text(widget.hint),
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
