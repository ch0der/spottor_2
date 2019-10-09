import 'package:flutter/material.dart';

class PadTest extends StatefulWidget {
  @override
  _PadTestState createState() => _PadTestState();
}

class _PadTestState extends State<PadTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),

    );
  }
  buildBody(){
    return Center(
      child: GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, '/demo');
        },
        child: Container(
          height: 110,
          width: 85,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.blueAccent,width: 2),

          ),
        ),
      ),
    );
  }

}
