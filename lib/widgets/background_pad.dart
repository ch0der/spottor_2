import 'package:flutter/material.dart';
import 'package:spottor_2/resources/blocs/workoutBloc.dart';
import 'package:spottor_2/newWorkoutModel.dart';
import 'dart:async';

class PadDemo2 extends StatefulWidget {
  final int itemCount;
  PadDemo2({@required this.itemCount});

  @override
  _PadDemo2State createState() => _PadDemo2State();
}

class _PadDemo2State extends State<PadDemo2> {
  String font1 = 'alata';
  Color spacingColor = Colors.white;
  Color commentColor = Colors.green.withOpacity(.3);




  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }

  final bloc = ExerciseBloc2();

  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(),
        child: Stack(
          children: <Widget>[
            buildNotebook(
              MediaQuery.of(context).size.width * .125,
            ),
          ],
        ),
      ),
    );
  }

  buildNotebook(double num) {
    return Stack(
      children: <Widget>[
        Positioned(
          left: num,
          child: redLines(),
        ),
        blueLines(),
        view(bloc),
      ],
    );
  }

  redLines() {
    return Row(
      children: <Widget>[
        Container(
          width: 1,
          height: 1000,
          color: Colors.red[200].withOpacity(.8),
        ),
        Container(
          width: 3,
        ),
        Container(
          width: 1,
          height: 1000,
          color: Colors.red[200].withOpacity(.8),
        )
      ],
    );
  }

  Widget view(ExerciseBloc2 bloc) {
    return StreamBuilder<List<Exercise>>(
      stream: bloc.exercises,
      builder: (BuildContext context, AsyncSnapshot<List<Exercise>> snapshot) {
        if (snapshot.hasData) {
          return Container(
            child: ListView.separated(
              separatorBuilder: (context, index) => Container(
                height: 2,
                color: Colors.white70,
              ),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                Exercise item = snapshot.data[index];
                int _ind = index + 1;
                return GestureDetector(
                  onLongPress: () {
                    bloc.delete(item.id);
                  },
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          color: spacingColor.withOpacity(.4),
                          height: screenSize(context).height * .2,
                          width: screenSize(context).width * .4,
                          child: Column(
                            children: <Widget>[
                              Text(
                                item.nickname,
                                style: TextStyle(
                                    fontSize: 20, fontFamily: 'alata'),
                              ),
                              Text(
                                item.exercise,
                                style: TextStyle(
                                    fontSize: 15, fontFamily: 'marker'),
                              ),
                              Text(
                                item.equipment,
                                style: TextStyle(
                                    fontSize: 15, fontFamily: 'marker'),
                              ),
                              Text(
                                item.bodyPart,
                                style: TextStyle(
                                    fontSize: 15, fontFamily: 'marker'),
                              ),
                              Text(
                                '•${item.grip} grip',
                                style: TextStyle(
                                    fontSize: 15, fontFamily: 'marker'),
                              ),
                              Text(
                                '•${item.incline}',
                                style: TextStyle(
                                    fontSize: 15, fontFamily: 'marker'),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.topCenter,
                                  color: spacingColor.withOpacity(.3),
                                  height: screenSize(context).height * .1,
                                  width: screenSize(context).width * .2,
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        'Sets',
                                        style: TextStyle(fontSize: 25),
                                      ),
                                      Text(
                                        '${item.reps.toString()}-${item.reps2.toString()}',
                                        style: TextStyle(
                                            fontFamily: 'alata', fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  color: spacingColor.withOpacity(.2),
                                  height: screenSize(context).height * .1,
                                  width: screenSize(context).width * .2,
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        'Reps',
                                        style: TextStyle(fontSize: 25),
                                      ),
                                      Text(
                                        '${item.sets.toString()}-${item.sets2.toString()}',
                                        style: TextStyle(
                                            fontFamily: 'alata', fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  color: spacingColor.withOpacity(.1),
                                  height: screenSize(context).height * .1,
                                  width: screenSize(context).width * .2,
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        'Wait',
                                        style: TextStyle(fontSize: 25),
                                      ),
                                      Text(
                                        '${item.weight.toString()}-${item.weight2.toString()}',
                                        style: TextStyle(
                                            fontFamily: 'alata', fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: screenSize(context).height * .1,
                              width: screenSize(context).width * .6,
                              child: Text(item.note),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else
          return Center(
            child: CircularProgressIndicator(),
          );
      },
    );
  }

  viewDemo() {
    return Container();
  }

  Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double detailWidth(
    BuildContext context,
  ) {
    return (screenSize(context).width * .3);
  }

  blueLines() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 42),
        ),
        blueLinesEditor(),
        blueLinesEditor(),
        blueLinesEditor(),
        blueLinesEditor(),
        blueLinesEditor(),
        blueLinesEditor(),
        blueLinesEditor(),
        blueLinesEditor(),
        blueLinesEditor(),
        blueLinesEditor(),
        blueLinesEditor(),
      ],
    );
  }

  test() {
    return Column(
      children: <Widget>[
        Container(
          height: 1,
          color: Colors.blue[300],
        ),
        Container(
          height: 31,
        ),
      ],
    );
  }

  blueLinesEditor() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 31),
        ),
        Container(
          height: 1,
          color: Colors.blue[300],
        ),
        Padding(
          padding: EdgeInsets.only(top: 31),
        ),
        Container(
          height: 1,
          color: Colors.blue[300],
        ),
      ],
    );
  }
}
