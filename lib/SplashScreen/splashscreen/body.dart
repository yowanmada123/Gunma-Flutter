import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gunma/HomePage/components/bottom_navigation_bar.dart';
import 'package:gunma/HomePage/home_screen.dart';
// import 'package:gunma/HomePage/home_screen_backup.dart';
import 'package:gunma/Login/login_screen.dart';
import 'package:gunma/Splashscreen/splashscreen/background.dart';
import 'package:gunma/components/left_rounded_button.dart';
// import 'package:gunma/SignUp/signup_screen.dart';
// import 'package:gunma/components/already_have_an_account_check.dart';
// import 'package:gunma/components/rounded_button.dart';
// import 'package:gunma/components/rounded_input_field.dart';
// import 'package:gunma/components/rounded_password_field.dart';
import 'package:gunma/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  Future<bool> getAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('login');
  }
  
  @override
  Widget build(BuildContext context) {
    return Background(
      child: ListView(
          children: <Widget>[
        SizedBox(height: 200),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text("Temukan Program Magang yang \nsesuai dengan passion kamu", style: TextStyle(fontWeight: FontWeight.bold, color: bWhite, fontSize: 18),),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text("Segera tentukan pilihan kamu sekarang dan \njangan sampai terlewat",style: TextStyle(color: bWhite, fontSize: 13),),
        ),
        SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: LeftRoundedButton(
            text: "Explore Internship",
            press: () async {
              await getAuth().then((logedIn) {
                if(logedIn){
                    Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return BottomNavigation();
                      },
                    ),
                    );
                }
                else{
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                    );
                }
              });
            },
            color: bPrimaryColor,
          ),
        ),
        // SizedBox(height: 20),
        // AlreadyHaveAnAccountCheck(
        //   press: () {
        //     Navigator.push(
        //       context, MaterialPageRoute(
        //         builder: (
        //           context){
        //             return SignUpScreen();
        //             },
        //       ),
        //     );
        //   },
        // ),
        // //
      ],
      ),
    );
  }
}
