import 'package:flutter/material.dart';

class HorizontalDivider extends StatelessWidget {
  const HorizontalDivider({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 0,
      decoration: BoxDecoration(
      border: Border(
      top: BorderSide(width: 1.0, color: Color(0xFFE5DCDC)),
      ),
                                   
     ),
    );
  }
}