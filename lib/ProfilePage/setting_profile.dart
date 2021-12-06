// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:gunma/DetailPage/components/divider.dart';
import 'package:gunma/HomePage/home_screen.dart';
import 'package:gunma/UploadInternship/setting_upload.dart';
import 'package:gunma/constants.dart';
import 'package:gunma/models/DetailUser.dart';

class SettingProfile extends StatefulWidget {
  const SettingProfile({ Key? key }) : super(key: key);

  @override
  _SettingProfileState createState() => _SettingProfileState();
}

class _SettingProfileState extends State<SettingProfile> {
  User? user = null;
  
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: 
      SafeArea(       
        child: Column(         
          children: [
            Container(         
                    width: size.width,
                    color: kPrimaryColor,
                    child: Container(  
                      width: size.width,  
                      height: 52,         
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 30
                        ),
                        child:                 
                        Row(                  
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.pop(context
                                );
                              },  
                              child: 
                              Image.asset('assets/images/back_icon.png', width: 15,
                              ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 110.0),
                                child: Text('Profile', style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold, color: bWhite)),
                              ),
                            // Image.asset('assets/images/icon_love.png', width: 40,),
                            //                
                          ],
                        ),
                        
                      ),
                     
                    ),                  
                  ),
                  SizedBox(height: 20),
                            // Container(
                            //   height: 60,
                            //    width: MediaQuery.of(context).size.width,
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(5.0),
                            //     color: Colors.white,
                            //     boxShadow: [
                            //       BoxShadow(
                            //         color: Colors.grey,
                            //         offset: Offset(0.0, 1.0), //(x,y)
                            //         blurRadius: 2.0,
                            //       ),
                            //     ],
                            //     ),
                            //   child: 
                            //   Column(
                            //     children: [
                            //       SizedBox(height: 5,),
                            //       Row(
                            //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            //         children: [
                            //           TextButton(
                            //             onPressed: () {
                            //                 Navigator.push(
                            //                   context,
                            //                   MaterialPageRoute(builder: (context) => HomePageScreen()),
                            //                 );
                            //             },
                            //             child: Text("GunMA Fighter", style: TextStyle(color: bDark),),
                            //           ),
                            //           Container(
                            //             height: 30,
                                        
                            //             decoration: BoxDecoration(
                            //               border: Border(

                            //               left: BorderSide(width: 0.8, color: bGrey),
                            //               ),
                                                                      
                            //             ),
                            //           ),
                            //           TextButton(
                            //             onPressed: () {
                            //                 Navigator.push(
                            //                   context,
                            //                   MaterialPageRoute(builder: (context) => UploadInternSetting()),
                            //                 );
                            //             },
                            //             child: Text("Upload Internship", style: TextStyle(color: bDark),),
                            //           ),
                            //         ],
                            //       ),
                                  
                            //     ],
                            //   ),
                            // ),
              SizedBox(height: 13),
                                  Container(
                                    height: 119,
                                    width: 336,
                                    // width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(0.0, 1.0), //(x,y)
                                          blurRadius: 2.0,
                                        ),
                                      ],
                                      ),
                                    child:
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children:[
                                        SizedBox(height: 8,),
                                        Container(
                                          height: 64,
                                            width: 319,
                                            // width: MediaQuery.of(context).size.width,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5.0),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey,
                                                  offset: Offset(0.0, 1.0), //(x,y)
                                                  blurRadius: 2.0,
                                                ),
                                              ],
                                              ),
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 10.0),
                                                    child: Container(
                                                      width: 33.0,
                                                      height: 33.0,
                                                      decoration: new BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          image: new DecorationImage(
                                                              fit: BoxFit.fill,
                                                              image: new NetworkImage(
                                                                  "https://i.imgur.com/BoN9kdC.png")
                                                          )
                                                      ),                                       
                                                    ),
                                                  ),
                                                  SizedBox(width: 10),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [                                      
                                                      SizedBox(height: 15, width: 10),
                                                      Text('Mon, 19 Februari 2021', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10, color: kPrimaryColor),),      
                                                      SizedBox(height: 5,),
                                                      Text('Hi, Raditya Coustica', style: TextStyle(fontSize: 14, color: bDark), ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                        ),
                                        SizedBox(height: 9),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0),
                                          child: Container(
                                            height: 27,
                                              width: 80,
                                              
                                              // width: MediaQuery.of(context).size.width,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5.0),
                                                color: kPrimaryColor,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey,
                                                    offset: Offset(0.0, 1.0), //(x,y)
                                                    blurRadius: 2.0,
                                                  ),
                                                ],
                                                ),
                                                child: 
                                                 TextButton(
                                                  onPressed: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(builder: (context) => HomePageScreen()),
                                                      );
                                                  },
                                                  child: Text("Edit Profile", style: TextStyle(color: bWhite, fontSize: 10),),
                                                ),
                                          ),
                                        ),
                                      ],
                                      
                                    ),
                                  ),  
          ],
        ),
      ),
    );
  }
}
