import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gunma/constants.dart';

AppBar buildAppBar (BuildContext context) {
  // final icon = CupertinoIcons.moon_stars;
  
  return AppBar(
    leading: BackButton(),
    backgroundColor: kPrimaryColor,
    elevation: 0,
    // actions: [
    //   IconButton(onPressed: (){}, 
    //   icon: Icon(icon),
      
    //   )
    // ],
  );
}