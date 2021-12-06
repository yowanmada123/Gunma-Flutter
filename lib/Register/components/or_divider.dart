import 'package:flutter/material.dart';
import 'package:gunma/constants.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height *0.02),
      width: size.width * 0.8,
      child: Row(
        children: <Widget>[
          buildDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              "OR",
              style: TextStyle(
                color: bWhite,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          buildDivider(),
        ],
      ),
    );
  }

  Expanded buildDivider() {
    return Expanded(
          child: Divider(
            color: bWhite,
            height: 1.5,
        ),
        );
  }
}