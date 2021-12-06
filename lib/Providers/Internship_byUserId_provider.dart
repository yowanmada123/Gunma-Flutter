import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gunma/models/Internship.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class UserInternshipProvider extends ChangeNotifier{

  getRecommendedSpaces() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // print("TOKEN : " + prefs.getString('login').toString());

    final response = await http.get(
      Uri.parse("https://api.gunma.my.id/api/v1/detail-profile"),    
      // Send authorization headers to the backend.
      headers: {
          HttpHeaders.authorizationHeader: 'Bearer ' + prefs.getString('login')!,
      },
    );
    var responseJson = jsonDecode(response.body);
    var userId = (responseJson as Map<String, dynamic>)['data']['id'];

    var result = await http.get(Uri.parse("https://api.gunma.my.id/api/v1/internship/user/" + userId.toString()),
    // var result = await http.get(Uri.parse("http://api.gunma.my.id/api/v1/internship"),

    // headers: {
    //       HttpHeaders.authorizationHeader: 'Bearer ' + prefs.getString('login')!,
    //   },
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