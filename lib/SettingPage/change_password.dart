import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gunma/SettingPage/setting_screen.dart';
import 'package:gunma/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {

 
  var passwordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var rePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
       appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('Change Password'), centerTitle: true, 
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back ),
          
        ),
      ),
        body:
            SafeArea(
                child: Center(
          child: Container(
            // height: 1000,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/backgorundLogin.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [                  
                  SizedBox(
                    height: 28,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xffFFFAFA),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                      ),
                      child: TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          labelText: "Old Password",
                          border: InputBorder.none,
                          suffixIcon: Icon(
                            Icons.password,
                            color: Color(0xffA9A9A9),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xffFFFAFA),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                      ),
                      child: TextFormField(
                        controller: newPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "New Password",
                          border: InputBorder.none,
                          suffixIcon: Icon(
                            Icons.lock,
                            color: Color(0xffA9A9A9),
                          ),
                        ),
                      ),
                    ),
                  ),
                   SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xffFFFAFA),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                      ),
                      child: TextFormField(
                        controller: rePasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Confirmation Password",
                          border: InputBorder.none,
                          suffixIcon: Icon(
                            Icons.lock,
                            color: Color(0xffA9A9A9),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                   Container(
                    
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red,
                      border: Border.all(
                        color: Colors.red,
                      ),
                    ),
                    
                      
                    child: 
                    TextButton(
                      child:Text("Change Password",style: TextStyle(fontWeight: FontWeight.bold, color: bWhite, fontSize: 20), ),     
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => CupertinoAlertDialog(
                          title: const Text('Did You Really \nWant to Change Your Password ?'),
                          actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel'),
                          ),
                            TextButton(
                              onPressed: (){
                                changePassword();                                                       
                              }, 
                              child: const Text('Yes', style: TextStyle(color: Colors.red)),
                            ),
                          ],
                          ),
                        ),                             
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),                   
                ],
              ),
            ),
          ),
        )),
        // ),
      ),
    );
  }

  Future<void> changePassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (passwordController.text.isNotEmpty || rePasswordController.text.isNotEmpty || newPasswordController.text.isNotEmpty ) {
      if(passwordController.text == prefs.getString('password').toString()){
        if ( rePasswordController.text ==  newPasswordController.text){
          if(rePasswordController.text.length >= 8  || newPasswordController.text.length >= 8){
            try {              
              print("TOKEN : " + prefs.getString('login').toString());      
              final url = Uri.parse('https://api.gunma.my.id/api/v1/update-profile/');

              Map<String, String> requestBody = <String, String>{
                  'password': rePasswordController.text,
                };
                var request = await http.post(url, body: requestBody,
                      headers: {
                            HttpHeaders.authorizationHeader: 'Bearer ' + prefs.getString('login')!,
                      },
                );
                print(request);
                if (request.statusCode == 200) {
                    print('Password Updated');
                    var body = jsonDecode(request.body);
                    print(
                        body,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Password Updated")));

                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => SettingScreen(),
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
        }else{
           ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Pastikan Password Baru Terdiri dari Minimal 8 Karakter")));
        }
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Pastikan Isi Password baru dan Re-write Password Sama")));
      }
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Masukan Password Dengan Benar")));
      } 
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Isi Semua Kolom dengan benar")));
    }
    
  }

}
