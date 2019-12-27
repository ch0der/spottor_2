import 'package:flutter/material.dart';

class PadDemo2 extends StatelessWidget {

  int itemCount;
  PadDemo2({@required this.itemCount});


  Widget build(BuildContext context) {



   return Material(
     child: Container(
        decoration: BoxDecoration(),
        child: Stack(
          children: <Widget>[
            buildNotebook(MediaQuery
                .of(context)
                .size
                .width * .125,),
          ],
        ),
      ),
   );
  }

  buildNotebook(double num) {
    return Stack(
      children: <Widget>[
        view(),
        Positioned(
          left: num,
          child: redLines(),
        ),
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
  Widget view(){
    return ListView.builder(
      itemCount: itemCount,
        itemBuilder: (context, index){return test();});
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
  test(){
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
