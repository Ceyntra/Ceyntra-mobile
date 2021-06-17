import 'package:ceyntra_mobile/views/screens/nearMeFeed.dart';
import 'package:ceyntra_mobile/views/screens/populerFeed.dart';
import 'package:ceyntra_mobile/views/screens/suggestionsFeed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  String feedState = 'nearMe';

  Widget feed(BuildContext context) {
    if (feedState == "nearMe")
      return NearMeFeedScreen();
    else if (feedState == "populer")
      return PopulerFeedScreen();
    else if (feedState == "suggestions") return SuggestionsFeedScreen();
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Container(
            margin: EdgeInsets.only(top: 20, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      setState(() {
                        feedState = "nearMe";
                      });
                    },
                    child: Text("near me")),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        feedState = "populer";
                      });
                    },
                    child: Text("populer")),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        feedState = "suggestions";
                      });
                    },
                    child: Text("suggestions")),
              ],
            ),
          ),
          feed(context),
          Container(
              child: Image(
            width: 20,
            height: 20,
            image: AssetImage('assets/images/3.png'),
          )),
          Text("data"),
          SvgPicture.asset('assets/images/home.svg')
        ],
      ),
    );
  }
}
