import 'package:flutter/material.dart';
import 'package:gunma/DetailPage/Internship_detail_screen.dart';
import 'package:gunma/HomePage/components/background.dart';
import 'package:gunma/Providers/Internship_providers.dart';
import 'package:gunma/Widgets/City_Card.dart';
import 'package:gunma/Widgets/Internship_Card.dart';
import 'package:gunma/components/button_navbar_item.dart';
// import 'package:gunma/components/button_setting.dart';
import 'package:gunma/components/button_input_field.dart';
import 'package:gunma/constants.dart';
import 'package:gunma/models/City.dart';
import 'package:gunma/models/Internship.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreen createState() => _HomePageScreen();
}

class _HomePageScreen extends State<HomePageScreen> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<InternshipProvider>(
      create: (context) => InternshipProvider(),
      child: Scaffold(
            body: SafeArea(
              child: Container(
                child: ListView(
                  children: [
                    Background(
                      child: Container(
                        alignment: Alignment.center,
                        child: new Column(
                          children: <Widget>[
                            SizedBox(height: 40, width: 2),
                            new Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "   Selamat datang, Yuk cari program \n   Internship untuk kamu!",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    color: lightWhite.withOpacity(1)),
                              ),
                            ),
                            SizedBox(height: 20),
                            ButtonToSearchPage(),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Explore Internship on Your Country",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                            color: Color(0xff252525)),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                      child: Text(
                        "Cari tempat magang di kota terbaik di Indonesia",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Color(0xff484949)),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 140,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          SizedBox(
                            width: 16,
                          ),
                          
                          CityCard(
                              City(
                                id: 1,
                                name: 'Surabaya',
                                imageUrl: 'assets/images/sby.png',
                                // isPopuler: false,s
                              ),
                            ),
                          
                          SizedBox(
                            width: 20,
                          ),
                          
                            CityCard(
                              City(
                                id: 2,
                                name: 'Yogyakarta',
                                imageUrl: 'assets/images/yogya.png',
                                // isPopuler: true,
                              ),
                            ),
                          
                          SizedBox(
                            width: 20,
                          ),
                          
                          CityCard(
                              City(
                                id: 3,
                                name: 'Malang',
                                imageUrl: 'assets/images/malang.png',
                                // isPopuler: false,
                              ),
                            ),
                          
                          SizedBox(
                            width: 20,
                          ),
                          CityCard(
                              City(
                                id: 4,
                                name: 'Jakarta',
                                imageUrl: 'assets/images/jkt.png',
                                // isPopuler: false,
                              ),
                            ),
                          
                          // SizedBox(
                          //   width: 20,
                          // ),
                          // CityCard(
                          //   City(
                          //     id: 4,
                          //     name: 'Bandung',
                          //     imageUrl: 'assets/images/bandung.png',
                          //     isPopuler: false,
                          //   ),
                          // ),
                          // SizedBox(
                          //   width: 30,
                          // ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Update Terbaru",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    Padding(
                      padding: EdgeInsets.only(
                        left: 24, bottom: 10,
                      ),
                      child:
                        Consumer<InternshipProvider>(
                        builder: (context, provider, _) => FutureBuilder(
                          future: provider.getRecommendedSpaces(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              List<Internship>? data = snapshot.data as List<Internship>?;
                              return Column(
                                children: data!
                                    .map((item) => InternshipCard(item))
                                    .toList(),
                              );
                            }
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        ),
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
}
