import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gunma/DetailPage/Internship_detail_screen.dart';
import 'package:gunma/constants.dart';
import 'package:gunma/models/Internship.dart';
import 'package:intl/intl.dart';

class InternshipCard extends StatelessWidget {

  // const SpaceCard({ Key? key }) : super(key: key);
  final Internship intern;
  InternshipCard(this.intern);

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
                builder: (context) => InternshipDetailScreen(intern),
              ),
            );
      }, 
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
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
                                     Image.network(
                                      intern.imageUrl,
                                      width: 140,
                                        height: 170,
                                      fit: BoxFit.cover,
                                    ),
                                  ],
                                ),
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
                        
                        Text('Deskripsi : ', 
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
                            height:25,
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
                        Text.rich(
                          TextSpan(
                            text: 'Kategori : ', style: TextStyle(color: bGrey, fontSize: 13, fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                text: intern.tag_id.toString(), style: TextStyle(color: bDarkText, fontSize: 13, fontWeight: FontWeight.w600)
                              ),
                            
                            ] 
                          ),
                      ), 
                            
                      SizedBox(height: 5,),
                      Text('Penutupan Registrasi : ', 
                        style: 
                        TextStyle(
                          color: bGrey, 
                          fontSize: 13
                          , fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 3,),
                          Container(                       
                            width:182,
                            height:15,
                            child:
                            // formatDate(), 
                            Text(
                              formattedDate,
                              style: 
                              TextStyle(
                              color: bDarkText, 
                              fontSize: 13
                              , fontWeight: FontWeight.w600),
                              overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            ),                    
                          ),
                      // Text.rich(
                      //     TextSpan(
                      //       text: 'Penutupan Registrasi  : ', style: TextStyle(color: bGrey, fontSize: 13, fontWeight: FontWeight.bold),
                      //       children: [
                      //         TextSpan(
                                
                      //           text: closeRegistration[0], style: TextStyle(color: bDark, fontSize: 13, fontWeight: FontWeight.w600),
                                
                      //         ),
                      //       ] 
                      //     ),
                      //   ),
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
              SizedBox(height: 10,),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),    
    );
  }
}