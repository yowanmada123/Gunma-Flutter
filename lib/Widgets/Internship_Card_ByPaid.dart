import 'package:flutter/material.dart';
import 'package:gunma/ListInternship/ListInternbyPaid_screen.dart';
import 'package:gunma/constants.dart';
import 'package:gunma/models/Paid.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class SordByPaid extends StatelessWidget {
  final Paid paid;
  SordByPaid(this.paid);
  
  @override
  Widget build(BuildContext context) {
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: (){
             getTagId(paid.id);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ListInternbyPaidScreen()),
            );
          },
          child: Container(  
            height: 30, width: 60,   
            decoration : BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: bGrey
              )
            ),
            child: 
              Center(
                child: Text(
                  paid.name,
                ),
              ), 
          ),
        ),
      ],
    );
  }

  getTagId(int tagId) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('isPaid', tagId.toString()); 
      print(prefs.getString('isPaid').toString());
  }
}