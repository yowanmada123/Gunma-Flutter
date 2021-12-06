import 'package:flutter/material.dart';
import 'package:gunma/HomePage/home_screen.dart';
// import 'package:gunma/Login1/login_screen.dart';
// import 'package:gunma/SplashScreen/splashscreen/body%20copy.dart';
import 'package:gunma/SplashScreen/splashscreen/body.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      // body: BodyCopy(),
    );
  }
}
