import 'package:flutter/material.dart';
import 'package:gunma/ListInternship/ListInternbyTagName_screen.dart';
import 'package:gunma/constants.dart';
import 'package:gunma/models/ListTag.dart';
import 'package:gunma/models/Tag.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class SordByTag extends StatelessWidget {
  final ListTag tag;
  SordByTag(this.tag);

  
  @override
  Widget build(BuildContext context) {
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: (){
             getTagId(tag.id);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ListInternbyTagScreen()),
            );
          },
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Container(
                            // decoration: BoxDecoration(
                            //   borderRadius: BorderRadius.circular(5),
                            //   border: Border.all(color: bGrey)
                            // ),
                            child: Text(
                              tag.name,
                            ),
                          ),
                        ),
                        
                      ],
                    ),
        ),

        SizedBox(height: 10,),
        horizontalDivider(context),
        SizedBox(height: 10,),
      ],
    );
  }

  getTagId(int tagId) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('tagId', tagId.toString()); 
      print(prefs.getString('tagId').toString());
  }

  horizontalDivider(BuildContext context){
    return Container(
      // width: MediaQuery.of(context).size.width,
      width: 360,
      height: 0,
      decoration: BoxDecoration(
      border: Border(
      top: BorderSide(width: 1.0, color: Color(0xFFE5DCDC)),
      ),
                                   
     ),
    );
  }
}