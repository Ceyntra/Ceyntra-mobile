import 'package:ceyntra_mobile/views/screens/clickOnThePlace/clickOnTheTaxi/clickedTaxiInfo.dart';
import 'package:ceyntra_mobile/views/screens/clickOnThePlace/clickOnaTheHotel/clickedHotelChat.dart';
import 'package:ceyntra_mobile/views/screens/clickOnThePlace/clickOnaTheHotel/clickedHotelInfo.dart';
import 'package:ceyntra_mobile/views/screens/clickOnThePlace/clickOnaTheHotel/clickedHotelPackages.dart';
import 'package:ceyntra_mobile/views/screens/privateChatScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ClickOnTheTaxiFeed extends StatefulWidget {
  // const ClickOnTheTaxiFeed({ Key? key }) : super(key: key);

  var clickedTaxi;
  final ValueChanged<String> changeClickedOnThePlaceState;
  final ValueChanged<String> changeMainFeedStateState;
  ClickOnTheTaxiFeed(
      {this.clickedTaxi,
      this.changeMainFeedStateState,
      this.changeClickedOnThePlaceState});

  @override
  _ClickOnTheTaxiFeedState createState() => _ClickOnTheTaxiFeedState();
}

class _ClickOnTheTaxiFeedState extends State<ClickOnTheTaxiFeed> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Color(0xff192537),
        appBar: AppBar(
          backgroundColor: Color(0xff192537),
          title: Text(
            widget.clickedTaxi["firstName"] +
                " " +
                widget.clickedTaxi["lastName"],
            style: GoogleFonts.montserrat(fontSize: 18, color: Colors.white),
          ),
          leading: InkWell(
            onTap: () {
              widget.changeClickedOnThePlaceState("taxi");
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
            ClickedTaxiInfoScreen(clickedTaxiInfo: widget.clickedTaxi),
            PrivateChatScreen(serviceProviderID:widget.clickedTaxi["taxiId"]),
            ClickedHotelPackagesScreen()
          ],
        ),
      ),
    );
  }
}
