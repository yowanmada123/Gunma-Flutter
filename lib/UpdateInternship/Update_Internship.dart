import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gunma/Login/login_screen.dart';
import 'package:gunma/UploadInternship/setting_upload.dart';
import 'package:gunma/components/rounded_button.dart';
import 'package:gunma/models/Internship.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'package:gunma/components/appbar_widget.dart';
import 'package:gunma/components/button_widget.dart';
import 'package:gunma/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateInternPage extends StatefulWidget {

  late final Internship intern;
  
  UpdateInternPage(this.intern);
  
  @override
  _UpdateInternPageState createState() => _UpdateInternPageState(intern);
}

class _UpdateInternPageState extends State<UpdateInternPage> {

  late final Internship intern;
  
  _UpdateInternPageState(this.intern);
  
  @override
  Widget build(BuildContext context) {
    var programNameController =  TextEditingController()..text = intern.programName;
    var isOpenController = TextEditingController();
    var durationController = TextEditingController()..text = intern.duration.toString();
    var closeRegistrationController = TextEditingController()..text = intern.closeRegistration.toString();
    var locationNameController = TextEditingController()..text = intern.location_id;
    var descriptionController = TextEditingController()..text = intern.description;
    var benefitController = TextEditingController()..text = intern.benefit;
    var requirementsController = TextEditingController()..text = intern.requirement;
    var registrationLinkController = TextEditingController()..text = intern.registrationLink;
    var isWfhController = TextEditingController()..text = intern.work;
    var isPaidController = TextEditingController()..text = intern.pay;
    var imageUrlController = TextEditingController()..text = intern.imageUrl;
    var tagNameController = TextEditingController()..text = intern.tag_id.toString(); 

    return  Container(
      child: Scaffold(
              appBar: AppBar(
                backgroundColor: kPrimaryColor,
                title: Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Text("Update Internship"),
                ),
              ),
              body: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16), 
                physics: BouncingScrollPhysics(),
                children: [
                  const SizedBox(height: 10),
                  // InternshipWidget(
                  //   imagePath: '',
                  //   isEdit: true,
                  //   onClicked: () async {
                  //     final image = await ImagePicker()
                  //         .getImage(source: ImageSource.gallery);

                  //     if (image == null) return;

                  //     final directory = await getApplicationDocumentsDirectory();
                  //     final name = basename(image.path);
                  //     final imageFile = File('${directory.path}/$name');
                  //     final newImage =
                  //         await File(image.path).copy(imageFile.path);

                  //     // setState(() => user = user.copy(imagePath: newImage.path));
                  //   },
                  // ),
                  const SizedBox(height: 10),
                  Text(" Program Name", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                  SizedBox(height: 10),
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
                            controller: programNameController,                          
                          ),
                        ),
                      ),
                  const SizedBox(height: 10),
                  Text(" Duration (in month)", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                  SizedBox(height: 10),
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
                            controller: durationController,
                          ),
                        ),
                      ),
                  const SizedBox(height: 10),
                  Text(" Deskripsi", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                  SizedBox(height: 10),
                  Container(
                        height:200,
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
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            decoration: InputDecoration(
                               border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                            ),
                            controller: descriptionController,
                          ),
                        ),
                      ),
                  const SizedBox(height: 10),
                  Text(" Manfaat", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                  SizedBox(height: 10),
                  Container(
                        height:200,
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
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            decoration: InputDecoration(
                               border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                            ),
                            controller: benefitController,
                          ),
                        ),
                      ),
                  const SizedBox(height: 10),
                  Text(" Persyaratan", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                  SizedBox(height: 10),
                  Container(
                        height:200,
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
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            controller: requirementsController,
                            decoration: InputDecoration(
                               border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                  SizedBox(height: 10),
                  Text(" Link Registrasi", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                  SizedBox(height: 10),
                  Container(
                        height:100,
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
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            decoration: InputDecoration(
                               border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                            ),
                            controller: registrationLinkController,
                          ),
                        ),
                      ),
                     SizedBox(height: 10),
                  Text(" Image Url", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                  SizedBox(height: 10),
                  Container(
                        height:100,
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
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            decoration: InputDecoration(
                               border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                            ),
                            controller: imageUrlController,
                          ),
                        ),
                      ),
                  SizedBox(height: 10),
                  Text(" Kota", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                  SizedBox(height: 10),
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
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            decoration: InputDecoration(
                               border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                            ),
                            controller: locationNameController,
                          ),
                        ),
                      ),
                    SizedBox(height: 10),
                  Text(" Salary", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                  SizedBox(height: 10),
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
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            decoration: InputDecoration(
                               border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                            ),
                            controller: isPaidController,
                          ),
                        ),
                      ),
                    SizedBox(height: 10),
                  Text(" Sistem Bekerja", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                  SizedBox(height: 10),
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
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            decoration: InputDecoration(
                               border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                            ),
                            controller: isWfhController,
                          ),
                        ),
                      ),
                    SizedBox(height: 10),
                  Text(" Kategori Bidang", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                  SizedBox(height: 10),
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
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            controller: tagNameController,
                            decoration: InputDecoration(
                               border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                  SizedBox(height: 10),
                  Text(" Close Registration", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                  SizedBox(height: 10),

                  Container(
                      height:50,
                        decoration: BoxDecoration(
                          
                          color: Color(0xffFFFAFA),
                          border: Border.all(
                          color: bBlack,// set border color
                          width: 1.0),  
                          borderRadius: BorderRadius.circular(8),
                        ),
                        
                      child:Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                               border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                            ),
                            controller: closeRegistrationController, //editing controller of this TextField
                            // initialValue: intern.closeRegistration.toString(),
                            // decoration: InputDecoration( 
                            //   // icon: Icon(Icons.calendar_today), //icon of text field
                            //   labelText: "Enter Date", labelStyle: TextStyle(fontSize: 12),
                            //   border: InputBorder.none, //label text of field
                            // )
                            // readOnly: true,  //set it true, so that user will not able to edit text
                            onTap: () async { 
                              FocusScope.of(context).requestFocus(new FocusNode());
                              DateTime? pickedDate = await showDatePicker(
                                  context: context, initialDate: DateTime.now(),
                                  firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                                  lastDate: DateTime(2101)
                              );
                              if(pickedDate != null ){
                                  print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                                  
                                  String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); 
                                  print(formattedDate); //formatted date output using intl package =>  2021-03-16
                                  closeRegistrationController.text = formattedDate;
                                  //you can implement different kind of Date Format here according to your requirement
                                  // setState(() {
                                  //    dateinput.text = formattedDate; //set output date to TextField value. 
                                  // }
                                  // );
                              }else{
                                  print("Date is not selected");
                              }
                            },
                        ),
                      )
                    ),
  
                  SizedBox(height: 24),
                  RoundedButton(
                      text: "UPDATE",
                      press: () {
                        update(programNameController.text, durationController.text, closeRegistrationController.text, locationNameController.text, descriptionController.text, benefitController.text,
                             requirementsController.text, registrationLinkController.text, isWfhController.text, isPaidController.text, imageUrlController.text, tagNameController.text, context);
                      },
                      color: Color(0xff3E83A8),
                  ),
                  const SizedBox(height: 10), 
                ],
              ),
            ),
    );
  }

  Future<void>update(String programName, String duration, String closeRegistration, String locationName, String description, String benefit,
                      String requirement, String registrationLink, String isWfh, String isPaid, String imageUrl, String tagName, BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("TOKEN : " + prefs.getString('login').toString());
    
    try {
    
    final url = Uri.parse('https://api.gunma.my.id/api/v1/internship/' + intern.id.toString());
    print(url);
    Map<String, String> requestBody = <String, String>{
        'programName' : programName,
        'isOpen': '1',
        'description': description,
        'duration': duration,
        'benefit': benefit,
        'requirement': requirement,
        'registrationLink': registrationLink,
        'closeRegistration': closeRegistration,
        'locationName': locationName,
        'tagName': tagName,
        'imageUrl': imageUrl,
        'isPaid': isPaid,
        'isWfh': isWfh,
      };

      var request = await http.put(url, body: requestBody);
      print(request);

       if (request.statusCode == 200) {
          print('Information Updated');
          var body = jsonDecode(request.body);
          print(
              body,
          );
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Internship Updated")));

          Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => UploadInternSetting(),
          )
          );          
       }else{
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Connection Failed")));
       }
    } catch (error) {
      print(error);
    }
  }             
}

