import 'package:flutter/material.dart';

class ListTag {
  
  late int id;
  late String name;
 
  ListTag(u,
  {
    required this.id,
    required this.name,
  });

  ListTag.fromJson(json) {
    id = json['id'];
    name = json['tagName'];
  }
}
  
