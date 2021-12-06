import 'package:flutter/material.dart';
import 'package:gunma/constants.dart';

class LeftRoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color, textColor;
  const LeftRoundedButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
      margin: EdgeInsets.only(right: 218), 
      width: size.width * 0.35,
      height: size.height * 0.04,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: FlatButton(
          padding: const EdgeInsets.all(2),
          color: color,
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(color: textColor, fontSize: 13),
          ),
        ),
      ),
    );
  }
}