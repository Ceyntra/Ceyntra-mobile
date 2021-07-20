import 'package:ceyntra_mobile/views/screens/firstPage.dart';
import 'package:ceyntra_mobile/views/screens/fogetPasswordScreen.dart';
import 'package:ceyntra_mobile/views/screens/getHelpScreen.dart';
import 'package:ceyntra_mobile/views/screens/mainScreen.dart';
import 'package:ceyntra_mobile/views/screens/introSlide.dart';
import 'package:ceyntra_mobile/views/screens/profileScreens/guideProfile.dart';
import 'package:ceyntra_mobile/views/screens/profileScreens/hotelProfile.dart';
import 'package:ceyntra_mobile/views/screens/profileScreens/travellerProfile.dart';
import 'package:ceyntra_mobile/views/screens/startApp.dart';
import 'package:ceyntra_mobile/views/screens/secondaryFeed/secondaryFeed.dart';
import 'package:ceyntra_mobile/views/screens/weatherScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ceyntra_mobile/views/screens/loginScreen.dart';
import 'package:ceyntra_mobile/views/screens/mainFeed/mainFeed.dart';
import 'package:ceyntra_mobile/views/screens/spHomeScreens/hotelHome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home:HotelHomeScreen(),
    );
  }
}
