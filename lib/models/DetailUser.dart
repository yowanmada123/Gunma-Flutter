import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class User {
  final int userId;
  final String name;
  final String email;
  final String? description;
  final String? address;
  final String? phone;
  
  User({
    required this.userId, 
    required this.name,
    required this.email,  
    required this.description,
    required this.address, 
    required this.phone,   

  }); 

  factory User.fromJson(Map<String, dynamic> json) {
    return User(

      userId: json['id'],
      name: json['name'],
      email: json['email'],
      description: json['description'],
      phone: json['phoneNumber'],
      address: json['address'],
    );
  }

  static Future<User> fetchUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("TOKEN : " + prefs.getString('login').toString());
    final response = await http.get(
    // final response = await http.post(
      Uri.parse("https://api.gunma.my.id/api/v1/detail-profile"),    
      // Send authorization headers to the backend.
      headers: {
          HttpHeaders.authorizationHeader: 'Bearer ' + prefs.getString('login')!,
      },
    );
    print(response.body);
    var responseJson = jsonDecode(response.body);
    var userData = (responseJson as Map<String, dynamic>)['data'];
    print(userData);
    print(prefs.getString('login'));
    return User.fromJson(userData);
  }
}