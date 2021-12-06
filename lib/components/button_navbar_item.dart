import 'package:flutter/material.dart';
import 'package:gunma/constants.dart';

class ButtonNavbarItem extends StatelessWidget {
  // const ButtonNavbarItem({ Key? key }) : super(key: key);

  final String imageUrl;
  final bool isActive;

  // bool isPopuler;
  // bool isPopuler;    required this.isPopuler

  ButtonNavbarItem({

    required this.imageUrl,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        Spacer(),
      Image.asset(imageUrl, 
      width: 26,
      
      ),
       Spacer(),
       isActive 
      ?
      Container(
        width: 30,
        height: 2,
        decoration: BoxDecoration( color: kPurple, borderRadius: BorderRadius.vertical(
          top: Radius.circular(1000), 
        )),
        
      ) : Container(),
      ],
    );
  }
}