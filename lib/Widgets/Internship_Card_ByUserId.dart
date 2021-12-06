import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gunma/DetailPage/Internship_detail_screen_byUser.dart';
import 'package:gunma/constants.dart';
import 'package:gunma/models/Internship.dart';
import 'package:intl/intl.dart';

class UserInternshipCard extends StatelessWidget {

  // const SpaceCard({ Key? key }) : super(key: key);
  
  final Internship intern;
  UserInternshipCard(this.intern);

  @override
  Widget build(BuildContext context) {
    var closeRegistration = intern.closeRegistration.split(" ");
    DateTime dt = DateTime.parse(closeRegistration[0]);
    final DateFormat formatter = DateFormat('dd MMMM yyyy');
    final String formattedDate = formatter.format(dt);
    
    return InkWell(
      onTap: (){
        Navigator.push(
              context, 

              MaterialPageRoute(
                builder: (context) => UserInternshipDetailScreen(intern),
              ),
            );
      }, 
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container (
                  height: 170,
                  width: 118,
                  child: 
                  Stack(
                    children: [
                      SizedBox(height: 5,),
                      Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    //  Image.asset(space.imageUrl,
                                    //     // width: MediaQuery.of(context).size.width,
                                    //     width: 140,
                                    //     height: 155,
                                    //     fit: BoxFit.cover,
                                    //  ),
                                     Image.network(
                                      intern.imageUrl,
                                      width: 140,
                                        height: 170,
                                      fit: BoxFit.cover,
                                    ),
                                  ],
                                ),
                     
                      // city.isPopuler ? 
                      Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              width: 70,
                              height: 30,
                              decoration: BoxDecoration(color: kPrimaryColor, 
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                )                     
                              ),                     
                              child: 
                              Center(
                                child: 
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/star.png', 
                                      height: 15, 
                                      width: 30,
                                      
                                    ), 
                                    Text("4/5", 
                                    style: 
                                    TextStyle(
                                      color: bWhite,
                                      fontSize: 14, 
                                      ),
                                      ),
                                  ],
                                )
                                
                              ),
                              
                            ),
                          ) 
                          // : Container(), 
                    ],
                  ),
                ),
              ),
    
              SizedBox(width: 20,), 
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                        Text(
                          intern.programName, 
                        style: 
                        TextStyle(
                          color: bDarkText,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          
                        ),
                         overflow: TextOverflow.ellipsis,
                         maxLines: 1,
                       
                        ),
                        
                        SizedBox(height: 10,),
                        
                        Text('Description : ', 
                        style: 
                        TextStyle(
                          color: bGrey, 
                          fontSize: 13
                          , fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 5,),
                          Container(                       
                            width:182,
                            height:30,
                            // color: bGreyt,
                            child: Text(intern.description, 
                            style: 
                        TextStyle(
                              color: bDarkText, 
                              fontSize: 13
                              , fontWeight: FontWeight.w600),
                              overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            ),                    
                          ),
                         /////////////////////////////////////////      WITH TET RICH
                        // SizedBox(height: 5,),
                        // Text("Category: "),
                        Text.rich(
                          TextSpan(
                            text: 'Category    : ', style: TextStyle(color: bGrey, fontSize: 13, fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                text: intern.tag_id.toString(), style: TextStyle(color: bDarkText, fontSize: 13, fontWeight: FontWeight.w600)
                              ),
                            
                            ] 
                          ),
                      ), 
                              /////////////////////////////////////////
                      SizedBox(height: 5,),
                      Text.rich(
                          TextSpan(
                            text: 'Close Reg  : ', style: TextStyle(color: bGrey, fontSize: 13, fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                
                                text: formattedDate, style: TextStyle(color: bDark, fontSize: 13, fontWeight: FontWeight.w600),
                                
                              ),
                            ] 
                          ),
                        ),
                      SizedBox(height: 5,),
                    Text.rich(
                        TextSpan(
                          text: 'Durasi : ', style: TextStyle(color: bGrey, fontSize: 13, fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                        text: intern.duration.toString() + " Bulan", style: TextStyle(color: bDark, fontSize: 13, fontWeight: FontWeight.w600)
                            ),
                          ] 
                        ), 
                    ),
                    ],
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}