import 'package:flutter/material.dart';
import 'myWorkoutSelection.dart';

class AddWorkoutsToList extends StatefulWidget {
  @override
  _AddWorkoutsToListState createState() => _AddWorkoutsToListState();
}

class _AddWorkoutsToListState extends State<AddWorkoutsToList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
    );
  }
  buildBody(){
    return Column(
      children: <Widget>[
        MyWorkoutPage(),
        Text('fdsfds'),
      ],
    );
  }
}
