import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gunma/size_config.dart';

const kPrimaryColor = Color(0xff3E83A8);
const kPrimaryLightColor = Color(0xFFF1E6FF);
const bPrimaryColor = Color(0xff202020);
const bWhite = Color(0xffFFFAFA);
const lightWhite = Color(0xffFFFFFF);
const bGrey = Color(0xffC0C0C0);
const kBluerPrimary = Color (0xff471AFB);
const bBlack = Color (0xff999999);
const bDark = Color(0xff282626);
const bDarkText = Color(0xff3B3230);
const kAnimationDuration = Duration(milliseconds: 100);
const kPurple = Color (0xff471AFB);


TextStyle boldPoppins = GoogleFonts.poppins(
  fontWeight: FontWeight.bold,
);

TextStyle regularPoppins = GoogleFonts.poppins(
  fontWeight: FontWeight.w600,
  color: bBlack
);




const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: bWhite),
  );
} 
