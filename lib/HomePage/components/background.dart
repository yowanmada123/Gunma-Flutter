import 'package:flutter/material.dart';
import 'package:gunma/constants.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key, 
    required this.child,
  }) : super(key: key);

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,  
      height: 202,
      child: Stack(
        children: <Widget>[
          Container(
            color: kPrimaryColor,
          ),child,
          // Positioned(
          //   // right: 0,          
          //   // child: 
          //   // Image.asset('assets/images/homepage_header.png'),
          //   ),
          //   child,
        ],
      ),
    );
  }
}

