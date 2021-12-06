import 'package:flutter/material.dart';
import 'package:gunma/ListInternship/ListInternbyLocation_screen.dart';
import 'package:gunma/constants.dart';
import 'package:gunma/models/City.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CityCard extends StatelessWidget {
  final City city;

  CityCard(this.city);

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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Container(
            height: 100,
            width: 140,
            color: Color(0xffE7E6E6),
            child: 
            Column(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      city.imageUrl,
                      width: 140,
                      height: 90,
                      fit: BoxFit.cover,           
                    ),
                  ],
                ),
                SizedBox(height: 10,),   
                Text(
                  city.name,
                  style: regularPoppins.copyWith(
                    fontSize: 16, color: bDarkText
                  ),
                  ),
              ],
            ),
        ),
      ),
      
    );
  }
  getLocationId(int id) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('location', id.toString()); 
      // await prefs.setString('locationNAme', location.toString()); 
      print(prefs.getString('location').toString());
  }
}