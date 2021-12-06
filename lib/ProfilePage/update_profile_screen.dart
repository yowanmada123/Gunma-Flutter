import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gunma/ProfilePage/profile_screen.dart';
import 'package:gunma/models/DetailUser.dart';
import 'package:http/http.dart' as http;
import 'package:gunma/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';


class UpdateProfileScreen extends StatefulWidget {
  @override
  _UpdateProfileScreenState createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  var NameController =  TextEditingController()..text;
  var EmailController =  TextEditingController()..text;
  var PhoneController =  TextEditingController()..text;
  var AddressController =  TextEditingController()..text;
  var DescriptionController =  TextEditingController()..text;
  
  @override
  Widget build(BuildContext context){
        return Scaffold(    
            appBar: AppBar(
            backgroundColor: kPrimaryColor,
            title: Text("Update Profile"),),
            body: FutureBuilder<User>(
              future: User.fetchUser(),
              builder: (context, orang) {
                if(orang.connectionState == ConnectionState.done){
                  return ListView(
                      physics: BouncingScrollPhysics(),
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        
                        // ProfileWidget(
                        //   imagePath: 'assets/image/FotoWajah.jpeg',
                        //   // imagePath: 
                        //   onClicked: () async {
                        //     await Navigator.of(context).push(
                        //       MaterialPageRoute(builder: (context) => EditProfilePage()),
                        //     );
                        //     setState(() {});
                        //   },
                        // ),
                        // SizedBox(
                        //   height: 15,
                        // ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name',
                                style: TextStyle(fontSize: 14, color: Color(0xff737373)),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                          height:50,
                                          decoration: BoxDecoration(
                                            color: Color(0xffFFFAFA),
                                            border: Border.all(
                                            color: bBlack,// set border color
                                            width: 1.0),  
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 8,
                                            ),
                                            child: TextFormField(                                            
                                              decoration: InputDecoration(
                                                // label: Text(orang.data != null ? orang.data!.name : ""),
                                                border: InputBorder.none,
                                                  focusedBorder: InputBorder.none,
                                                  enabledBorder: InputBorder.none,
                                                  errorBorder: InputBorder.none,
                                                  disabledBorder: InputBorder.none,
                                              ),
                                              controller: NameController =  TextEditingController()..text= orang.data != null ? orang.data!.name : "",                       
                                            ),
                                          ),
                                        ),
                            ],
                          ),
                        ),  
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Email',
                                style: TextStyle(fontSize: 14, color: Color(0xff737373)),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                          height:50,
                                          decoration: BoxDecoration(
                                            color: Color(0xffFFFAFA),
                                            border: Border.all(
                                            color: bBlack,// set border color
                                            width: 1.0),  
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 8,
                                            ),
                                            child: TextFormField(                                            
                                              decoration: InputDecoration(
                                                // label: Text(orang.data != null ? orang.data!.email : ""),
                                                border: InputBorder.none,
                                                  focusedBorder: InputBorder.none,
                                                  enabledBorder: InputBorder.none,
                                                  errorBorder: InputBorder.none,
                                                  disabledBorder: InputBorder.none,
                                              ),
                                              controller: EmailController = TextEditingController()..text = orang.data != null ? orang.data!.email : "",                          
                                            ),
                                          ),
                                        ),
                            ],
                          ),
                        ),             
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Nomor',
                                style: TextStyle(fontSize: 14, color: Color(0xff737373)),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                          height:50,
                                          decoration: BoxDecoration(
                                            color: Color(0xffFFFAFA),
                                            border: Border.all(
                                            color: bBlack,// set border color
                                            width: 1.0),  
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 8,
                                            ),  
                                            child: TextFormField(                                            
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                  focusedBorder: InputBorder.none,
                                                  enabledBorder: InputBorder.none,
                                                  errorBorder: InputBorder.none,
                                                  disabledBorder: InputBorder.none,
                                              ),
                                              controller: PhoneController = TextEditingController()..text = orang.data!= null ? orang.data!.phone.toString() : "",                          
                                            ),
                                          ),
                                        ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Alamat',
                                style: TextStyle(fontSize: 14, color: Color(0xff737373)),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                          height:50,
                                          decoration: BoxDecoration(
                                            color: Color(0xffFFFAFA),
                                            border: Border.all(
                                            color: bBlack,// set border color
                                            width: 1.0),  
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 8,
                                            ),
                                            child: TextFormField(                                            
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                  focusedBorder: InputBorder.none,
                                                  enabledBorder: InputBorder.none,
                                                  errorBorder: InputBorder.none,
                                                  disabledBorder: InputBorder.none,
                                              ),
                                              controller: AddressController = TextEditingController()..text = orang.data!= null ? orang.data!.address.toString() : "",                          
                                            ),
                                          ),
                                        ),
                            ],
                          ),
                        ), 
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Deskripsi',
                                style: TextStyle(fontSize: 14, color: Color(0xff737373)),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                          height:50,
                                          decoration: BoxDecoration(
                                            color: Color(0xffFFFAFA),
                                            border: Border.all(
                                            color: bBlack,// set border color
                                            width: 1.0),  
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 8,
                                            ),
                                            child: TextFormField(                                            
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                  focusedBorder: InputBorder.none,
                                                  enabledBorder: InputBorder.none,
                                                  errorBorder: InputBorder.none,
                                                  disabledBorder: InputBorder.none,
                                              ),
                                              controller: DescriptionController = TextEditingController()..text = orang.data!= null ? orang.data!.description.toString() : "",                          
                                            ),
                                          ),
                                        ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            // width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: kPrimaryColor,
                            ),
                            child: TextButton(
                              onPressed: (){
                                update();
                              }, 
                              child: Text("UPDATE",
                              style: TextStyle(color: bWhite),
                              )                             
                              ),
                          ),
                        ),
                        SizedBox(height: 10), 
                      ],
                    );  
                }
                else{
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }               
              }
            ),
    );
  }
  
  Future<void>update() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // print("TOKEN : " + prefs.getString('login').toString());
    
    try {
    
    print("TOKEN : Bearer " + prefs.getString('login').toString());      
    final url = Uri.parse('https://api.gunma.my.id/api/v1/update-profile/');

    Map<String, String> requestBody = <String, String>{
        'name' : NameController.text,
        'email': EmailController.text,
        'phoneNumber': PhoneController.text,
        'address': AddressController.text,
        'description': DescriptionController.text,
      };
      var request = await http.post(url, body: requestBody,
                      headers: {
                            HttpHeaders.authorizationHeader: 'Bearer ' + prefs.getString('login')!,
                      },
      );

      print(request);
      print(request.statusCode);
       if (request.statusCode == 200) {     
          var body = jsonDecode(request.body);
          print(
              body,
          );
          print('Profile Updated');
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Profile Updated")));
          Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => ProfileScreen(),
          )
          );          
       }else{
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Connection Failed")));
       }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Connection Error")));
      // ScaffoldMessenger.of(context).showSnackBar(
      //         SnackBar(content: Text("Information Updated")));
      // Navigator.of(context).pushReplacement(MaterialPageRoute(
      //     builder: (context) => ProfileScreen(),
      //     )
      //     );         
    }
  }    
}
