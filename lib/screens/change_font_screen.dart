import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spottor_2/resources/blocs/font_bloc.dart';

class FontTest extends StatefulWidget {
  @override
  _FontTestState createState() => _FontTestState();
}

class _FontTestState extends State<FontTest> {
  final bloc = FontBloc();

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
              changeFont1('Mansalva');

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

  void changeFont1(String str) {
    DynamicTheme.of(context).setThemeData(ThemeData(
      fontFamily: str));
  }
}
