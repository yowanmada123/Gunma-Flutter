import 'package:flutter/material.dart';
import 'package:gunma/ListInternship/ListInternbyWFH.dart';
import 'package:gunma/constants.dart';
import 'package:gunma/models/WFH.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class SordByWfh extends StatelessWidget {
  final WFH wfh;
  SordByWfh(this.wfh);
  
  @override
  Widget build(BuildContext context) {
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: (){
             getTagId(wfh.id);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ListInternbyWfhScreen()),
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
                  wfh.name,
                ),
              ), 
          ),
        ),
      ],
    );
  }

  getTagId(int tagId) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('isWfh', tagId.toString()); 
      print(prefs.getString('isWfh').toString());
  }
}