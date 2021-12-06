// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:gunma/Providers/Internship_byLocation_provider.dart';
import 'package:gunma/Widgets/Internship_Card.dart';
import 'package:gunma/constants.dart';
import 'package:gunma/models/Internship.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListInternbyLocationScreen extends StatefulWidget {
  const ListInternbyLocationScreen({ Key? key }) : super(key: key);

  @override
  _ListInternbyLocationScreenState createState() => _ListInternbyLocationScreenState();
}

class _ListInternbyLocationScreenState extends State<ListInternbyLocationScreen> {
   
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<ListInternbyLocationProvider>(
      create: (context) => ListInternbyLocationProvider(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text("List Internship"),),
        body: 
        SafeArea(
          child: ListView(
            children: [
              SizedBox(height: 20),
              Center(child: Text("Temukan Tempat Magangmu Sekarang", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)),
              SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.only(
                 left: 24,
                ),
                child:
                Consumer<ListInternbyLocationProvider>(
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
            ],
          ),
        ),
      ),
    );
  }

  getListInternship(){

  }
}
