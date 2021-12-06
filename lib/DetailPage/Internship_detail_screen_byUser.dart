import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gunma/DetailPage/components/divider.dart';
import 'package:gunma/UpdateInternship/Update_Internship.dart';
import 'package:gunma/ListInternship/List_Internship_By_UserId.dart';
import 'package:gunma/models/Internship.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import 'package:gunma/constants.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class UserInternshipDetailScreen extends StatelessWidget {
  // const DetailScreen({ Key? key }) : super(key: key);

  final Internship intern;

  UserInternshipDetailScreen(this.intern);
  
  @override
  Widget build(BuildContext context) {

    var closeRegistration = intern.closeRegistration.split(" ");
    DateTime dt = DateTime.parse(closeRegistration[0]);
    final DateFormat formatter = DateFormat('dd MMMM yyyy');
    final String formattedDate = formatter.format(dt);

    launchUrl(String url) async{
      if (await canLaunch(url)){
        launch(url);
      }
      else{
        throw(url);
      }
    } 
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('Internship Detail'), centerTitle: true, 
        leading: IconButton(
          onPressed: () {
             Navigator.pop(context
                        );
          },
          icon: Icon(Icons.arrow_back ),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            ListView(
              children: [
                SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                        ),
                        color: bWhite,
                        ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 260,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFC8C5C5)),
                        borderRadius: BorderRadius.circular(20),
                          color: bWhite,
                          ),
                      child: Padding(
                      padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      ),

                      child: Row(
                        children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                //  Image.asset('assets/images/intern_ss.png',
                                //     // width: MediaQuery.of(context).size.width,
                                //     width: 140,
                                //     height: 183,
                                //     fit: BoxFit.cover,
                                //  ),
                                //  Image.network(
                                //   space.imageUrl,
                                //   width: 140,
                                //     height: 183,
                                //   fit: BoxFit.cover,
                                // ),
                              ],
                            ),
                            Column(                         
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 15),
                                
                                Padding(
                                  padding: const EdgeInsets.only(left: 80.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      intern.imageUrl,
                                      width: 140,
                                        height: 183,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20,),
                                Text('Posted by', style: TextStyle(fontSize: 14, color: Color(0xFF000000)), ),
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Container(
                                      width: 33.0,
                                      height: 33.0,
                                      decoration: new BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: new DecorationImage(
                                              fit: BoxFit.fill,
                                              image: new NetworkImage(
                                                  'https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2020/08/19/3796772896.jpg')
                                          )
                                      ),                                       
                                    ),
                                    SizedBox(width: 10,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [                                      
                                        SizedBox(height: 5, width: 10),
                                        Text(intern.postedBy, style: TextStyle(fontSize: 12, color: Color(0xFF4C4C4C)),),      
                                        SizedBox(height: 5,),
                                        Text(intern.email, style: TextStyle(fontSize: 11, color: Color(0xff929090)), ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                HorizontalDivider(),
                                SizedBox(height: 10,),
                                Text('Nama Program', style: TextStyle(fontSize: 12, color: Color(0xFF5A5757), fontWeight: FontWeight.bold), ),
                                SizedBox(height: 8,),
                                Text(intern.programName, style: TextStyle(fontSize: 12, color: Color(0xFF000000), fontWeight: FontWeight.bold),),            
                                SizedBox(height: 10,),
                                HorizontalDivider(),
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Image.asset('assets/images/icon_schedule.png', height: 14, width: 14,),
                                    SizedBox(width: 10,),
                                     Text('Jadwal Magang', style: TextStyle(fontSize: 12, color: Color(0xFF000000), fontWeight: FontWeight.bold),),        
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Durasi', style: TextStyle(fontSize: 9, color: Color(0xFFB7B5B5), fontWeight: FontWeight.bold),),
                                        SizedBox(height: 5,),
                                        Text(intern.duration.toString() + " Bulan", style: TextStyle(fontSize: 10, color: Color(0xFF4C4C4C), fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                    SizedBox(width: 10,),                                
                                    Container(
                                      width: 0,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        border: Border(
                                          left: BorderSide(width: 1.0, color: Color(0xFFE4E4E4)),
                                        ),
                                      
                                      ),
                                    ),               
                                    SizedBox(width: 10,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Start', style: TextStyle(fontSize: 9, color: Color(0xFFB7B5B5), fontWeight: FontWeight.bold),),
                                        SizedBox(height: 5,),
                                        Text('-', style: TextStyle(fontSize: 10, color: Color(0xFF4C4C4C), fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                    SizedBox(width: 10,),
                                    Container(
                                      width: 0,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        border: Border(
                                          left: BorderSide(width: 1.0, color: Color(0xFFE4E4E4)),
                                        ),                                  
                                      ),
                                    ),
                                    SizedBox(width: 10,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Penutupan Registrasi', style: TextStyle(fontSize: 9, color: Color(0xFFB7B5B5), fontWeight: FontWeight.bold),),
                                        SizedBox(height: 5,),
                                        Text(formattedDate, style: TextStyle(fontSize: 10, color: Color(0xFF4C4C4C), fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10,),                                                                                                          
                                Container(
                                  width: 300,
                                  height: 0,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      top: BorderSide(width: 1.0, color: Color(0xFFE5DCDC)),
                                    ),
                                   
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Image.asset('assets/images/icon_location.png', height: 15, width: 15,),
                                    SizedBox(width: 10,),
                                     Text('Lokasi', style: TextStyle(fontSize: 9, color: Color(0xFF000000), fontWeight: FontWeight.bold),),        
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Text(intern.location_id, style: TextStyle(fontSize: 12, color: Color(0xFF4C4C4C), fontWeight: FontWeight.normal), ),
                                SizedBox(height: 10,),
                                HorizontalDivider(),    
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Image.asset('assets/images/icon_description.png', height: 14, width: 14,),
                                    SizedBox(width: 10,),
                                     Text('Deskripsi', style: TextStyle(fontSize: 12, color: Color(0xFF000000), fontWeight: FontWeight.bold),),        
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  width:300,
                                  child: Text(intern.description,
                                    style: TextStyle(fontSize: 12, 
                                    color: Color(0xFF4C4C4C), 
                                    fontWeight: FontWeight.normal),
                                    overflow: TextOverflow.ellipsis,
                                    // maxLines: 40,
                                  ),
                                ),
                                 
                                SizedBox(height: 10,),
                                HorizontalDivider(),
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Image.asset('assets/images/icon_benefit.png', height: 14, width: 14,),
                                    SizedBox(width: 10,),
                                     Text('Manfaat', style: TextStyle(fontSize: 12, color: Color(0xFF000000), fontWeight: FontWeight.bold),),        
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  width:300,
                                  child: Text(intern.benefit, 
                                  style: TextStyle(fontSize: 12, 
                                  color: Color(0xFF4C4C4C), 
                                  fontWeight: FontWeight.normal, ),
                                  overflow: TextOverflow.ellipsis,
                                  ),
                
                                  ),
                                SizedBox(height: 10,),
                                Container(
                                  width: 300,
                                  height: 0,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      top: BorderSide(width: 1.0, color: Color(0xFFE5DCDC)),
                                    ),
                                   
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Image.asset('assets/images/icon_requirement.png', height: 14, width: 14,),
                                    SizedBox(width: 10,),
                                     Text('Persyaratan', style: TextStyle(fontSize: 12, color: Color(0xFF000000), fontWeight: FontWeight.bold),),        
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  width: 300,
                                  child: Text(intern.requirement, 
                                  style: TextStyle(fontSize: 12, 
                                  color: Color(0xFF4C4C4C), 
                                  fontWeight: FontWeight.normal),
                                  overflow: TextOverflow.ellipsis,
                                  // maxLines: 40,
                                  )
                                  ),
                                SizedBox(height: 10,),  
                                HorizontalDivider(),                       
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Image.asset('assets/images/icon_requirement.png', height: 14, width: 14,),
                                    SizedBox(width: 10,),
                                     Text('sistem Gaji', style: TextStyle(fontSize: 12, color: Color(0xFF000000), fontWeight: FontWeight.bold),),        
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  
                                  width: 300,
                                  child: Text(    
                                  intern.pay ==  '1' ? "Paid" : "Unpaid", 
                                  style: TextStyle(fontSize: 12, 
                                  color: Color(0xFF4C4C4C), 
                                  fontWeight: FontWeight.normal),
                                  overflow: TextOverflow.ellipsis,
                                  )
                                  ),
                                SizedBox(height: 10,),
                                HorizontalDivider(),    
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Image.asset('assets/images/icon_requirement.png', height: 14, width: 14,),
                                    SizedBox(width: 10,),
                                    Text('Sistem Kerja', style: TextStyle(fontSize: 12, color: Color(0xFF000000), fontWeight: FontWeight.bold),),        
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  width: 300,
                                  child: Text(intern.work == '1' ? "Work From Home" : "Work From Office", 
                                  style: TextStyle(fontSize: 13, 
                                  color: Color(0xFF4C4C4C), 
                                  fontWeight: FontWeight.normal),
                                  overflow: TextOverflow.ellipsis,
                                  )
                                  ),
                                SizedBox(height: 10,),
                                HorizontalDivider(),               
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Image.asset('assets/images/icon_description.png', height: 14, width: 14,),
                                    SizedBox(width: 10,),
                                     Text('Fasilitas Training', style: TextStyle(fontSize: 12, color: Color(0xFF000000), fontWeight: FontWeight.bold),),        
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  width:300,
                                  child: Text(intern.description,
                                    style: TextStyle(fontSize: 12, 
                                    color: Color(0xFF4C4C4C), 
                                    fontWeight: FontWeight.normal),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(height: 30,),
                                Container(
                                    child: Row(
                
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        SizedBox(width: 10,),
                                        Container(
                                                height: 40,
                                                width: 100,                                              
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(15),
                                                  color: Colors.red,
                                                  border: Border.all(
                                                    color: Colors.red,
                                                    // width: 5,
                                                  )
                                                ),
                                                child: 
                                                TextButton(
                                                  child:Text("Delete",style: TextStyle(fontWeight: FontWeight.bold, color: bWhite, fontSize: 20), ),                                              
                                                  onPressed: () => 
                                                  showDialog<String>(
                                                    context: context,
                                                    builder: (BuildContext context) => CupertinoAlertDialog(
                                                      title: const Text('Did You Really \nWant to Delete This Information ?'),
                                                      // content: const Text('AlertDialog description'),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          onPressed: () => Navigator.pop(context, 'Cancel'),
                                                          child: const Text('Cancel'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () async {
                                                            await delete(intern.id.toString(), context);
                                                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                             builder: (context) => ListUserInternship(),
                                                            )
                                                            );

                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                            SnackBar(content: Text("information Deleted")));
                                                          }, 
                                                          child: const Text('Yes', style: TextStyle(color: Colors.red)),
                                                        ),
                                                      ],
                                                    ),
                                                  ),                             
                                                ),
                                        ),
                                        SizedBox(width: 10,),
                                        Container(
                                                height: 40,
                                                width: 170,
                                                child: RaisedButton( 
                                                  onPressed: () async {
                                                    Navigator.push(
                                                          context, MaterialPageRoute(builder: (context) =>UpdateInternPage(intern)));
                                                  },
                                                  color: kPrimaryColor,
                                                  shape: RoundedRectangleBorder(
                                                     borderRadius: BorderRadius.circular(15),
                                                  ),
                                                  child: Text('Edit', style: TextStyle(fontWeight: FontWeight.bold, color: bWhite, fontSize: 20), ),                                                  
                                                ),
                                        ),
                                        
                                      ],
                                    ),
                                    
                                  ),
                                  
                                // ),
                                SizedBox(height: 20,),
                              ],
                            ),
                            
                          // ),
                        ],
                      ),
                    ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),

              ],
            ),
            Container(
              height: 3,
              width: MediaQuery.of(context).size.width,
              color: bWhite,

            ),

          ],
        ),

      ),
    );
  }

  static Future<void> delete(String id, BuildContext context) async {
    final response = await http.delete(
      Uri.parse("https://api.gunma.my.id/api/v1/internship/" + id),    
    );
    print(response.body);
    if(response.statusCode == 200){
        print("Information Deleted");
         ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Information Was Deleted")));
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => ListUserInternship(),
        )
        );      
    }else{
        ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Delete not Successfull")));
    }
  }
  
}
