import 'package:flutter/material.dart';
import 'package:healthmonitorapp/myscreen.dart';
import 'IotScreen.dart';
import 'package:healthmonitorapp/IotScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{},
      title: 'Flutter Demo',
      theme: ThemeData(brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      home: MyScreen(),
    );
  }
}
