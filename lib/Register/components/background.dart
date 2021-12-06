// import 'package:flutter/material.dart';

// class Background extends StatelessWidget {
//   final Widget child;
//   const Background({
//     Key? key,
//     required this.child,
//   }) : super(key: key);



//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
    
//     return Container(
      
//       width: double.infinity,
//       height: size.height,
//       child: Stack(
//         alignment: Alignment.center,
//         children: <Widget>[
//           Positioned(
//             top: -20,
//             left: -20,
//             child: 
//             Image.asset('assets/images/Vector_41.png'),
//             width: size.width * 0.50,
//             ),
//           Positioned(
//             top: 155,
//             child: 
//             Image.asset('assets/images/signuppict.png'),
//             width: size.width * 0.60,
//             ),
//           Positioned(
//             bottom: -80,
//             right: -53,
//             child: 
//             Image.asset('assets/images/Vector_42.png'),
//             width: size.width * 0.5,
//             ),
//           // Positioned(
//           //   top: -80,
//           //   right: -53,
//           //   child: 
//           //   Image.asset('images/Polygon_6.png'),
//           //   width: size.width * 0.5,
//           //   ),
//           SizedBox(height: 1000,),
//             child,
//         ],
//       ),
//     );
//   }
// }