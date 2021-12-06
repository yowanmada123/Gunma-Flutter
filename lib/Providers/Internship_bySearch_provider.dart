import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gunma/models/Internship.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ListInternbySearchProvider extends ChangeNotifier{

  getRecommendedSpaces() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    print(prefs.getString('search').toString());
    
    var hint = prefs.getString('search').toString();
    var result = await http.get(Uri.parse("https://api.gunma.my.id/api/v1/internship/search/" + hint),
    
    );

    print(hint);  
    print(result.statusCode);
    print(result.body);
    print ("Auouo");
    if (result.statusCode == 200){
        
        List data = jsonDecode(result.body);
        List<Internship> spaces = data.map((item) => Internship.fromJson(item)).toList();
        return spaces;
    }else{
      return <Internship>[];
    }
  }
}