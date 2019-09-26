import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spottor_2/resources/blocs/font_bloc.dart';
import 'dart:async';

class PreviewPad extends StatefulWidget {
  @override
  _PreviewPadState createState() => _PreviewPadState();
}

class _PreviewPadState extends State<PreviewPad> {
  final fontBloc = FontBloc();
  String _padFont;
  @override
  void initState() {
    super.initState();
    fontBloc.getFont();
  }

  @override
  void dispose() {
    fontBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      child: Stack(
        children: <Widget>[
          ListView.separated(
            itemBuilder: (BuildContext context, int index) => ListTile(
              title: Text(
                "This is an example of text $index",
                style: TextStyle(fontSize: 25),
              ),
            ),
            itemCount: 20,
            separatorBuilder: (context, index) => Divider(
              height:0,
              color: Colors.blue,
            ),
          ),
          Positioned(
              left: 70,
              child: Container(
                height: 1000,
                width: 1,
                decoration: BoxDecoration(
                  color: Colors.red[300].withOpacity(.50),
                ),
              )),
        ],
      ),
    );
  }
  Future<void> changeFont(String font)async{
    final prefs = await SharedPreferences.getInstance();
    final String newFont = font;
    await prefs.setString('font',newFont);
    setState(() {
      _padFont = newFont;
    });
  }
}
