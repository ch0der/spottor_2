import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spottor_2/screens/change_font_screen.dart';
import 'package:spottor_2/screens/editSelection.dart';
import 'package:spottor_2/screens/editor.dart';
import 'package:spottor_2/screens/pad.dart';
import 'package:spottor_2/widgets/preview_pad.dart';
import 'package:spottor_2/resources/blocs/font_bloc.dart';

class LogoScreen extends StatefulWidget {
  @override
  _LogoScreenState createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  String title = 'test';

  final fontBloc = FontBloc();
  String font;
  int _currentIndex = 0;
  final List<Widget> _children = [
    PreviewPad(),
    PadTest(),
    EditSelector(),
    BuildEditor(),
  ];
  @override
  void initState() {
    super.initState();
    fontBloc.getFont();
  }

  @override
  Widget build(BuildContext context) {
    if (_currentIndex == 2) {
      setState(() {
        title = 'hello';
      });
    }
    if (_currentIndex == 1) {
      setState(() {
        title = 'hello1';
      });
    }
    if (_currentIndex == 3) {
      setState(() {
        title = 'Editor';
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.green[800].withOpacity(.5),
        elevation: 5,
        actions: <Widget>[
          SizedBox(
            width: 50,
            child: Image(image: AssetImage('assets/imgs/small_icon_white.png'),),
          ),
        ],
      ),
      drawer: homeDrawer(),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromRGBO(130, 227, 135, 1),
        selectedItemColor: Colors.white70,
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_note),
            title: Text('test'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.text_fields),
            title: Text('Style'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            title: Text('Editor'),
          ),
        ],
      ),
    );
  }

  buildBody() {
    return Container(
      constraints: BoxConstraints.expand(),
      child: Stack(
        children: <Widget>[
          ListView.separated(
            itemBuilder: (BuildContext context, int index) => Padding(
              padding: EdgeInsets.all(5),
              child: StreamBuilder(
                stream: fontBloc.font,
                builder: (context, snapshot) {
                  return Text(
                    "This is an example of text $index",
                    style: TextStyle(fontFamily: snapshot.data, fontSize: 25),
                  );
                },
              ),
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

  Future<void> getFont() async {
    final prefs = await SharedPreferences.getInstance();
    final thisFont = prefs.getString('font');
    setState(() {
      font = thisFont;
    });
  }

  homeDrawer() {
    return Container(
      width: 200,
      child: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 100,
              child: DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
