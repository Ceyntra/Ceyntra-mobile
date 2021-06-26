import 'package:ceyntra_mobile/views/screens/hamburgerMenu.dart';
import 'package:ceyntra_mobile/views/screens/mainFeed/mainFeed.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  // const MainScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff2F3546),
      body: Stack(
        children: [HamburgerMenu(), MainFeedScreen()],
      ),
    );
  }
}
