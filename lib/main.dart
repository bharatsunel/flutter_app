import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swadesiplay/screens/sign_up.dart';
import 'package:swadesiplay/screens/log_in.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => new SignupPage()
      },
      home: new LoginPage(),
    );
  }
}


