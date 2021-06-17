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
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu),
          elevation: 20,
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
                          alignment: Alignment.center,
                          child: Text(
                            "nearj me",
                          ))),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          feedState = "populer";
                        });
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.center,
                          child: Text(
                            "populer",
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
                          child: Text(
                            "suggestions",
                          ))),
                ],
              ),
            )
          ],
        ),
        body: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            feed(context),
            Container(
                child: Image(
              width: 20,
              height: 20,
              image: AssetImage('assets/images/3.png'),
            )),
            Text("data"),
            SizedBox(
              height: 400,
            ),
            SvgPicture.asset(
              'assets/images/home.svg',
              color: Colors.amber,
              width: 80,
              height: 80,
            )
          ],
        ),
      ),
    );
  }
}
