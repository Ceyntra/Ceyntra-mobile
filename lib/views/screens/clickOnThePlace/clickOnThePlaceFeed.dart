import 'package:ceyntra_mobile/views/screens/clickOnThePlace/clickedPlaceDetails.dart';
import 'package:ceyntra_mobile/views/screens/secondaryFeed/popularFeed.dart';
import 'package:flutter/material.dart';

class ClickOnThePlacePlaceFeedScreen extends StatefulWidget {
  // const ClickOnThePlacePlaceFeedScreen({ Key? key }) : super(key: key);
  final String place;
  ClickOnThePlacePlaceFeedScreen({this.place});

  @override
  _ClickOnThePlacePlaceFeedScreenState createState() =>
      _ClickOnThePlacePlaceFeedScreenState();
}

class _ClickOnThePlacePlaceFeedScreenState
    extends State<ClickOnThePlacePlaceFeedScreen> {
  String feedState = 'place';

  Widget feed(BuildContext context) {
    if (feedState == "place")
      return ClickedPlaceDetails(
        place: widget.place,
      );
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
          leading: InkWell(
              onTap: () {
                // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>))
              },
              child: Icon(Icons.arrow_back)),
          elevation: 20,
          backgroundColor: Color(0xff192537),
          actions: [
            Container(
              // color: Colors.amber,
              // padding: EdgeInsets.only(right: 10),
              width: (MediaQuery.of(context).size.width / 100) * 85,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
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
                  InkWell(
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
                          ))),
                  InkWell(
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
                  InkWell(
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
                  InkWell(
                      onTap: () {
                        setState(() {
                          feedState = "guide";
                        });
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.tour,
                                color: feedState == "guide"
                                    ? Colors.green[400]
                                    : Colors.amber,
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                "Guide",
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
