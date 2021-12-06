import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gunma/HomePage/home_screen.dart';
import 'package:gunma/Login/login_screen.dart';
// import 'package:gunma/Register/signup_screen.dart';
import 'package:gunma/components/already_have_an_account_check.dart';
// import 'package:myapp1/HomePage/components/background.dart';
import 'package:http/http.dart' as http;
import 'package:gunma/HomePage/components/background.dart';
// import 'package:gunma/HomePage/home_screen1.dart';
import 'package:gunma/components/rounded_button copy.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  // final _formKey = GlobalKey<FormState>();
  late String name, email, password, confirmedPassword, address, phone;
  bool isLoading=false;
  // GlobalKey<ScaffoldState>_scaffoldKey=GlobalKey();
  late ScaffoldMessengerState scaffoldMessenger ;
  var reg=RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  var nameController =  TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmedPasswordController = TextEditingController();
  // var addressController =  TextEditingController();
  // var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Container(
        // height: 1000,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body:
              // Padding(padding:
              //   const EdgeInsets.all(10.0),
              //   child:
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
                    
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    Column(
                      
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 180,),
                        
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 20,
                            left: 20,
                          ),
                          child: Text(
                            '   Welcome Back to GUNMA!\nRegister to Start Your Journey',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height:50,
                      decoration: BoxDecoration(
                        color: Color(0xffFFFAFA),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 8,
                        ),
                        child: TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: "Username",labelStyle: TextStyle(fontSize: 15),
                            border: InputBorder.none,
                            suffixIcon: Icon(Icons.person, color: Color(0xffA9A9A9),), 
                          ),
                           onSaved: (val) {
                              name = val!;
                            },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      height:50,
                      decoration: BoxDecoration(
                        color: Color(0xffFFFAFA),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 8,
                        ),
                        child: TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: "Email",labelStyle: TextStyle(fontSize: 15),
                            border: InputBorder.none,
                            suffixIcon: Icon(Icons.email, color: Color(0xffA9A9A9),),
                          ),
                          onSaved: (val) {
                              email = val!;
                            },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      height:50,
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
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Password",labelStyle: TextStyle(fontSize: 15),
                            border: InputBorder.none,
                            suffixIcon: Icon(Icons.lock, color: Color(0xffA9A9A9),),
                          ),
                          onSaved: (val) {
                              password = val!;
                            },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height:50,
                      decoration: BoxDecoration(
                        color: Color(0xffFFFAFA),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 8,
                        ),
                        child: TextFormField(
                          controller: confirmedPasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Confirmed Password",labelStyle: TextStyle(fontSize: 15),
                            border: InputBorder.none,
                            suffixIcon: Icon(Icons.lock, color: Color(0xffA9A9A9),),
                          ),
                          onSaved: (val) {
                              confirmedPassword = val!;
                            },
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: 8,
                    // ),
                    // Container(
                    //   height:50,
                    //   decoration: BoxDecoration(
                    //     color: Color(0xffFFFAFA),
                    //     borderRadius: BorderRadius.circular(8),
                    //   ),
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(
                    //       left: 8,
                    //     ),
                    //     child: TextFormField(
                    //       controller: addressController,
                    //       // obscureText: true,
                    //       decoration: InputDecoration(
                    //         labelText: "Address",labelStyle: TextStyle(fontSize: 15),
                    //         border: InputBorder.none,
                    //         suffixIcon: Icon(Icons.book, color: Color(0xffA9A9A9),),
                    //       ),
                    //       onSaved: (val) {
                    //           address = val!;
                    //         },
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 8,
                    // ),
                    // Container(
                    //   height:50,
                    //   decoration: BoxDecoration(
                    //     color: Color(0xffFFFAFA),
                    //     borderRadius: BorderRadius.circular(8),
                    //   ),
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(
                    //       left: 8,
                    //     ),
                    //     child: TextFormField(
                    //       controller: phoneController,
                    //       // obscureText: true,
                    //       decoration: InputDecoration(
                    //         labelText: "Phone", labelStyle: TextStyle(fontSize: 15),
                    //         border: InputBorder.none,
                    //         suffixIcon: Icon(Icons.add_call, color: Color(0xffA9A9A9),),
                    //       ),
                    //       onSaved: (val) {
                    //           phone = val!;
                    //         },
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 25,
                    ),
                    RoundedButton(
                      text: "REGISTER",
                      press: () {
                        if(isLoading)
                          {
                          return;
                          }
                        if(nameController.text.isEmpty)
                          {
                          scaffoldMessenger.showSnackBar(SnackBar(content:Text("Please Enter Name")));
                          return;
                          }
                        if(!reg.hasMatch(emailController.text))
                          {
                           scaffoldMessenger.showSnackBar(SnackBar(content:Text("Enter Valid Email")));
                           return;
                          }
                        if(passwordController.text.isEmpty)
                          {
                          scaffoldMessenger.showSnackBar(SnackBar(content:Text("Please Enter Password")));
                          return;
                          }
                        if(passwordController.text.length<8)
                          {
                          scaffoldMessenger.showSnackBar(SnackBar(content:Text("Password should be min 8 characters")));
                          return;
                          }
                        if(confirmedPasswordController.text != passwordController.text)
                          {
                          scaffoldMessenger.showSnackBar(SnackBar(content:Text("Please re - enter the correct password confirmation")));
                          return;
                          }
                        else{
                          signup();
                        }
                        
                      },
                      color: Color(0xff3E83A8),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    AlreadyHaveAnAccountCheck(
                      login: false, press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return LoginScreen();
                            },
                          ),
                        );
                      },
                    ),
                    
                  ],
                ),
              ),
            ),
          )),
          // ),
        ),
      ),
    );
  }

  Future<void>signup() async {

    try {
      final url = Uri.parse('https://api.gunma.my.id/api/v1/register-user');
      Map<String, String> requestBody = <String, String>{
        'name' : nameController.text,
        'email': emailController.text,
        'password': passwordController.text,
        'password_confirmation': confirmedPasswordController.text,
      };
      var request = http.MultipartRequest('POST', url)..fields.addAll(requestBody);
      var response = await request.send();
 
       if (response.statusCode == 200) {
          print('User Registed');
          final respStr = await response.stream.bytesToString();

          var body = jsonDecode(respStr);
          print(
              body,
          );
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Token : ${body['data']['access_token']}")));

          Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => LoginScreen(),
          )
          );

       }else{
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Connection Failed")));
       }
      

      // Navigator.push(
      //       context, MaterialPageRoute(builder: (context) => HomePageScreen()));
      
      // print("This is the Status Code$respStr");
      // var encoded = json.decode(respStr);

      // print(encoded['status']);
      // print('This is the userId${encoded['data']['user_id']}');

    } catch (error) {
      print(error);
    }
  }  

}
  
