import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:gunma/Login/login_screen.dart';
import 'package:gunma/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HelpSupportScreen extends StatefulWidget {
  const HelpSupportScreen({ Key? key }) : super(key: key);

  @override
  _HelpSupportScreenState createState() => _HelpSupportScreenState();
}

class _HelpSupportScreenState extends State<HelpSupportScreen> {
   
  @override
  Widget build(BuildContext context) {
  //  Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('Help & Support'), centerTitle: true, 
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back ),
          
        ),
      ),
      body: 
      SafeArea(       
        child: Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: ListView(
                children: [
                  SizedBox(height: 20),
                  Column(
                    children: [
                       SizedBox(height: 30),
                       Image.asset("assets/images/Group-411.png"),
                       SizedBox(height: 25),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 17),
                        child: Text("Informasimu sangat bermanfaat untuk membantu yang lain. Anda telah memberikan kesempatan untuk menambah ilmu dan pengalam tentang bagaimana dunia kerja dan bagaimana berhungan dengan orang lain.", 
                        
                        textAlign: TextAlign.justify,
                        style: TextStyle( height: 1.2,   letterSpacing: 1.0, ),),
                      ),
                      SizedBox(height: 25),
                      
                      Image.asset("assets/images/waimage.png"),
                      SizedBox(height: 15),
                      Text("+62 822-3153-2679", style: TextStyle( fontSize: 20, color: bDark,),),
                      
                      SizedBox(height: 40),
                      Image.asset("assets/images/Group-411.png"),
                      SizedBox(height: 15),
                      Text("gunma.my.id", style: TextStyle( fontSize: 20, color: bDark,),),
                      
                      SizedBox(height: 40),
                      Image.asset("assets/images/gmail.png"),
                      SizedBox(height: 15),
                      Text("gunma@gmail.com", style: TextStyle( fontSize: 20, color: bDark,),),
                      SizedBox(height: 15)  
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
