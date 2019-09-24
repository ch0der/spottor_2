import 'package:flutter/material.dart';
import 'package:spottor_2/screens/change_font_screen.dart';
import 'package:spottor_2/widgets/preview_pad.dart';

class LogoScreen extends StatefulWidget {
  @override
  _LogoScreenState createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    PreviewPad(),
    FontTest(),
    FontTest(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.backup),
            title: Text('test'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.text_fields),
            title: Text('Style'),
          ),
        ],
      ),
    );
  }
  buildBody(){
    return Container(
      constraints: BoxConstraints.expand(),
      child: Stack(
        children: <Widget>[
          ListView.separated(
            itemBuilder: (BuildContext context, int index) => Padding(
              padding: EdgeInsets.all(5),
              child: Text("This is an example of text $index",style: TextStyle(fontFamily: "Satisfy",fontSize: 25),),
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
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
