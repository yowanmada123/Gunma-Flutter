import 'package:flutter/material.dart';
import 'package:gunma/SplashScreen/splashscreen_page.dart';
void main() async {

  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreenPage(),
    );
  }
}
 