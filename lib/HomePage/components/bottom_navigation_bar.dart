import 'package:flutter/material.dart';
import 'package:gunma/HomePage/home_screen.dart';
import 'package:gunma/ProfilePage/profile_screen.dart';
import 'package:gunma/ProfilePage/setting_profile.dart';
import 'package:gunma/SettingPage/setting_screen.dart';
import 'package:gunma/UploadInternship/setting_upload.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    HomePageScreen(),
    ProfileScreen(),
    UploadInternSetting(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Color(0xff3E83A8),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),          
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            title: Text('Account'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_sharp ),
            title: Text('Upload'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
