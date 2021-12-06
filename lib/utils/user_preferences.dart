
// import 'dart:convert';

// import 'package:gunma/models/User.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// // import 'package:user_profile_shared_preferences_example/model/user.dart';

// class UserPreferences {
//   static late SharedPreferences _preferences;

//   static const _keyUser = 'user';

//   static const myUser = User(
//     imagePath: 'https://wl-brightside.cf.tsp.li/resize/728x/jpg/cb4/a81/8bf73152789b8e721d3a0fa1cf.jpg',
//     name: 'Bang Radit Sajo',
//     email: 'raditsajo@gmail.com',
//     description: 'Iam the sun shine. I am the handsome one. I always be me with all of my character. Iam at the 3rd year on my college. I was take an Informatics engginer for my subject and i really love what i was take. ',
//     address: 'Jl. Bangil pucuk ujung kulon selatan tengah laut',
//     phone: '082231532679',
//   );

//   static Future init() async =>
//       _preferences = await SharedPreferences.getInstance();

//   static Future setUser(User user) async {
//     final json = jsonEncode(user.toJson());

//     await _preferences.setString(_keyUser, json);
//   }

//   static User getUser() {
//     final json = _preferences.getString(_keyUser);

//     return json == null ? myUser : User.fromJson(jsonDecode(json));
//   }
  
// }
  