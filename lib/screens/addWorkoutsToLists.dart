import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'myWorkoutSelection.dart';
import 'package:spottor_2/resources/blocs/workoutBloc.dart';
import 'package:spottor_2/newWorkoutModel.dart';
import 'dart:async';

class AddWorkoutsToList extends StatefulWidget {
  @override
  _AddWorkoutsToListState createState() => _AddWorkoutsToListState();
}

class _AddWorkoutsToListState extends State<AddWorkoutsToList> {


  Stream stream;
  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }
  final bloc = ExerciseBloc2();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.list,
                      color: Colors.grey[400],
                    ),
                    Container(
                      width: 5,
                    ),
                    Icon(
                      Icons.image,
                      color: Colors.black,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 25,
          ),
          Expanded(
            child: Container(
              child: Row(
                children: <Widget>[
                  columnA(),
                  columnB(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  columnA() {
    return Expanded(
      child: Container(
        color: Colors.red.withOpacity(.2),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: listPreview(bloc),
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: Icon(
                Icons.add_circle,
                size: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }

  columnB() {
    return Expanded(
      child: Container(
        color: Colors.blue.withOpacity(.2),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(),
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: Icon(
                Icons.add_circle_outline,
                size: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }

  listPreview(ExerciseBloc2 bloc) {
    return StreamBuilder<List<Exercise>>(
      stream: bloc.exercises,
      builder: (BuildContext context, AsyncSnapshot<List<Exercise>> snapshot) {
        if (snapshot.hasData) {
          return Container(
            child: ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                Exercise item = snapshot.data[index];
                int _ind = index +1;
                return ListTile(
                  onLongPress: (){
                    bloc.delete(item.id);
                  },
                  title: Row(
                    children: <Widget>[
                      Text('$_ind.  '),
                      Container(width: 3,),
                      Text(item.nickname),
                    ],
                  ),
                );
              },
            ),
          );
        } else
          return Center(child: CircularProgressIndicator(),);
      },
    );
  }
}
