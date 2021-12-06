import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gunma/constants.dart';

class InternshipWidget extends StatelessWidget {

  final String imagePath;
  final bool isEdit;
  final VoidCallback onClicked;

  const InternshipWidget({
    Key? key,
    required this.imagePath,
    required this.onClicked, 
    this.isEdit = false,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Center(
       child: Stack(
         children: [
           buildImage(),
           Positioned(
             bottom: 0 ,
             right:4,
             child:           
                buildEditIcon(color), ),
           
         ],
       ),
    );
  }

  Widget buildImage(){
    //  final image =  NetworkImage(imagePath);
    final image = imagePath.contains('https://')
        ? NetworkImage(imagePath)
        : FileImage(File(imagePath));

    //  return ClipOval(
    //    child: Material(
    //      color: Colors.transparent,
    //      child: Ink.image(
    //     //  image: image,
    //      image: image as ImageProvider,
    //      fit: BoxFit.cover,
    //       width: 128,
    //       height: 128,
    //       child: InkWell(onTap: onClicked,),
    //      ),
    //    ),
    //  );
     return Container(
       decoration: BoxDecoration(color: kPrimaryColor, 
       borderRadius: BorderRadius.only(
       bottomLeft: Radius.circular(30),
       )                     
       ),   
       child: Material(
         color: Colors.transparent,
         child: Ink.image(
        //  image: image,
         image: image as ImageProvider,
         fit: BoxFit.cover,
          width: 128,
          height: 128,
          child: InkWell(onTap: onClicked,),
         ),
       ),
     );
  }

  buildEditIcon(Color color) => buildCircle(
    color: Colors.white,
    all: 3,
    child:buildCircle(
      color: color,
      all: 8,
      child:
      Icon(
        isEdit ? Icons.add_a_photo : Icons.edit,
        color: Colors.white,
        size: 20, 
      ),  
    ),
  );
  

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
    ClipOval(
      child: Container(
        padding: EdgeInsets.all(all), 
        color: color,
        child: child,
      ),
    );
    
}
