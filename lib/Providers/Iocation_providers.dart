import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gunma/models/Internship.dart';
import 'package:http/http.dart' as http;

class LocationProvider extends ChangeNotifier{

  getRecommendedLocation() async{
    var result = await http.get(Uri.parse("https://api.gunma.my.id/api/v1/location"),
    );
    
    print(result.statusCode);
    // 200 = true, 404 = false
    print(result.body);

    if (result.statusCode == 200){
        
        List data =  jsonDecode(result.body);
        List<Internship> spaces = data.map((item) => Internship.fromJson(item)).toList();
        return spaces;
    }else{
      return <Internship>[];
    }
  }
}