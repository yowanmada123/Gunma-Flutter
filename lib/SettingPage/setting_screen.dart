import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:gunma/HomePage/components/bottom_navigation_bar.dart';
import 'package:gunma/Login/login_screen.dart';
import 'package:gunma/SettingPage/about_app.dart';
import 'package:gunma/SettingPage/change_password.dart';
import 'package:gunma/SettingPage/help_and_support.dart';
import 'package:gunma/SettingPage/privacy_policy.dart';
import 'package:gunma/SettingPage/term_and_condition.dart';
import 'package:gunma/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({ Key? key }) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
   void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
      builder: (context) => LoginScreen())
    ,(Route<dynamic> route) => false);
    
  }
  
  Future<void>delete(BuildContext context) async {
              
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("TOKEN : " + prefs.getString('login').toString());
    
    try {
    final postResponse = await http.post(
      Uri.parse("http://api.gunma.my.id/api/delete"),
      
      headers: {
          HttpHeaders.authorizationHeader: 'Bearer ' + prefs.getString('login')!,
      },
    );
 
       if (postResponse.statusCode == 200) {
          
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("User Deleted")));

          Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => LoginScreen(),
          )
          );       

       }else{
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Connection Failed")));
       }

    } catch (error) {
      print(error);
    }
  }  

  @override
  Widget build(BuildContext context) {
  //  Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('Settings'), centerTitle: true, 
        leading: IconButton(
          onPressed: () {
             Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => BottomNavigation(),
                  )
                  );  
          },
          icon: Icon(Icons.arrow_back ),
        ),
      ),
      body: 
      SafeArea(       
        child: Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: ListView(
                children: [
                  SizedBox(height: 30),
                  Text("Settings", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,
                    shadows: <Shadow>[
                              Shadow(
                                offset: Offset(2.0, 2.0),
                                blurRadius: 1.0,
                                color: bGrey,
                              ),
                    ], 
                  ),),
                  SizedBox(height: 20),
                  Column(
                    children: [
                    //   Row(
                    //      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Text("Notification", style: TextStyle(fontSize: 14),),
                    //       SizedBox(width: 210),
                    //       IconButton(
                    //         icon: Icon(Icons.keyboard_arrow_right_rounded ),
                    //         onPressed: (){
                    //           // Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewScreen()));
                    //         }
                    //       )
                    //     ],
                    //   ),
                    //  Divider(
                    //   height: 0.1,
                    //   thickness: 1,                     
                    //   endIndent: 20,
                    // ),     

                      // SizedBox(height: 5),
                      Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Change Password", style: TextStyle(fontSize: 14),),
                          SizedBox(width: 170),
                          IconButton(
                            icon: Icon(Icons.keyboard_arrow_right_rounded ),
                            onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChangePasswordScreen()));
                            }
                          )
                        ],
                      ),
                      Divider(
                      height: 0.1,
                      thickness: 1,                     
                      endIndent: 20,
                    ),
                    //   Row(
                    //      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Text("Language", style: TextStyle(fontSize: 14),),
                    //       SizedBox(width: 220),
                    //       IconButton(
                    //         icon: Icon(Icons.keyboard_arrow_right_rounded ),
                    //         onPressed: (){
                    //           // Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewScreen()));
                    //         }
                    //       )
                    //     ],
                    //   ),
                    //   Divider(
                    //   height: 0.1,
                    //   thickness: 1,                     
                    //   endIndent: 20,
                    // ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Text("Support", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,
                    shadows: <Shadow>[
                              Shadow(
                                offset: Offset(2.0, 2.0),
                                blurRadius: 1.0,
                                color: bGrey,
                              ),
                    ], 
                  ),),
                  SizedBox(height: 20),
                  Column(
                    
                    children: [
                      Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("About App", style: TextStyle(fontSize: 14),),
                          SizedBox(width: 225),
                          IconButton(
                            icon: Icon(Icons.keyboard_arrow_right_rounded ),
                            onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => AboutAppScreen()));
                            }
                          )
                        ],
                      ),
                     Divider(
                      height: 0.1,
                      thickness: 1,                     
                      endIndent: 20,
                    ),     

                      // SizedBox(height: 5),
                      Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Help & Support", style: TextStyle(fontSize: 14),),
                          SizedBox(width: 197),
                          IconButton(
                            icon: Icon(Icons.keyboard_arrow_right_rounded ),
                            onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => HelpSupportScreen()));
                            }
                          )
                        ],
                      ),
                      Divider(
                      height: 0.1,
                      thickness: 1,                     
                      endIndent: 20,
                    ),
                      Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Privacy & Policy", style: TextStyle(fontSize: 14),),
                          SizedBox(width: 193),
                          IconButton(
                            icon: Icon(Icons.keyboard_arrow_right_rounded ),
                            onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => PrivacyPolicyScreen()));
                            }
                          )
                        ],
                      ),
                      Divider(
                      height: 0.1,
                      thickness: 1,                     
                      endIndent: 20,
                    ),
                    Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Term & Condition", style: TextStyle(fontSize: 14),),
                          SizedBox(width: 182),
                          IconButton(
                            icon: Icon(Icons.keyboard_arrow_right_rounded ),
                            onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => TermConditionScreen()));
                            }
                          )
                        ],
                      ),
                      Divider(
                      height: 0.1,
                      thickness: 1,                     
                      endIndent: 20,
                    ),
                    Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Feedback & Suggestion", style: TextStyle(fontSize: 14),),
                          SizedBox(width: 142),
                          IconButton(
                            icon: Icon(Icons.keyboard_arrow_right_rounded ),
                            onPressed: () async {
                              // Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewScreen()));
                              await launch('https://forms.gle/z5xVd5HR4tT4cUU4A');
                            }
                          )
                        ],
                      ),
                      Divider(
                      height: 0.1,
                      thickness: 1,                     
                      endIndent: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Log Out", style: TextStyle(fontSize: 14),),
                         
                          IconButton(
                              icon: Icon(Icons.keyboard_arrow_right_rounded),
                              onPressed: () => showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => CupertinoAlertDialog(
                                  title: const Text('Did you want to Log Out ?'),
                                  // content: const Text('AlertDialog description'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () => Navigator.pop(context, 'Cancel'),
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () => logout(),
                                      child: const Text('Yes', style: TextStyle(color: Colors.red)),
                                    ),
                                  ],
                                ),
                              ),                             
                            ),
                        ],
                      ),
                      Divider(
                      height: 0.1,
                      thickness: 1,                     
                      endIndent: 20,
                    ),
                    Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Delete Account", style: TextStyle(fontSize: 14, color: Colors.red),),
                          SizedBox(width: 192),
                          Center(

                            child: 
                            IconButton(
                              icon: Icon(Icons.keyboard_arrow_right_rounded, color: Colors.red),
                              onPressed: () => showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => CupertinoAlertDialog(
                                  title: const Text('Did You Really \nWant to Delete Your Account ?'),
                                  // content: const Text('AlertDialog description'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () => Navigator.pop(context, 'Cancel'),
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () => delete(context),
                                      child: const Text('Yes', style: TextStyle(color: Colors.red)),
                                    ),
                                  ],
                                ),
                              ),                             
                            ),
                          )
                        ],
                      ),
                      Divider(
                      height: 0.1,
                      thickness: 1,                     
                      endIndent: 20,
                    ),
                    ],
                  ),
                ],
              ),
            ),
        )    
      ),  
            
    );
  }

}
