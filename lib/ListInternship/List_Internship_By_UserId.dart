// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:gunma/DetailPage/components/divider.dart';
import 'package:gunma/Providers/Internship_byUserId_provider.dart';
import 'package:gunma/UploadInternship/setting_upload.dart';
import 'package:gunma/Widgets/Internship_Card.dart';
import 'package:gunma/Widgets/Internship_Card_ByUserId.dart';
import 'package:gunma/constants.dart';
import 'package:gunma/models/Internship.dart';
import 'package:provider/provider.dart';

class ListUserInternship extends StatefulWidget {
  const ListUserInternship({ Key? key }) : super(key: key);

  @override
  _UploadInternSettingState createState() => _UploadInternSettingState();
}

class _UploadInternSettingState extends State<ListUserInternship> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<UserInternshipProvider>(
      create: (context) => UserInternshipProvider(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text("My Internship"),),
        body: 
        SafeArea(
          child: ListView(
            children: [
                
                SizedBox(height: 20),
                Padding(  
                  padding: const EdgeInsets.only(left: 10.0, right:10),
                  child: 
                Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
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
                                            Navigator.pushReplacement(
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
                                            Navigator.pushReplacement(
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
                                              ],
                                            ),
                                            
                                          ],  
                                        ),
                                      ),
                                    ),
                
              ),
              // SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 24,),
                child: Text("List Of Your Internship", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
              ),
              SizedBox(height: 20,),
              Padding(
              padding: EdgeInsets.only(
              left: 24,
              ),
              child:
              Consumer<UserInternshipProvider>(
              builder: (context, provider, _) => FutureBuilder(
              future: provider.getRecommendedSpaces(),
               builder: (context, snapshot) {
               if (snapshot.hasData) {
                                                     List<Internship>? data = snapshot.data as List<Internship>?;
                                                      return Column(
                                                        children: data!
                                                            .map((item) => UserInternshipCard(item))
                                                            .toList(),
                                                      );
                                                    }
                                                    return Center(
                                                      child: CircularProgressIndicator(),
                                                    );
                                                  },
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
