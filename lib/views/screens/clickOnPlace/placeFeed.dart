import 'package:ceyntra_mobile/views/screens/clickOnPlace/placeScreen.dart';
import 'package:ceyntra_mobile/views/screens/secondaryFeed/popularFeed.dart';
import 'package:flutter/material.dart';

class PlaceFeedScreen extends StatefulWidget {
  // const PlaceFeedScreen({ Key? key }) : super(key: key);

  @override
  _PlaceFeedScreenState createState() => _PlaceFeedScreenState();
}

class _PlaceFeedScreenState extends State<PlaceFeedScreen> {
  String feedState = 'place';

  Widget feed(BuildContext context) {
    if (feedState == "place")
      return PlaceScreen();
    else if (feedState == "weather") return PopularFeedScreen();
    // else if (feedState == "hotel") return HotelFeedScreen();
    // else if (feedState == "taxi") return TaxiFeedScreen();
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
                          feedState = "place";
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
                                color: feedState == "place"
                                    ? Colors.green[400]
                                    : Colors.amber,
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                "Place",
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ))),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          feedState = "weather";
                        });
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.cloud,
                                color: feedState == "weather"
                                    ? Colors.green[400]
                                    : Colors.amber,
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                "Weather",
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ))),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          feedState = "hotel";
                        });
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.hotel,
                                color: feedState == "hotel"
                                    ? Colors.green[400]
                                    : Colors.amber,
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                "Hotel",
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ))),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          feedState = "taxi";
                        });
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.local_taxi,
                                color: feedState == "taxi"
                                    ? Colors.green[400]
                                    : Colors.amber,
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                "Taxi",
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          )))
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
