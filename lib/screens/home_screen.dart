import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spottor_2/screens/change_font_screen.dart';
import 'package:spottor_2/screens/editSelection.dart';
import 'package:spottor_2/screens/editor.dart';
import 'package:spottor_2/screens/myWorkoutSelection.dart';
import 'package:spottor_2/screens/pad.dart';
import 'package:spottor_2/screens/testing_3d_thing.dart';
import 'package:spottor_2/widgets/preview_pad.dart';
import 'package:spottor_2/resources/blocs/font_bloc.dart';
import 'package:spottor_2/widgets/primaryPad.dart';
import 'addWorkoutsToLists.dart';

class SpottorHomeScreen extends StatefulWidget {
  @override
  _SpottorHomeScreenState createState() => _SpottorHomeScreenState();
}

class _SpottorHomeScreenState extends State<SpottorHomeScreen>
    with SingleTickerProviderStateMixin {
  final List<Tab> appTabs = <Tab>[
    Tab(
      text: 'Home',
    ),
    Tab(
      text: 'One',
    ),
    Tab(
      text: 'Two',
    ),
    Tab(
      text: 'Three',
    ),
    Tab(
      text: 'Four',
    ),
  ];
  final List<Widget> _children = [
    MyWorkoutPage(),
    PadTest(),
    EditSelector(),
    BuildEditor(),
    AddWorkoutsToList(),
  ];

  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: appTabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: homeDrawer(),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(235, 149, 103, 1),
        title: TabBar(
          tabs: appTabs,
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        children: _children,
        controller: _tabController,
      ),
    );
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
