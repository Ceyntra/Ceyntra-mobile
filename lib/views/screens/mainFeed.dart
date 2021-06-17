import 'package:ceyntra_mobile/views/screens/feed.dart';
import 'package:flutter/material.dart';

class MainFeedScreen extends StatefulWidget {
  @override
  _MainFeedScreenState createState() => _MainFeedScreenState();
}

class _MainFeedScreenState extends State<MainFeedScreen> {
  String mainFeedState = 'explore';

  Widget mainFeed(BuildContext context) {
    if (mainFeedState == "explore") return FeedScreen();
    // else if (mainFeedState == "global")
    //   return PopulerFeedScreen();
    // else if (mainFeedState == "profile") return SuggestionsFeedScreen();
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainFeed(context),
      backgroundColor: Color(0xff192537),
      bottomNavigationBar: Container(
        color: Color(0xff192537),
        padding: EdgeInsets.all(10),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () {
                  setState(() {
                    mainFeedState = "explore";
                  });
                },
                child: Container(
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
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ],
                    ))),
            GestureDetector(
                onTap: () {
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
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ],
                    ))),
            GestureDetector(
                onTap: () {
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
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ],
                    ))),
          ],
        ),
      ),
    );
  }
}