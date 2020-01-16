import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'myWorkoutSelection.dart';

class AddWorkoutsToList extends StatefulWidget {
  @override
  _AddWorkoutsToListState createState() => _AddWorkoutsToListState();
}

class _AddWorkoutsToListState extends State<AddWorkoutsToList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Expanded(child: Container(
                  child:     Container(
                    child: Text('List Builder',style: TextStyle(fontSize: 15,),),
                  ),
                ),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.list,color: Colors.grey[400],),
                    Container(width: 5,),
                    Icon(Icons.image,color: Colors.black,),
                  ],
                ),
              ],
            ),
          ),
          Container(height: 15,),
          listBuilder(),
          Container(
            height: 75,
          ),
        ],
      ),
    );
  }
  listBuilder(){
    return Row(
      children: <Widget>[
        Expanded(
          child: Center(
            child: Container(
              color: Colors.black,
              width: 1,
            ),
          ),
        ),
      ],
    );
  }
}
