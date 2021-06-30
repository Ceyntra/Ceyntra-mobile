import 'package:ceyntra_mobile/views/screens/hamburgerMenu.dart';
import 'package:ceyntra_mobile/views/screens/mainFeed/mainFeed.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  // const MainScreen({ Key? key }) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String mainFeedState;

  void changeMainFeedState(String state) {
    setState(() {
      mainFeedState = state;
    });

    // print(name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff2F3546),
      body: Stack(
        children: [
          HamburgerMenu(
            changeMainFeedState: changeMainFeedState,
          ),
          MainFeedScreen(
            hamburgerState: mainFeedState,
          )
        ],
      ),
    );
  }
}
