import 'package:flutter/material.dart';

class PadDemo extends StatefulWidget {
  @override
  _PadDemoState createState() => _PadDemoState();
}

class _PadDemoState extends State<PadDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
    );
  }

  buildBody() {
    return Container(
      decoration: BoxDecoration(),
      child: buildNotebook(),
    );
  }

  buildNotebook() {
    return Stack(
      children: <Widget>[
        blueLines(),
        hinges(),
      ],
    );
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

  hinges() {
    return (Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 50),),
        hinge(),
      ],
    ));
  }

  hinge() {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              height: 6,
              width: 45,
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 3),),
            Container(
              height: 6,
              width: 45,
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
              ),
            )

          ],
        ),
      ],
    );
  }
}
