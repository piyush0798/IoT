import 'package:flutter/material.dart';
import 'package:healthmonitorapp/IotScreen.dart';
import 'package:splashscreen/splashscreen.dart';

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
      home: Splash(),
    );
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds:3,
      backgroundColor: Colors.white,
      image: Image.asset("assets/splashscreen.png"),
      loaderColor: Colors.grey,
      
      photoSize: 250,
      
    
      navigateAfterSeconds:IotScreen(),
            
          );
        }
      }
      
      