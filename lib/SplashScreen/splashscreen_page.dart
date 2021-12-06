import 'package:flutter/material.dart';
// import 'package:gunma/Login/login_screen.dart';
import 'package:gunma/SplashScreen/splashscreen/splashcreen2_page.dart';
import 'dart:async';

import 'package:gunma/constants.dart';

class SplashScreenPage extends StatefulWidget {
  static var routeName;


  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
 
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
  var duration = const Duration(seconds: 5);
  return Timer(duration, () {
    Navigator.of(context) .pushReplacement(
      MaterialPageRoute(builder: (_) {
        return SplashPage();
      }),
    );
  });
}
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3E83A8),
      body: Center(
        child: Image.asset(
          "assets/images/newlogo.png",
          width: 150.0,
          height: 125.0,
        ),
      ),
    );
  }
}

