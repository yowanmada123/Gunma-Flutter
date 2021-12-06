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

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({ Key? key }) : super(key: key);

  @override
  _PrivacyPolicyScreenState createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
   
  @override
  Widget build(BuildContext context) {
  //  Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('Privacy & Policy'), centerTitle: true, 
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
            child: ListView(
              children: [
                SizedBox(height: 20),
                Column(
                  children: [
                     SizedBox(height: 30),
                     Center(
                       child: Text("Kebijakan Informasi Pribadi", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                     ),
                     SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 17),
                      child: Text("Kerahasiaan Informasi Pribadi adalah yang penting bagi GunMA (Kami). Kami berkomitmen untuk melindungi dan menghormati privasi pengguna (Anda)  saat mengakses dan menggunakan fitur, teknologi, konten, dan produk yang Kami sediakan di aplikasi dan situs website Kami (selanjutnya, secara bersama - sama disebut sebagai Platform). Kebijakan Privasi ini mengatur landasan dasar mengenai bagaimana Kami menggunakan informasi pribadi yang Kami terima dari Anda Kebijakan Informasi Pribadi (Informasi Pribadi). Kebijakan Privasi ini berlaku bagi seluruh pengguna Platform, kecuali diatur dalam Kebijakan Privasi yang terpisah, Mohon membaca Kebijakan Informasi Pribadi Kami dengan seksama sehingga Anda dapat memahami pendekatan dana cara Kami dalam menggunakan informasi tersebut. Kebijakan privasi ini mencakup hal - hal sebagai berikut: ", 
                      
                      textAlign: TextAlign.justify,
                      style: TextStyle( height: 1.2,   letterSpacing: 1.0, ),),
                    ),
                    SizedBox(height: 25),
                    
                     SizedBox(height: 5),
                    //  Padding(
                    //   padding: const EdgeInsets.all(7.0),
                    //   child: Text("Menampung informasi magang dan memberikan kesempatan kepada setiap yang berprestasi untuk mendapatkan pengalaman dalam hal hard skill dan soft skill", 
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle( height: 1.2,   letterSpacing: 1.0, ),),
                    // ),
                  ],
                ),
              ],
            ),
        )    
      ),  
            
    );
  }
  
}
