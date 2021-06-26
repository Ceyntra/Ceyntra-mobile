import 'package:ceyntra_mobile/views/screens/secondaryFeed/nearYouFeed.dart';
import 'package:ceyntra_mobile/views/screens/secondaryFeed/popularFeed.dart';
import 'package:ceyntra_mobile/views/screens/secondaryFeed/suggestionsFeed.dart';

import 'package:flutter/material.dart';

class SecondaryFeedScreen extends StatefulWidget {
  final ValueChanged<String> changeMainFeedStateState;
  SecondaryFeedScreen({this.changeMainFeedStateState});
  @override
  _SecondaryFeedScreenState createState() => _SecondaryFeedScreenState();
}

class _SecondaryFeedScreenState extends State<SecondaryFeedScreen> {
  String feedState = 'nearMe';

  Widget feed(BuildContext context) {
    if (feedState == "nearMe")
      return NearYouFeedScreen(
        changeMainFeedStateState: widget.changeMainFeedStateState,
      );
    else if (feedState == "popular")
      return PopularFeedScreen();
    else if (feedState == "suggestions") return SuggestionsFeedScreen();
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff192537),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
          brightness: Brightness.dark,
          leading: Icon(Icons.menu),
          elevation: 20,
          backgroundColor: Color(0xff192537),
          actions: [
            Container(
              // color: Colors.amber,
              // padding: EdgeInsets.only(right: 10),
              width: (MediaQuery.of(context).size.width / 100) * 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          feedState = "nearMe";
                        });
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          // color: Colors.amberAccent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_on,
                                color: feedState == "nearMe"
                                    ? Colors.green[400]
                                    : Colors.amber,
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                "Near you",
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ))),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          feedState = "popular";
                        });
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                color: feedState == "popular"
                                    ? Colors.green[400]
                                    : Colors.amber,
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                "Popular",
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ))),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          feedState = "suggestions";
                        });
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.lightbulb,
                                color: feedState == "suggestions"
                                    ? Colors.green[400]
                                    : Colors.amber,
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                "Suggestions",
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ))),
                ],
              ),
            )
          ],
        ),
      ),
      body: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          feed(context),
        ],
      ),
    );
  }
}
