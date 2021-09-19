import 'package:ceyntra_mobile/auth.dart';
import 'package:ceyntra_mobile/views/screens/clickOnThePlace/Bid/clickOntheTaxiFeedBid.dart';
import 'package:ceyntra_mobile/views/screens/firstPage.dart';
import 'package:ceyntra_mobile/views/screens/firstSignUpScreen.dart';
import 'package:ceyntra_mobile/views/screens/getHelpScreen.dart';
import 'package:ceyntra_mobile/views/screens/mainScreen.dart';
import 'package:ceyntra_mobile/views/screens/introSlide.dart';
import 'package:ceyntra_mobile/views/screens/offersScreens/taxi/TaxiOfferScreen.dart';
import 'package:ceyntra_mobile/views/screens/profileScreens/guideProfile.dart';
import 'package:ceyntra_mobile/views/screens/profileScreens/hotelProfile.dart';
import 'package:ceyntra_mobile/views/screens/profileScreens/travellerProfile.dart';
import 'package:ceyntra_mobile/views/screens/signUpScreen/travellerSignUp.dart';
import 'package:ceyntra_mobile/views/screens/signUpScreen/travellerSignUpTwo.dart';
import 'package:ceyntra_mobile/views/screens/startApp.dart';
import 'package:ceyntra_mobile/views/screens/secondaryFeed/secondaryFeed.dart';
import 'package:ceyntra_mobile/views/screens/weatherScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ceyntra_mobile/views/screens/loginScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ceyntra_mobile/views/screens/mainFeed/mainFeed.dart';
import 'package:ceyntra_mobile/views/screens/spHomeScreens/guideHome.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ceyntra_mobile/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // SharedPreferences preferences = await SharedPreferences.getInstance();
  // await preferences.clear();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Auth auth = new Auth();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: FutureBuilder(
        future: auth.userRedirect(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return snapshot.data;
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      // child: FirstPageScreen()
    );
  }

  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     title: 'Flutter Demo',
  //     home: ClickOnTheTaxiFeedBid(),
  //   );
  // }
}
