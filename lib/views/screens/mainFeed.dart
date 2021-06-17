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
    // else if (mainFeedState == "globle")
    //   return PopulerFeedScreen();
    // else if (mainFeedState == "profile") return SuggestionsFeedScreen();
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainFeed(context),
      bottomNavigationBar: Container(
        color: Colors.amber[200],
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () {
                  setState(() {
                    mainFeedState = "explore";
                  });
                },
                child: Text("explore")),
            SizedBox(
              width: 20,
            ),
            GestureDetector(
                onTap: () {
                  setState(() {
                    mainFeedState = "globle";
                  });
                },
                child: Text("globle chat")),
            SizedBox(
              width: 20,
            ),
            GestureDetector(
                onTap: () {
                  setState(() {
                    mainFeedState = "profile";
                  });
                },
                child: Text("profile")),
          ],
        ),
      ),
    );
  }
}
