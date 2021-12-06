import 'package:flutter/material.dart';
import 'package:gunma/constants.dart';


class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final VoidCallback press;
  const AlreadyHaveAnAccountCheck({
    Key? key, 
    this.login = true, 
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login? "Don't have an Account ? " : "Already have An Account ?", 
        style: TextStyle(
          color: bDark,
          ),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login? "Sign Up " : " Sign In", 
          style: TextStyle(
            color: bDark, fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}



