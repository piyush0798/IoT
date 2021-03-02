import 'package:flutter/material.dart';
import 'package:healthmonitorapp/IotScreen.dart';
import 'package:healthmonitorapp/IotScreen1.dart';
import 'package:healthmonitorapp/myscreen.dart';
//import 'package:iotfirebase/screens/iotscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{},
      title: 'Flutter Demo',
      theme: ThemeData(brightness: Brightness.light),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      home: IotScreen(),
    );
  }
}