import 'package:flutter/material.dart';
import 'package:gunma/ListInternship/ListInternbyLocation_screen.dart';
import 'package:gunma/constants.dart';
import 'package:gunma/models/City.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class SordByCity extends StatelessWidget {
  final City city;
  SordByCity(this.city);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
         getLocationId(city.id);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ListInternbyLocationScreen()),
        );
      },
      child: Column(
              children: [
                Row(
                  children: [ 
                    Text(
                      city.name,
                    ),
                    SizedBox(width: 30,),
                    ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(city.imageUrl, height: 50, width: 50,fit: BoxFit.cover,)),  
              ],
                )
              ]
            ),
    );
  }
  getLocationId(int id) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('location', id.toString()); 
      print(prefs.getString('location').toString());
  }
}