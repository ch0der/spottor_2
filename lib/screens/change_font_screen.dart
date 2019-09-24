import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FontTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: (){
              changeFont('Satisfy');

            },
            child: Text(
              'Test',
              style: TextStyle(fontSize: 50),
            ),
          ),
          RaisedButton(
            onPressed: (){
              changeFont('Mansalva');

            },
            child: Text(
              'Test2',
              style: TextStyle(fontSize: 50),
            ),
          ),
        ],
      ),
    );
  }
  Future<void> changeFont(String font)async{
    final prefs = await SharedPreferences.getInstance();
    final String newFont = font;
    await prefs.setString('font',newFont);
  }
}
