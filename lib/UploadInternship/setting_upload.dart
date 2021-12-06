// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:gunma/DetailPage/components/divider.dart';
import 'package:gunma/HomePage/components/bottom_navigation_bar.dart';
import 'package:gunma/HomePage/home_screen.dart';
import 'package:gunma/ProfilePage/setting_profile.dart';
import 'package:gunma/Providers/Internship_byUserId_provider.dart';
import 'package:gunma/ListInternship/List_Internship_By_UserId.dart';
import 'package:gunma/UploadInternship/upload_intern_screen.dart';
import 'package:gunma/Widgets/Internship_Card.dart';
import 'package:gunma/constants.dart';
import 'package:gunma/models/Internship.dart';
import 'package:provider/provider.dart';

class UploadInternSetting extends StatefulWidget {
  const UploadInternSetting({ Key? key }) : super(key: key);

  @override
  _UploadInternSettingState createState() => _UploadInternSettingState();
}

class _UploadInternSettingState extends State<UploadInternSetting> {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<UserInternshipProvider>(
      create: (context) => UserInternshipProvider(),
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
                onTap: () {  
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => BottomNavigation(),
                  )
                  );
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 24,
                ),
            ),
          backgroundColor: kPrimaryColor,
          title: Text("Setting of Internship"),),
        body: 
        SafeArea(
          child: ListView(
            children: [
                SizedBox(height: 20),
                // SizedBox(height: 13),
                Padding(  
                  padding: const EdgeInsets.only(left: 10.0, right:10),
                  child: 
                Container(
                height: 260,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
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
                                      Container(
                                        child: Column(
                                          children: [
                                            Column(
                                              children: [
                                                 Container(
                              height: 60,
                               width: MediaQuery.of(context).size.width,
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
                                children: [
                                  SizedBox(height: 5,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => UploadInternSetting()),
                                            );
                                        },
                                        child: Text("Upload Form", style: TextStyle(color: bDark),),
                                      ),
                                      Container(
                                        height: 30,
                                        
                                        decoration: BoxDecoration(
                                          border: Border(

                                          left: BorderSide(width: 0.8, color: bGrey),
                                          ),
                                                                      
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => ListUserInternship()),
                                            );
                                        },
                                        child: Text("List of Your Internship", style: TextStyle(color: bDark),),
                                      ),
                                    ],
                                  ),
                                  
                                ],
                              ),
                            ),
                                                SizedBox(height: 40),
                                                Text('Share Your Information', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, ),),
                                                SizedBox(height: 20),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
                                                  child: Text('Your Information is very important for the other. You give them a chance to get more knowledge about how is the world of work and how to relate with the other people.', 
                                                  style: TextStyle(fontSize: 12, 
                                                  
                                                  ),
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 5,
                                                  ),
                                                ),
                                                SizedBox(height: 20),
                                                Container(
                                                  height: 36,
                                                    width: 142,
                                                    
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
                                                              MaterialPageRoute(builder: (context) => UploadInternPage()),
                                                            );
                                                        },
                                                        child: Text("Start Upload", style: TextStyle(color: bWhite, fontSize: 15),),
                                                      ),
                                                ),
                                                
                                              ],
                                            ),
                                            
                                          ],
                                        ),
                                      ),
                                    ),
                
              ),                                                          
            ],
          ),
        ),
      ),
    );
  }
}
