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

class AboutAppScreen extends StatefulWidget {
  const AboutAppScreen({ Key? key }) : super(key: key);

  @override
  _AboutAppScreenState createState() => _AboutAppScreenState();
}

class _AboutAppScreenState extends State<AboutAppScreen> {
   
  @override
  Widget build(BuildContext context) {
  //  Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('About App'), centerTitle: true, 
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
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          // height: 200, 
                          child: Text("GunMA adalah aplikasi yang membantu siswa khususnya siswa SMA dan mahasiswa S1 untuk mendapatkan informasi yang lengkap dan detail tentang magang", 
                          
                          textAlign: TextAlign.justify,
                          style: TextStyle( 
                            height: 1.2,   
                          letterSpacing: 1.0, 
                          ),),
                        ),
                      ),
                      SizedBox(height: 25),
                      Text("VISION", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: bDark,),),
                      SizedBox(height: 25),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 17),
                        child: Container(
                          child: Text("Mempermudah seseorang untuk mendapatkan tempat magang sesuai dengan yang diinginkannya", 
                         
                          textAlign: TextAlign.justify,
                          style: TextStyle( height: 1.2,   letterSpacing: 1.0, ),),
                        ),
                      ),
                      SizedBox(height: 25),
                      Text("MISSION", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: bDark,),),
                      SizedBox(height: 25),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 17),
                        child: Container(
                          child: Text("Memberikan layanan terkait magang untuk memberikan kesempatan kepada generasi muda untuk mengasah keterampilannya", 
                         
                          textAlign: TextAlign.justify,
                          style: TextStyle( height: 1.2,   letterSpacing: 1.0, ),),
                        ),
                      ),
                       SizedBox(height: 5),
                       Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 17),
                        child: Container(
                          child: Text("Menampung informasi magang dan memberikan kesempatan kepada setiap yang berprestasi untuk mendapatkan pengalaman dalam hal hard skill dan soft skill", 
                         
                          textAlign: TextAlign.justify,
                          style: TextStyle( height: 1.2,   letterSpacing: 1.0, ),),
                        ),
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
