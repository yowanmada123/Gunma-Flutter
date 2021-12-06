
import 'package:flutter/cupertino.dart';

class User {
  late final int id;
  // late String imagePath;
  late String name;
  late String email;
  late String description;
  late String address;
  late String phone;
  
  User(u, 
  {
    required this.id,
    // required this.imagePath,
    required this.name,
    required this.email,
    required this.description,
    required this.address,
    required this.phone,   
  });

  User.fromJson(json,) {
    id = json['data']['id'];
    // imagePath = json['data']['name'];
    name = json['data']['name'];
    email = json['data']['email'];
    description = json['data']['description'];
    address = json['data']['address'];
    phone = json['data']['phoneNumber'];

  }

}