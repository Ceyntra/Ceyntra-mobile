import 'package:ceyntra_mobile/views/screens/clickOnThePlace/clickOnTheGuide/clickedGuideInfo.dart';
import 'package:ceyntra_mobile/views/screens/clickOnThePlace/clickOnTheTaxi/clickedTaxiInfo.dart';
import 'package:ceyntra_mobile/views/screens/clickOnThePlace/clickOnaTheHotel/clickedHotelChat.dart';
import 'package:ceyntra_mobile/views/screens/clickOnThePlace/clickOnaTheHotel/clickedHotelInfo.dart';
import 'package:ceyntra_mobile/views/screens/clickOnThePlace/clickOnaTheHotel/clickedHotelPackages.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../privateChatScreen.dart';

class clickOnTheGuideFeed extends StatefulWidget {
  // const clickOnTheGuideFeed({ Key? key }) : super(key: key);

  var clickedGuide;
  final ValueChanged<String> changeClickedOnThePlaceState;
  final ValueChanged<String> changeMainFeedStateState;
  clickOnTheGuideFeed(
      {this.clickedGuide,
      this.changeMainFeedStateState,
      this.changeClickedOnThePlaceState});

  @override
  _clickOnTheGuideFeedState createState() => _clickOnTheGuideFeedState();
}

class _clickOnTheGuideFeedState extends State<clickOnTheGuideFeed> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Color(0xff192537),
        appBar: AppBar(
          backgroundColor: Color(0xff192537),
          title: Text(
            widget.clickedGuide["firstName"] +
                " " +
                widget.clickedGuide["lastName"],
            style: GoogleFonts.montserrat(fontSize: 18, color: Colors.white),
          ),
          leading: InkWell(
            onTap: () {
              widget.changeClickedOnThePlaceState("guide");
              widget.changeMainFeedStateState("clickOnThePlace");
            },
            child: Icon(Icons.arrow_back),
          ),
          bottom: TabBar(
            labelColor: Colors.green,
            unselectedLabelColor: Colors.yellow[700],
            tabs: [
              Tab(
                icon: Icon(Icons.info),
                child: Text(
                  "Info",
                  style: GoogleFonts.montserrat(color: Colors.white),
                ),
              ),
              Tab(
                icon: Icon(Icons.chat_outlined),
                child: Text(
                  "Chat",
                  style: GoogleFonts.montserrat(color: Colors.white),
                ),
              ),
              Tab(
                icon: Icon(Icons.backpack),
                child: Text(
                  "Packages",
                  style: GoogleFonts.montserrat(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            clickedGuideInfoScreen(clickedGuideInfo: widget.clickedGuide),
            PrivateChatScreen(serviceProviderID:widget.clickedGuide["guideId"]),
            ClickedHotelPackagesScreen()
          ],
        ),
      ),
    );
  }
}
