import 'package:flutter/material.dart';
import 'package:gunma/constants.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key? key, 
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 3),
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: bWhite,
        borderRadius: BorderRadius.circular(8),
        ),
      child: child,
    );
  }
}

