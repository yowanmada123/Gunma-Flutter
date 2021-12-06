// import 'package:flutter/material.dart';
// // import 'package:flutter_svg/flutter_svg.dart';
// import 'package:gunma/Login/login_screen.dart';
// import 'package:gunma/Register/components/background.dart';
// import 'package:gunma/Register/components/or_divider.dart';
// import 'package:gunma/components/already_have_an_account_check.dart';
// import 'package:gunma/components/rounded_button.dart';
// import 'package:gunma/components/button_input_field.dart';
// import 'package:gunma/components/rounded_password_field.dart';
// import 'package:gunma/constants.dart';


// class Body extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {  
//     // 
//     return Background(
//       child: Column(
//         children: <Widget>[         
//         SizedBox(height: 100),
//           Text(
//             "SIGN UP", 
//             style: TextStyle(
//               fontWeight: FontWeight.bold, color: Colors.white),
//         ),
//         SizedBox(height: 200),
//         RoundedInputField(
//           hintText: "Username",
//           onChanged: (value) {},
//         ),
//         RoundedInputField(
//           hintText: "Your Email",
//           onChanged: (value) {},
//         ),
//         RoundedPasswordField(
//           onChanged: (value){},
//         ),
//         SizedBox(height: 10),
//         RoundedButton(
//           text: "SIGN UP",
//           press: () {
//           },
//           color: bPrimaryColor,
//         ),
//         SizedBox(height: 15),
//         AlreadyHaveAnAccountCheck(
//           login: false, press: () {
//             Navigator.push(
//               context, MaterialPageRoute(
//                 builder: (
//                   context){
//                     return LoginScreen();
//                     },
//               ),
//             );  },
//         ),
//         SizedBox(height: 10),
//         OrDivider(),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Container(
//               padding: EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   width: 2,
//                   color : bGrey,
//                 ),
//                 shape: BoxShape.circle,
//                 ),
//               // child: SvgPicture.asset("images\logo.png", height: 20, width: 20,),
//               ),
//           ],
//         ),  
//       ],
//       ),
//     );
//   }
// }

