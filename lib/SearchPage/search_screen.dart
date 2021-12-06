import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gunma/DetailPage/Internship_detail_screen.dart';
import 'package:gunma/HomePage/components/background.dart';
import 'package:gunma/HomePage/components/bottom_navigation_bar.dart';
import 'package:gunma/HomePage/home_screen.dart';
import 'package:gunma/ListInternship/ListInternbySearch_screen.dart';
import 'package:gunma/Login/login_screen.dart';
import 'package:gunma/ProfilePage/profile_screen.dart';
import 'package:gunma/Providers/Internship_providers.dart';
import 'package:gunma/Providers/Iocation_providers.dart';
import 'package:gunma/Providers/tag_providers.dart';
import 'package:gunma/Widgets/City_Card.dart';
import 'package:gunma/Widgets/Internship_Card.dart';
import 'package:gunma/Widgets/Internship_Card_ByLocation.dart';
import 'package:gunma/Widgets/Internship_Card_ByPaid.dart';
import 'package:gunma/Widgets/Internship_Card_ByTag.dart';
import 'package:gunma/Widgets/Internship_Card_ByWFH.dart';
import 'package:gunma/components/button_navbar_item.dart';
// import 'package:gunma/components/button_setting.dart';
import 'package:gunma/components/rounded_input_field.dart';
import 'package:gunma/constants.dart';
import 'package:gunma/models/City.dart';
import 'package:gunma/models/Internship.dart';
import 'package:gunma/models/ListTag.dart';
import 'package:gunma/models/Paid.dart';
import 'package:gunma/models/Tag.dart';
import 'package:gunma/models/WFH.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreen  createState() => _SearchScreen ();
}

class _SearchScreen  extends State<SearchScreen > {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TagProvider>(
        create: (context) => TagProvider(),
        child: Scaffold(
              body: SafeArea(
                child: Container(
                  color: Colors.white,
                  child: ListView(
                    children: [
                      Container(
                        height: 80,
                        width: MediaQuery.of(context).size.width,
                        color: kPrimaryColor,
                        alignment: Alignment.center,

                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Row(
                            children: [
                              SizedBox(height: 8,),
                              InkWell(
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return BottomNavigation();
                                        },
                                      ),
                                      );
                                },
                                child: 
                                  Icon(Icons.arrow_back_ios, color: bWhite),
                              ),
                              SizedBox(width: 5,),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 6),
                                padding: EdgeInsets.symmetric(horizontal: 1.0, vertical: 1),
                                width: 310,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: bWhite,
                                  borderRadius: BorderRadius.circular(8),
                                  ),      
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 9.0, top: 2.7),
                                  child:
                                  TextFormField(
                                    controller: searchController,
                                    decoration: InputDecoration(
                                      hintText: "Cari program internship",
                                        border: InputBorder.none,
                                        suffixIcon: 
                                        InkWell(
                                          onTap: (){
                                            search();
                                            //  Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //       builder: (context) => ListInternbySearchScreen()),
                                            //   );
                                          },
                                          child: Icon(
                                            Icons.search,
                                            color: Color(0xffA9A9A9),
                                          ),
                                        ),
                                    ),
                                  ),                                 
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),                     
                      Padding(                         
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Container(
                            
                              alignment: Alignment.topLeft,
                              child: new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                      "Pencarian Berdasarkan Kota Populer ",
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)
                                    )
                                ],
                              ),
                            ),
                        ),
                      
                      SizedBox(
                        height: 15,
                      ), 
                      horizontalDivider(),
                      Padding(
                      padding: const EdgeInsets.only(left:10.0, right:10.0, top: 10.0),
                        child: Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  SordByCity(
                                    City(
                                      id: 1,
                                      name: 'Surabaya',
                                      imageUrl: 'assets/images/sby.png',
                                      // isPopuler: true,
                                    ),
                                  ),
                                  vertikalDivider(),
                                 SordByCity(
                                    City(
                                      id: 2,
                                      name: 'Yogyakarta',
                                      imageUrl: 'assets/images/yogya.png',
                                      // isPopuler: true,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height:10),
                              horizontalDivider(),
                              SizedBox(height:10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  SordByCity(
                                    City(
                                      id: 4,
                                      name: 'Jakarta',
                                      imageUrl: 'assets/images/jkt.png',
                                      // isPopuler: true,
                                    ),
                                  ),
                                  vertikalDivider(),
                                  SordByCity(
                                    City(
                                      id: 3,
                                      name: 'Malang',
                                      imageUrl: 'assets/images/malang.png',
                                      // isPopuler: true,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height:10),
                              horizontalDivider(),
                              SizedBox(height:10),
                            ],
                          ),
                        ),
                      ),
                      // Container(
                      //   height: 10,
                      //   width: MediaQuery.of(context).size.width,
                      //   color: Color(0xffF5F5F5),
                      // ),
                      
                      Container(
                        height: 20,
                        width: MediaQuery.of(context).size.width,
                        color: Color(0xffF5F5F5),
                      ),
                      SizedBox(height:10),
                       horizontalDivider(),
                       SizedBox(height:10),
                      Padding(                         
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Container(
                            
                              alignment: Alignment.topLeft,
                              child: new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                      "Sistem Kerja",
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)
                                    )
                                ],
                              ),
                            ),
                        ),
                      SizedBox(height:10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SordByPaid(
                            Paid(id: 1, 
                            name: "Paid"),
                          ),  
                          SordByPaid(
                            Paid(id: 0, 
                            name: "Unpaid"),
                          ), 
                           SordByWfh(
                            WFH(id: 1, 
                            name: "WFH"),
                          ), 
                          SordByWfh(
                            WFH(id: 0, 
                            name: "WFO"),
                          ),  
                        ],
                      ),  
                      SizedBox(height:10),
                      Container(
                        height: 20,
                        width: MediaQuery.of(context).size.width,
                        color: Color(0xffF5F5F5),
                      ),
                      SizedBox(height:10),
                      Padding(                         
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Container(
                            
                              alignment: Alignment.topLeft,
                              child: new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                      "Kategori ",
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)
                                    )
                                ],
                              ),
                            ),
                        ),
                         SizedBox(height:10),
                         horizontalDivider(),
                         SizedBox(height:10),
                          Consumer<TagProvider>(
                            builder: (context, provider, _) => FutureBuilder(
                             future: provider.getListTag(),
                              builder: (context, snapshot) {
                              if (snapshot.hasData) {
                              List<ListTag>? data = snapshot.data as List<ListTag>?;
                              return Column(
                                 children: data!
                                    .map((item) => SordByTag(item))
                                    .toList(),   
                              );
                              }
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                              },
                            ),
                          ),
                      SizedBox(
                        height: 100,
                      ),
                    ],
                  ),
                ),
              ),
            )
      );          
  }

  
  horizontalDivider(){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 0,
      decoration: BoxDecoration(
      border: Border(
      top: BorderSide(width: 1.0, color: Color(0xFFE5DCDC)),
      ),
                                   
     ),
    );
  }
  vertikalDivider(){
    return Container(
       width: 0,
       height: 50,
       decoration: BoxDecoration(
        border: Border(
          left: BorderSide(width: 1.0, color: Color(0xFFE4E4E4)),
         ),
       ),
    ); 
  }
  
  Future<void> search() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('search', searchController.text); 
      Navigator.push(
       context,
       MaterialPageRoute(
       builder: (context) => ListInternbySearchScreen()),
       );
  }

}
