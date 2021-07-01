import 'package:ceyntra_mobile/views/screens/mainFeed/mainFeed.dart';
import 'package:ceyntra_mobile/views/screens/mainScreen.dart';
import 'package:ceyntra_mobile/views/screens/introSlide.dart';
import 'package:ceyntra_mobile/views/screens/startApp.dart';
import 'package:ceyntra_mobile/views/screens/secondaryFeed/secondaryFeed.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

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
      theme: ThemeData(fontFamily: GoogleFonts.montserrat().fontFamily),
      home: MainScreen(),
    );
  }
}
