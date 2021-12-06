import 'package:flutter/material.dart';
import 'package:gunma/HomePage/components/bottom_navigation_bar.dart';
import 'package:gunma/ProfilePage/update_profile_screen.dart';
import 'package:gunma/models/DetailUser.dart';
import 'package:http/http.dart' as http;
import 'package:gunma/constants.dart';

class ProfileScreen extends StatefulWidget {

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  
  @override
  Widget build(BuildContext context){
        return Scaffold(    
            appBar: AppBar(
            backgroundColor: kPrimaryColor,
                leading: GestureDetector(
                onTap: () {  
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => BottomNavigation(),
                  )
                  );
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 24,
                ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 80.0),
              child: Text("Profile"),
            ),),
            body: FutureBuilder<User>(
              future: User.fetchUser(),
              builder: (context, orang) {
                if(orang.connectionState == ConnectionState.done){
                  return ListView(
                      physics: BouncingScrollPhysics(),
                      children: [                      
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
                        SizedBox(
                          height: 24,
                        ),
                        buildName(orang.data),
                        SizedBox(
                          height: 20,
                        ),               
                        buildEmail(orang.data),
                        SizedBox(
                          height: 24,
                        ),
                        buildAddress(orang.data),
                        SizedBox(
                          height: 24,
                        ),
                        buildPhone(orang.data),
                        SizedBox(
                          height: 24, 
                        ),
                        buildDescription(orang.data),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [                       
                                // SizedBox(width: 10,),
                                Container(
                                   height: 35,
                                   width: MediaQuery.of(context).size.width * 0.8, 
                                    // width: MediaQuery.of(context).size.width,
                                    child: RaisedButton( 
                                    onPressed: () async {
                                      Navigator.push(
                                         context, MaterialPageRoute(builder: (context) =>UpdateProfileScreen()));
                                    },
                                     color: kPrimaryColor,
                                     shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      ),
                                     child: Text('Edit', style: TextStyle(fontWeight: FontWeight.bold, color: bWhite, fontSize: 20), ),                                                  
                                    ),
                                ),
                              ],
                          ),
                        ),
                        SizedBox(height: 0),
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

Widget buildName(User? user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama',
              style: TextStyle(fontSize: 14, color: Color(0xff737373)),
            ),
            const SizedBox(height: 10),
            Container(
              height: 36,
              width: 328,
              padding: EdgeInsets.only(top: 5, left: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Color(0xffDCD7D7),
                  width: 0.2,
                ),
              ),
              child: 
              
              Text(
                user != null ? user.name : "",
                style: TextStyle(fontSize: 15, height: 2),
              ),
            ),
          ],
        ),
      );
  Widget buildEmail(User? user) => Container(
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
              height: 36,
              width: 328,
              padding: EdgeInsets.only(top: 5, left: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Color(0xffDCD7D7),
                  width: 0.2,
                ),
              ),
              child: Text(
                
                user!= null ? user.email : "",
                style: TextStyle(fontSize: 15, height: 2),
              ),
            ),
          ],
        ),
      );

  Widget buildAddress(User? user) => Container(
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
              height: 130,
              width: 328,
              padding: EdgeInsets.only(top: 5, left: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Color(0xffDCD7D7),
                  width: 0.2,
                ),
              ),
              child: Text(
                 user!= null ? user.address.toString() : "",
                style: TextStyle(fontSize: 15, height: 2),
              ),
            ),
          ],
        ),
      );

  Widget buildPhone(User? user) => Container(
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
              height: 36,
              width: 328,
              padding: EdgeInsets.only(top: 5, left: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Color(0xffDCD7D7),
                  width: 0.2,
                ),
              ),
              child: Text(
                // user!.userId.toString(),
                user!= null ? user.phone.toString() : "",
                style: TextStyle(fontSize: 15, height: 2),
              ),
            ),
          ],
        ),
      );
  Widget buildDescription(User? user) => Container(
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
              height: 130,
              width: 328,
              padding: EdgeInsets.only(top: 5, left: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Color(0xffDCD7D7),
                  width: 0.2,
                ),
              ),
              child: Text(
                user!= null ? user.description.toString() : "",
                style: TextStyle(fontSize: 15, height: 2),
              ),
            ),
          ],
        ),
      );
}
