import 'package:flutter/material.dart';
import 'library.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
void main() {
  debugPaintSizeEnabled = false;

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TODO LIST',
      // Start the app with the "/" named route. In our case, the app will start
      // on the FirstScreen Widget
      initialRoute: '/',
      routes: {
        // When we navigate to the "/" route, build the FirstScreen Widget
        '/': (context) => MyApp(),
        '/second': (context) => SplashScreen(),
        // When we navigate to the "/second" route, build the SecondScreen Widget
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
    return DynamicTheme(
      data: (fontstyle) => ThemeData(
        fontFamily: "",
      ),
      themedWidgetBuilder: (context,theme){
        return MaterialApp(
          title: 'hello',
          theme: theme,
          home: LogoScreen(),
        );
      },

    );
  }

}
