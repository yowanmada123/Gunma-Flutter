import 'package:flutter/material.dart';
import 'package:gunma/SearchPage/search_screen.dart';
import 'package:gunma/components/text_field_container.dart';
import 'package:gunma/constants.dart';

class ButtonToSearchPage extends StatelessWidget {

  const ButtonToSearchPage({
    Key? key,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: (){
        Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SearchScreen();
                      },
                    ),
                    );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6),
        padding: EdgeInsets.symmetric(horizontal: 2, vertical: 3),
        width: size.width*0.92,
        height:50,
        decoration: BoxDecoration(
          color: bWhite,
          borderRadius: BorderRadius.circular(8),
          ),
        
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              Icon(
                Icons.search,
                color: bGrey,
              ),
              SizedBox(
               width: 10,
              ),
              Text("Cari program Magang pilihanmu"),
            ],
          ),
        //   TextButton(
        //     // onChanged: onChanged,
        //     decoration: InputDecoration(
        //       border: InputBorder.none,
        //       icon: Icon(
        //         Icons.search,
        //         color: bGrey,
        //       ),
        //       hintText: hintText,
              
        //     ),
        //   ),
        ),
      ),
    );  
  //   return TextFieldContainer(
  //     child: Padding(
  //       padding: const EdgeInsets.only(left: 8.0),
  //       child: TextField(
  //         onChanged: onChanged,
  //         decoration: InputDecoration(
  //           border: InputBorder.none,
  //           icon: Icon(
  //             Icons.search,
  //             color: bGrey,
  //           ),
  //           hintText: hintText,
            
  //         ),
  //       ),
  //     ),
  //   );
  // }
  }
}
