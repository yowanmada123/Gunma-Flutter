import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gunma/models/Internship.dart';
import 'package:gunma/models/ListTag.dart';
import 'package:http/http.dart' as http;

class TagProvider extends ChangeNotifier{

  getListTag() async{
    var result = await http.get(Uri.parse("https://api.gunma.my.id/api/v1/tag"),
    );
    
    print(result.statusCode);
    print(result.body);

    if (result.statusCode == 200){
        
        List data =  jsonDecode(result.body);
        List<ListTag> spaces = data.map((item) => ListTag.fromJson(item)).toList();
        return spaces;
    }else{
      return <ListTag>[];
    }
  }
}