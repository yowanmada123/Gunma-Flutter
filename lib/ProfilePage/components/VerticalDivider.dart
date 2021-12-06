import 'package:flutter/material.dart';
import 'package:gunma/constants.dart';

class VerticalDivider extends StatelessWidget {
  const VerticalDivider({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 300,
      height: 30,
      decoration: BoxDecoration(
      border: Border(
      top: BorderSide(width: 2.0, color: bDark),
      ),
                                   
     ),
    );
  }
}