import 'package:flutter/material.dart';
import 'package:gunma/constants.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key, 
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            color: kPrimaryColor,
          ),
          Positioned(
            top: 260,
            child: 
            Image.asset('assets/images/newSplashscreeen2.png'),
            width: size.width,
            height: size.height,
            ),
            child,
        ],
      ),
    );
  }
}

