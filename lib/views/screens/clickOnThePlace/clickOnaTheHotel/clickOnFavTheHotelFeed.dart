import 'package:ceyntra_mobile/views/screens/clickOnThePlace/clickOnaTheHotel/clickedHotelChat.dart';
import 'package:ceyntra_mobile/views/screens/clickOnThePlace/clickOnaTheHotel/clickedHotelInfo.dart';
import 'package:ceyntra_mobile/views/screens/clickOnThePlace/clickOnaTheHotel/clickedHotelPackages.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../privateChatScreen.dart';

class ClickOnTheFavHotelFeed extends StatefulWidget {
  // const ClickOnTheFavHotelFeed({ Key? key }) : super(key: key);

  var clickedHotel;
  final ValueChanged<String> changeClickedOnThePlaceState;
  final ValueChanged<String> changeMainFeedStateState;
  ClickOnTheFavHotelFeed(
      {this.clickedHotel,
      this.changeMainFeedStateState,
      this.changeClickedOnThePlaceState});

  @override
  _ClickOnTheFavHotelFeedState createState() => _ClickOnTheFavHotelFeedState();
}

class _ClickOnTheFavHotelFeedState extends State<ClickOnTheFavHotelFeed> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Color(0xff192537),
        appBar: AppBar(
          backgroundColor: Color(0xff192537),
          title: Text(
            widget.clickedHotel["name"],
            style: GoogleFonts.montserrat(fontSize: 18, color: Colors.white),
          ),
          leading: InkWell(
            onTap: () {
              // widget.changeClickedOnThePlaceState("hotel");
              widget.changeMainFeedStateState("favourites");
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
            ClickedHotelInfoScreen(
              clickedHotelInfo: widget.clickedHotel,
            ),
            PrivateChatScreen(
                serviceProviderID: widget.clickedHotel["hotelId"]),
            ClickedHotelPackagesScreen(hotelId: widget.clickedHotel["hotelId"])
          ],
        ),
      ),
    );
  }
}
