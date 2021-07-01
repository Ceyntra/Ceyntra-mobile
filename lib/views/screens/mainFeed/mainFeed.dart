import 'package:ceyntra_mobile/views/screens/clickOnThePlace/clickOnThePlaceFeed.dart';
import 'package:ceyntra_mobile/views/screens/hamburgerScreens/addNewPlace.dart';

import 'package:ceyntra_mobile/views/screens/hamburgerScreens/animalDetection.dart';
import 'package:ceyntra_mobile/views/screens/hamburgerScreens/favourites.dart';
import 'package:ceyntra_mobile/views/screens/hamburgerScreens/translator.dart';
import 'package:ceyntra_mobile/views/screens/secondaryFeed/secondaryFeed.dart';

import 'package:flutter/material.dart';

class MainFeedScreen extends StatefulWidget {
  Function setNull;
  String hamburgerState;
  MainFeedScreen({this.hamburgerState, this.setNull});
  @override
  _MainFeedScreenState createState() => _MainFeedScreenState();
}

class _MainFeedScreenState extends State<MainFeedScreen> {
  double xOffSet = 0;
  double yOffSet = 0;
  double scaleFactor = 1;
  bool isPressed = false;
  String mainFeedState = 'explore';
  String clickedPlace;

  // this function call from FeedPlaceWidget
  void changeMainFeedStateState(String state) {
    setState(() {
      mainFeedState = state;
    });
  }

  void setHamburgerStateNull() {
    widget.hamburgerState = null;
  }

// this function call from FeedPlaceWidget
  void setClickedPlace(String place) {
    setState(() {
      clickedPlace = place;
    });
  }

  void pressed(double xOff, double yOff, double scaleFac, bool pressed) {
    print(xOff);
    print(yOff);
    print("clicked pressed");
    print(pressed);

    setState(() {
      isPressed = pressed;
      xOffSet = xOff;
      yOffSet = yOff;
      scaleFactor = scaleFac;
    });

    print(pressed);
  }

// this function return Screen widgets according to mainfeed state
  Widget mainFeed(BuildContext context) {
    if (mainFeedState == "explore")
      return SecondaryFeedScreen(
        changeMainFeedStateState: changeMainFeedStateState,
        setClickedPlace: setClickedPlace,
        pressed: pressed,
        isPressed: isPressed,
      );
    else if (mainFeedState == "clickOnThePlace")
      return ClickOnThePlacePlaceFeedScreen(
        place: clickedPlace,
      );
    else if (mainFeedState == "favourites")
      return FavouritesScreen(
        pressed: pressed,
        isPressed: isPressed,
        setNull: setHamburgerStateNull,
      );
    else if (mainFeedState == "translator")
      return TranslatorScreen(
        pressed: pressed,
        isPressed: isPressed,
        setNull: setHamburgerStateNull,
      );
    else if (mainFeedState == "addNewPlace")
      return AddNewPlaceScreen(
        pressed: pressed,
        isPressed: isPressed,
        setNull: setHamburgerStateNull,
      );
    else if (mainFeedState == "animalDetection")
      return AnimalDetectionScreen(
        pressed: pressed,
        isPressed: isPressed,
        setNull: setHamburgerStateNull,
      );
    return null;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.hamburgerState != null) {
      setState(() {
        mainFeedState = widget.hamburgerState;
        // scaleFactor = 1.0;
        // xOffSet = 0.0;
        // yOffSet = 0.0;
        // isPressed = false;
      });
      pressed(0.0, 0.0, 1.0, false);

      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => FavouritesScreen()));
      print(widget.hamburgerState);
    }
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffSet, yOffSet, 0)
        ..scale(scaleFactor),
      duration: Duration(microseconds: 10),
      child: ClipRRect(
        borderRadius:
            isPressed ? BorderRadius.circular(40) : BorderRadius.circular(0),
        child: Scaffold(
          body: mainFeed(context),
          backgroundColor: Color(0xff192537),
          bottomNavigationBar: Container(
            color: Color(0xff192537),
            padding: EdgeInsets.all(10),
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    splashColor: Colors.amber,
                    onTap: () {
                      widget.setNull();
                      widget.hamburgerState = null;
                      setState(() {
                        mainFeedState = "explore";
                      });
                    },
                    child: Container(
                        // color: Colors.amber,
                        padding: EdgeInsets.symmetric(horizontal: 10),

                        // color: Colors.amberAccent,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.explore,
                              color: mainFeedState == "explore"
                                  ? Colors.green[400]
                                  : Colors.white,
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              "Explore",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          ],
                        ))),
                InkWell(
                    onTap: () {
                      widget.setNull();
                      widget.hamburgerState = null;
                      setState(() {
                        mainFeedState = "global";
                      });
                    },
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.chat,
                              color: mainFeedState == "global"
                                  ? Colors.green[400]
                                  : Colors.white,
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              "Ceyntra Chat",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          ],
                        ))),
                GestureDetector(
                    onTap: () {
                      widget.setNull();
                      widget.hamburgerState = null;
                      setState(() {
                        mainFeedState = "profile";
                      });
                    },
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.person,
                              color: mainFeedState == "profile"
                                  ? Colors.green[400]
                                  : Colors.white,
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              "Profile",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          ],
                        ))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
