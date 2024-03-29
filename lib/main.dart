import 'package:flutter/material.dart';
import 'package:spottor_2/screens/splash_screen_2.dart';
import 'library.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/services.dart';

 main(){
  debugPaintSizeEnabled = false;

  runApp(
    DynamicTheme(
      data: (fontstyle) => ThemeData(
        fontFamily: "",
      ),
      themedWidgetBuilder: (context, theme) {
        return MaterialApp(
          title: 'hello',
          theme: theme,
          initialRoute: '/',
          routes: {
            // When we navigate to the "/" route, build the FirstScreen Widget
            '/': (context) => MyApp(),
            '/second': (context) => SpottorHomeScreen(),
            '/splash': (context) => SplashScreen2(),
            '/demo': (context) => PadDemo2(itemCount: 200,),
            // When we navigate to the "/second" route, build the SecondScreen Widget
          },
        );
      },
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return SplashScreen2();
  }
}