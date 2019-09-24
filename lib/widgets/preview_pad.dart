import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreviewPad extends StatefulWidget {
  @override
  _PreviewPadState createState() => _PreviewPadState();
}

class _PreviewPadState extends State<PreviewPad> {
  String _padFont;
  @override
  void initState(){
    super.initState();
    _getFont();
  }

  Future<void> _getFont() async{
    final prefs = await SharedPreferences.getInstance();
    final font = prefs.getString('font');
    setState(() {
      _padFont = font;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      child: Stack(
        children: <Widget>[
          ListView.separated(
            itemBuilder: (BuildContext context, int index) => Padding(
              padding: EdgeInsets.all(5),
              child: Text("This is an example of text $index",style: TextStyle(fontFamily: _padFont,fontSize: 25),),
            ),
            itemCount: 20,
            separatorBuilder: (context, index) => Divider(
              height: 2,
              color: Colors.blue,
            ),
          ),
          Positioned(
              left: 30,
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
}
