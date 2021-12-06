import 'package:flutter/material.dart';

import 'package:gunma/components/text_field_container.dart';
import 'package:gunma/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  var searchController = TextEditingController();
  // // final ValueChanged<String> onChanged;
  // // var emailController = TextEditingController();

  RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    // required this.searchController,
  }) : super(key: key);
  
  @override
  
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return 
    Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 3),
      width: 310,
      decoration: BoxDecoration(
        color: bWhite,
        borderRadius: BorderRadius.circular(8),
        ),      
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child:
        TextFormField(
          controller: searchController,
          decoration: InputDecoration(
            labelText: "Cari program internship",
              border: InputBorder.none,
              suffixIcon: 
              InkWell(
                onTap: (){

                },
                child: Icon(
                  Icons.search,
                  color: Color(0xffA9A9A9),
                 ),
              ),
               hintText: hintText,
          ),
        ), 
        // TextField(
        //   // onChanged: onChanged,
        //   onTap: (){           
        //   },
        //   decoration: InputDecoration(
        //     border: InputBorder.none,
        //     icon: Icon(
        //       Icons.search,
        //       color: bGrey,
        //     ),
        //     hintText: hintText,
            
        //   ),
        // ),
      ),
    );
  }
}
