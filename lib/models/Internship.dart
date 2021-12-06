// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';

class Internship {
  // final Map<String, dynamic> data;
  late int id; 
  late String postedBy;
  late String email;
  late String imageUrl;
  late String location_id;
  // late int image_id;
  late int user_id;
  late String tag_id;
  late String programName; 
  late String description;
  late String benefit;
  late String requirement;
  late String registrationLink;
  late String isOpen;
  late int duration;
  late String closeRegistration; 
  // late String openRegistration;
  late String created_at;
  late String updated_at;
  late String pay;
  late String work;
  // late String trainingSkill;
  
  Internship(u, 
  {
    // required this.data,
    required this.id,
    required this.postedBy,
    required this.email,
    required this.imageUrl,
    required this.location_id,
    // required this.image_id,
    required this.user_id,
    required this.tag_id,
    required this.programName,   
    required this.description, 
    required this.benefit,
    required this.requirement,
    required this.registrationLink,
    required this.isOpen,
    required this.duration,
    required this.closeRegistration,
    // required this.openRegistration,
    required this.created_at,
    required this.updated_at,
    // required this.
    required this.pay,
    required this.work,
    // required this.trainingSkill,
  });

  Internship.fromJson(json) {
    id = json['id'];
    postedBy = json['user']['name'];
    email = json['user']['email'];
    imageUrl = json['imageUrl'];
    location_id = json['location']['locationName'];
    // image_id = json['image_id'];
    user_id = json['user_id'];
    tag_id = json['tag']['tagName'];
    programName = json['programName'];
    description = json['description'];
    benefit = json['benefit'];
    requirement = json['requirement'];
    registrationLink = json['registrationLink'];
    isOpen = json['isOpen'];
    duration = json['duration'];
    closeRegistration = json['closeRegistration'];
    // openRegistration = json['openRegistration'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    pay = json['isPaid'];
    work = json['isWfh'];
    // trainingSkill = json['trainingSkill'];
  }

}